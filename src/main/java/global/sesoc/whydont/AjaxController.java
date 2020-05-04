package global.sesoc.whydont;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import global.sesoc.whydont.dao.GreplyDao;
import global.sesoc.whydont.dao.MemberDao;
import global.sesoc.whydont.dao.TrainerDao;
import global.sesoc.whydont.vo.Gmember;
import global.sesoc.whydont.vo.Greply;
import global.sesoc.whydont.vo.Gtrainer;

@RestController
public class AjaxController {
	@Autowired MemberDao dao;
	@Autowired TrainerDao tdao;
	@Autowired GreplyDao rdao;
	
	//아이디중복확인
	@GetMapping("/idCheck")
	public String idCheck(String mid) {
		Gmember gm = dao.idCheck(mid);
		Gtrainer gt = tdao.tidCheck(mid);
		if(gm == null&& gt == null) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//트레이너 아이디 중복확인
	@GetMapping("/tidCheck")
	public String tidCheck(String tid) {
		Gtrainer gt = tdao.tidCheck(tid);
		Gmember gm = dao.idCheck(tid);
		if(gt == null&& gm==null) {
			return "success";
		}else {
			return "fail";
		}
	}
	//ㄹㅣ플 가져오깃
	@GetMapping("/replyAll")
	public List<Greply> replyAll(int infono) {
		List<Greply> replyList = rdao.replyList(infono);
		return replyList;
	}
	//댓글작성
	@PostMapping("/replyWrite")
	public String replyWrite(Greply greply, HttpSession session) {
		String writer="";
		if(session.getAttribute("loginId") != null) {
			String mid = (String) session.getAttribute("loginId");
			 Gmember gm =dao.getOne(mid);
			 writer=gm.getMname();
			 greply.setMid(mid);
		}
		if(session.getAttribute("tloginId") != null) {
			String tid = (String) session.getAttribute("tloginId");
			Gtrainer trainer = tdao.getOne(tid);
			writer=trainer.getTname();
			greply.setTid(tid);
		}
		greply.setWriter(writer);
		
		int result = rdao.replyWrite(greply);
		if (result == 1)
			return "success";
		else
		return "fault";
	}
	//댓글 삭제
	@GetMapping("/replyDelete")
	public String replyDelete(int replyno) {

		int result = rdao.replyDelete(replyno);
		if (result == 1) {
			return "success";
		}
		return "fault";
	}
	//댓글 수정
	@PostMapping("/replyUpdate")
	public String reU(Greply greply) {
		int result = rdao.reU(greply);
		if (result == 1) {
			return "success";
		}
		return "fail";
	}
	//피티등록
	@PostMapping("/pton")
	public String pton(String tid, String mid, HttpSession session) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("tid", tid);
		map.put("mid", mid);
		Gmember gm = dao.getOne(mid);
		
		
		
		//신청하려는 트레이너가 기존 트레이너와 다를때 남은 횟수 0으로 하고 다시 플러스10 같을때는 기존 횟수에다가 플러스10
		if(gm.getTid() != null) {
			if(gm.getTid().equals(tid)) {
				int nokori=gm.getNokori()+10;
				System.out.println(nokori);
				map.put("nokori", nokori);
			}else {
				gm.setNokori(0);
				int nokori=gm.getNokori()+10;
				
				map.put("nokori", nokori);
			}
		}else {
			
			int nokori=gm.getNokori()+10;
			
			map.put("nokori", nokori);
		}
		
		//쿠폰이 1개 이상일때부터 실행 되게
		if(gm.getCupon()>0) {
			int res = dao.pton(map);
			if(res>0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	//담당회원들 가져오기
	@PostMapping("/getPt")
	public List<Gmember> getPt(String tid) {
		//자신의 아이디를 갖고 있는 회원들 가져오기
		List<Gmember> list = dao.getPt(tid);
		return list;
	}
	//남은횟수 -1 하깃
	@PostMapping("/saku")
	public String saku(String mid) {
		int res= dao.saku(mid);
		if(res>0) {
			Gmember gm = dao.getOne(mid);
			if(gm.getNokori()==0) {
				dao.deletePt(gm.getMid());
				return "nonokori";
			}
			return "success";
		}else {
			return "fail";
		}
	}
	//피티취소
	@PostMapping("/nopt")
	public String nopt(String mid) {
		int res = dao.deletePt(mid);
		if(res>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
}