package global.sesoc.whydont;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.whydont.dao.MemberDao;
import global.sesoc.whydont.dao.TrainerDao;
import global.sesoc.whydont.vo.Gmember;
import global.sesoc.whydont.vo.Gtrainer;


@Controller
public class HomeController {
	
	@Autowired MemberDao dao;
	@Autowired TrainerDao tdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(value = "deleted", defaultValue = "") String deleted, Model model,HttpSession session) {
		model.addAttribute("deleted", deleted);
		
		if(session.getAttribute("loginId") != null) {
			String mid = (String) session.getAttribute("loginId");
				
				Gmember gm = dao.getOne(mid);
				if(gm != null) {
					String tid = gm.getTid();
					if(tid != null) {
						Gtrainer trainer = tdao.getOne(tid);
						model.addAttribute("trainer",trainer);
					}
					model.addAttribute("gm",gm);
				}
				
			}
		
		
		
		
		return "home";
	}
	
}
