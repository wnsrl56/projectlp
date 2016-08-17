package com.project.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.dto.PartyNotice;
import com.project.model.dto.Quest;
import com.project.model.service.BoardService;
import com.project.model.service.PartyNoticeService;

@Controller
@RequestMapping(value="/pboard/")
public class PartyNoticeController {
	
	
	@Autowired
	@Qualifier("partynoticeService")
	private PartyNoticeService partynoticeservice;
	

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(PartyNoticeController.class);

	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeListGet(PartyNotice partynotice){
	    ModelAndView mv = new ModelAndView("board/partynotice/listview");
	    List<PartyNotice> partynotices = partynoticeservice.selectAllPartyNoticeList();
	   
	    
	    mv.addObject("partynotices", partynotices);
		mv.addObject("partynotice", partynotice);
		
		
	    return mv;
	    
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeInsertGet(@ModelAttribute PartyNotice partynotice,Model model){
	    ModelAndView mv = new ModelAndView("board/partynotice/registerform");

	   
	    model.addAttribute("partynotice",partynotice);
       
        
	    return mv;
	}
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	public String PartyNoticeInsertPost(MultipartHttpServletRequest req,PartyNotice partynotice ,Model model,BindingResult result) {
		/*logger.info("partynotice.context: {}");*/
	  
		
		
		
		int memberNo =  Integer.parseInt(req.getParameter("memberNo")); 
		//boardService.insertBoard();
		int boardNo = boardService.selectBoardNo(memberNo);	
		
		partynotice.setBoardNo(boardNo);
		
		partynoticeservice.insertPartyNotice(partynotice);
		
		 System.out.println(partynotice.getTitle());
		 
	    return "redirect:listview.action";
	}

	

	
}
