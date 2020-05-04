package global.sesoc.whydont;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.whydont.dao.MemberDao;
import global.sesoc.whydont.dao.TrainerDao;
import global.sesoc.whydont.util.FileService;
import global.sesoc.whydont.vo.Gmember;
import global.sesoc.whydont.vo.Gtrainer;

@Controller
public class PageController {

	@Autowired
	MemberDao dao;
	@Autowired
	TrainerDao tdao;

	// 파일 경로
	final String uploadPath = "/Users/yoonjiha/Desktop/uploadPath";

	// 로그인 페이지 요청
	@GetMapping("/login")
	public String goLogin() {
		return "member/login";
	}

	// 회원가입 페이지 요청
	@GetMapping("/join")
	public String goJoin() {
		return "member/join";
	}

	// 회원가입 성공에 따라 페이지 보내주기
	@PostMapping("/join")
	public String afterJoin(Gmember gm) {
		int res = dao.insertM(gm);
		if (res > 0) {
			return "member/login";
		} else {
			return "redirect:join";
		}
	}

	// 로그인하고 성공여부에따라서 페이지 뿌리기
	@PostMapping("/login")
	public String afterLogin(Gmember gm, String what, boolean rememberMe, Model model, HttpServletResponse response,
			HttpSession session) {

		// 아이디 기억하기 쿠키 추가
		if (rememberMe) {
			Cookie cookie = new Cookie("savedId", gm.getMid());
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("savedId", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		if (what.equals("member")) {
			Gmember m = dao.selectOne(gm);
			// 대조결과가 있을때
			if (m != null) {
				// 세션스코프에 아이디,비밀번호,이름 저장
				session.setAttribute("loginId", m.getMid());
				session.setAttribute("loginPwd", m.getMpwd());
				session.setAttribute("loginName", m.getMname());
				return "redirect:/";
			} else {
				// 대조결과가 없을때
				// 모델에 실패 메세지 넣어서 로그인 페이지 다시 뿌리기
				model.addAttribute("fail", "아이디 혹은 비밀번호가 일치하지 않습니다");
				return "member/login";
			}
		} else if (what.equals("trainer")) {
			Gtrainer gt = new Gtrainer();
			gt.setTid(gm.getMid());
			gt.setTpwd(gm.getMpwd());
			Gtrainer t = tdao.tselectOne(gt);
			// 대조결과가 있을때
			if (t != null) {
				// 세션스코프에 아이디,비밀번호,이름 저장
				session.setAttribute("tloginId", t.getTid());
				session.setAttribute("tloginPwd", t.getTpwd());
				session.setAttribute("tloginName", t.getTname());
				return "redirect:/";
			} else {
				// 대조결과가 없을때
				// 모델에 실패 메세지 넣어서 로그인 페이지 다시 뿌리기
				model.addAttribute("fail", "아이디 혹은 비밀번호가 일치하지 않습니다");
				return "member/login";
			}
		}
		return "member/login";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 트레이너 등록페이지 요청
	@GetMapping("/trainerJoin")
	public String gotjoin() {
		return "trainer/trainerJoin";
	}

	// 트레이너 등록후
	@PostMapping("/tjoin")
	public String aftertjoin(Gtrainer gt) {

		int res = tdao.insertT(gt);
		if (res > 0) {
			return "member/login";
		} else {
			return "redirect:tjoin";
		}
	}

	// 회원정보 수정 페이지요청
	@GetMapping("/mUpdate")
	public String mUpdate(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("loginId");
		Gmember gm = dao.getOne(mid);
		model.addAttribute("member", gm);
		return "member/mUpdate";
	}

	// 회원정보 수정!
	@PostMapping("/mUpdate")
	public String mUp(Gmember gm, HttpSession session, MultipartFile upload) {
		// 파일을 DB 에 저장
				String savedFilename = FileService.saveFile(upload, uploadPath);
				String originalFilename = upload.getOriginalFilename();

				// 파일을 바꾸면 전에있던 파일은 삭제하고 등록
				if (gm.getOriginalfilename() != originalFilename && !upload.isEmpty()) {
					String fullPath = uploadPath + "/" + gm.getSavedfilename();
					FileService.deleteFile(fullPath);
					gm.setOriginalfilename(originalFilename);
					gm.setSavedfilename(savedFilename);

					int res = dao.mUpdate(gm);
					// 수정에 성공하면 세션에 비번이랑 이름 바꿔서 넣어주기
					if (res > 0) {
						session.setAttribute("loginPwd", gm.getMpwd());
						session.setAttribute("loginName", gm.getMname());
					}
					return "redirect:/";

				}
				// 전에 파일이 없으면 걍 등록
				gm.setOriginalfilename(originalFilename);
				gm.setSavedfilename(savedFilename);

				int res = dao.mUpdate(gm);
				// 수정에 성공하면 세션에 비번이랑 이름 바꿔서 넣어주기
				if (res > 0) {
					session.setAttribute("tloginPwd", gm.getMpwd());
					session.setAttribute("tloginName", gm.getMname());
				}
				return "redirect:/";
	}

	// 트레이너 정보수정 페이지요청
	@GetMapping("/tUpdate")
	public String tUpdate(HttpSession session, Model model) {
		String tid = (String) session.getAttribute("tloginId");
		Gtrainer gt = tdao.getOne(tid);
		model.addAttribute("trainer", gt);
		return "trainer/tUpdate";
	}

	// 트레이너 정보 수정
	@PostMapping("/tUpdate")
	public String tUP(Gtrainer gt, HttpSession session, MultipartFile upload) {

		// 파일을 DB 에 저장
		String savedFilename = FileService.saveFile(upload, uploadPath);
		String originalFilename = upload.getOriginalFilename();

		// 파일을 바꾸면 전에있던 파일은 삭제하고 등록
		if (gt.getOriginalfilename() != originalFilename && !upload.isEmpty()) {
			String fullPath = uploadPath + "/" + gt.getSavedfilename();
			FileService.deleteFile(fullPath);
			gt.setOriginalfilename(originalFilename);
			gt.setSavedfilename(savedFilename);

			int res = tdao.tUpdate(gt);
			// 수정에 성공하면 세션에 비번이랑 이름 바꿔서 넣어주기
			if (res > 0) {
				session.setAttribute("tloginPwd", gt.getTpwd());
				session.setAttribute("tloginName", gt.getTname());
			}
			return "redirect:/";

		}
		// 전에 파일이 없으면 걍 등록
		gt.setOriginalfilename(originalFilename);
		gt.setSavedfilename(savedFilename);

		int res = tdao.tUpdate(gt);
		// 수정에 성공하면 세션에 비번이랑 이름 바꿔서 넣어주기
		if (res > 0) {
			session.setAttribute("tloginPwd", gt.getTpwd());
			session.setAttribute("tloginName", gt.getTname());
		}
		return "redirect:/";
	}

	// 회원 탈퇴
	@GetMapping("/deleteM")
	public String deleteM(String mid, RedirectAttributes rttr, HttpSession session) {
		int res = dao.deleteM(mid);
		if (res > 0) {
			// 삭제되었다는 신호주기
			rttr.addAttribute("delete", "deleted");
			// 삭제되면 세션도 다 삭제
			session.invalidate();
		}
		return "redirect:/";
	}

	// 트레이너 탈퇴
	@GetMapping("/deleteT")
	public String deleteT(String tid, RedirectAttributes rttr, HttpSession session) {
		int res = tdao.deleteT(tid);
		if (res > 0) {
			// 삭제되었다는 신호주기
			rttr.addAttribute("delete", "deleted");
			// 삭제되면 세션도 다 삭제
			session.invalidate();
		}
		return "redirect:/";
	}

	// 트레이너 리스트
	@GetMapping("/trainerList")
	public String goTlist(Model model) {
		// 리스트 받아오기
		ArrayList<Gtrainer> trainerList = new ArrayList<>();

		trainerList = tdao.getList();
		// 받아서 페이지로

		model.addAttribute("trainerList", trainerList);
		return "trainer/trainerList";
	}

	// PT권 구매 페이지
	@GetMapping("/buy")
	public String goBuy(@RequestParam(defaultValue = "0", value = "cupon") int cupon, HttpSession session) {
		// cupon 값이 1로 왔을때 회원의 쿠폰을 1 플러스 하기
		int res = 0;

		String mid = (String) session.getAttribute("loginId");
		if (cupon == 1) {
			res = dao.cuponU(mid);
		}

		if (res > 0) {

			return "redirect:/";
		}
		return "buy";
	}

	// 결제페이지...
	@GetMapping("/pay")
	public String goPay() {
		return "pay";
	}

	// 회원관리 페이지
	@GetMapping("/memberCare")
	public String goMemberCare(HttpSession session, Model model) {
		//자신의 아이디가 tid인 멤버들 리스트 불러오기..
		String tid=(String)session.getAttribute("tloginId");
		List<Gmember> list = dao.getPt(tid);
		for(int i=0; i<list.size(); i++) {
			String seinen=list.get(i).getMidno().substring(0, 6);
			list.get(i).setSeinen(seinen);
		}
		model.addAttribute("list",list);
		return "trainer/memberCare";
	}
	//about
	@GetMapping("/about")
	public String about() {
		return "about";
	}
}
