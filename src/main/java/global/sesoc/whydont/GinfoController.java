package global.sesoc.whydont;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.whydont.dao.GinfoDao;
import global.sesoc.whydont.dao.GreplyDao;
import global.sesoc.whydont.dao.MemberDao;
import global.sesoc.whydont.dao.TrainerDao;
import global.sesoc.whydont.util.FileService;
import global.sesoc.whydont.util.PageNavigator;
import global.sesoc.whydont.vo.Ginfo;
import global.sesoc.whydont.vo.Gmember;
import global.sesoc.whydont.vo.Gtrainer;

@Controller
public class GinfoController {
	
	@Autowired GinfoDao dao;
	@Autowired GreplyDao rdao;
	@Autowired TrainerDao tdao;
	@Autowired MemberDao mdao;
	
	//파일 경로
	final String uploadPath="/Users/yoonjiha/Desktop/uploadPath";
	
	//공지사항 리스트
	@GetMapping("/ginfo")
	public String ginfo(@RequestParam(value = "searchItem", defaultValue = "title") String searchItem,
						@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
						@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		
		
		
		int totalRecordCount = dao.ginfoCount(searchItem, searchWord);
		// 2)RowBounds 를 이용한 방식
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		List<Ginfo> ginfoList = dao.ginfoList(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());
		//글번호에 해당하는 댓글갯수를 찾아서 보드 Vo에 넣어주기
		for(int i=0;i<ginfoList.size();i++) {
			ginfoList.get(i).setGreplycount(rdao.replycount(ginfoList.get(i).getInfono()));
			
		}
		model.addAttribute("ginfoList", ginfoList);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		

		return "ginfo/ginfo";
	}
	//글등록 화면 요청
		@RequestMapping(value = "/ginfoWrite", method = RequestMethod.GET)
		public String ginfoWrite(HttpSession session,Model model) {
			String tid = (String) session.getAttribute("tloginId");
			Gtrainer trainer = tdao.getOne(tid);
			model.addAttribute("trainer",trainer);
			return "ginfo/ginfoWrite";
		}
		//글 등록 요청
		@RequestMapping(value = "/ginfoWrite", method = RequestMethod.POST)
		public String boardWrite(Ginfo ginfo, MultipartFile upload, HttpSession session) {
			
			// DB 에 저장
			String savedFilename = FileService.saveFile(upload, uploadPath);
			String originalFilename = upload.getOriginalFilename();
			ginfo.setOriginalfilename(originalFilename);
			ginfo.setSavedfilename(savedFilename);

			dao.ginfoWrite(ginfo);
			return "redirect:ginfo";
		}
		//글 하나 보기
		@RequestMapping(value = "/ginfoDetail", method = RequestMethod.GET)
		public String boardDetail(int infono, Model model, boolean nohit, 
				@RequestParam(value = "replytext", defaultValue = "")String replytext,
				@RequestParam(value = "replyno", defaultValue = "0")int replyno,
				@RequestParam(value = "searchItem", defaultValue = "title") String searchItem, 
				@RequestParam(value = "searchWord", defaultValue = "") String searchWord, 
				@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpSession session) {
			// db에서 번호에 해당하는 내용 가져오기
			Ginfo ginfo = dao.ginfoDetail(infono);
			if(session.getAttribute("loginId") != null) {
				String mid = (String) session.getAttribute("loginId");
				 Gmember gm = mdao.getOne(mid);
				 model.addAttribute("gm", gm);
			}
			if(session.getAttribute("tloginId") != null) {
				String tid = (String) session.getAttribute("tloginId");
				Gtrainer trainer = tdao.getOne(tid);
				model.addAttribute("trainer",trainer);
			}
			
			model.addAttribute("ginfo", ginfo);
			model.addAttribute("searchItem", searchItem);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("replytext",replytext);
			model.addAttribute("replyno",replyno);
			// 조회수
			if (!nohit) {
				dao.updateHit(infono);
			}
			return "/ginfo/ginfoDetail";
		}
		//게시글 삭제
		@RequestMapping(value = "/deleteGinfo", method = RequestMethod.GET)
		public String deleteGinfo(int infono) {
			Ginfo oldBoard = dao.ginfoDetail(infono);
			String fullPath= uploadPath +"/"+ oldBoard.getSavedfilename();
			
			boolean del = FileService.deleteFile(fullPath);
			
			int result = dao.deleteGinfo(infono);

			return "redirect:ginfo";
		}

		// 업데이트 페이지
		@RequestMapping(value = "/updateGinfo", method = RequestMethod.GET)
		public String updateGinfo(int infono, Model model) {
			Ginfo ginfo = dao.ginfoDetail(infono);
			model.addAttribute("ginfo", ginfo);

			return "/ginfo/updateGinfo";
		}

		// 업데이트 수행
		@RequestMapping(value = "/updateGinfo", method = RequestMethod.POST)
		public String updateBoard(Ginfo ginfo, RedirectAttributes rttr, MultipartFile upload) {
			//새로 업로드 하기전 보드 정보 가져오기
			Ginfo genbo= dao.ginfoDetail(ginfo.getInfono());
			String savedFilename = FileService.saveFile(upload, uploadPath);
			String originalFilename = upload.getOriginalFilename();
			int infono = ginfo.getInfono();
			boolean nohit = true;
			rttr.addAttribute("infono", infono);
			rttr.addAttribute("nohit", nohit);
			//파일을 바꾸면 전에있던 파일은 삭제하고 등록
			if(genbo.getOriginalfilename() != originalFilename && !upload.isEmpty()) {
				String fullPath= uploadPath +"/"+ genbo.getSavedfilename();
				FileService.deleteFile(fullPath);
				ginfo.setOriginalfilename(originalFilename);
				ginfo.setSavedfilename(savedFilename);

					dao.updateGinfo(ginfo);
					return "redirect:ginfoDetail";
				}
			ginfo.setOriginalfilename(genbo.getOriginalfilename());
			ginfo.setSavedfilename(genbo.getSavedfilename());
				dao.updateGinfo(ginfo);
			return "redirect:ginfoDetail";
		}
		@GetMapping("/download")
		public String download(int infono, HttpServletResponse response) {
			Ginfo ginfo = dao.ginfoDetail(infono);

			String savedfilename= ginfo.getSavedfilename();
			String originalfilename=ginfo.getOriginalfilename();
			try {
				response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(originalfilename, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//실제 파일 내보내는작업 클라이언트 쪽으로
			String fullPath = uploadPath +"/"+ savedfilename;
			FileInputStream filein = null;
			ServletOutputStream fileout= null;
			
			try {
				filein = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				FileCopyUtils.copy(filein, fileout);
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		//파일만 삭제
		@GetMapping("/deleteFile")
		public String deleteFile(int infono, RedirectAttributes rttr) {

			Ginfo oldGinfo = dao.ginfoDetail(infono);
			String fullPath= uploadPath +"/"+ oldGinfo.getSavedfilename();
			
			boolean del = FileService.deleteFile(fullPath);
			
			if(del) {
				oldGinfo.setOriginalfilename("");
				oldGinfo.setSavedfilename("");
				dao.updateGinfo(oldGinfo);
			}
			rttr.addAttribute("infono",infono);
			return "redirect:ginfoDetail";
		}
}
