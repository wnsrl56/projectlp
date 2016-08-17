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

import com.project.model.dto.ManagerEvent;
import com.project.model.dto.PartyNotice;
import com.project.model.dto.Quest;
import com.project.model.service.BoardService;
import com.project.model.service.ManagerEventService;
import com.project.model.service.PartyNoticeService;

@Controller
@RequestMapping(value="/eboard/")
public class ManagerEventController {
	
	
	@Autowired
	@Qualifier("managereventService")
	private ManagerEventService managereventservice;
	

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerEventController.class);

	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView ManagerEventListGet(ManagerEvent managerevent){
	    ModelAndView mv = new ModelAndView("board/me/listview");
	    List<ManagerEvent> managerevents = managereventservice.selectAllManagerEventList();
	   
	    
	 mv.addObject("managerevents", managerevents);
	mv.addObject("managerevent", managerevent);
		
		
	    return mv;
	    
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public ModelAndView ManagerEventInsertGet(@ModelAttribute ManagerEvent managerevent,Model model){
	    ModelAndView mv = new ModelAndView("board/me/registerform");

	   
	    model.addAttribute("managerevent",managerevent);
       
        
	    return mv;
	}
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	public String ManagerEventInsertPost(MultipartHttpServletRequest req,ManagerEvent managerevent ,Model model,BindingResult result) {
		/*logger.info("partynotice.context: {}");*/
	  
		
		
		
		int memberNo =  Integer.parseInt(req.getParameter("memberNo")); 
		//boardService.insertBoard();
		int boardNo = boardService.selectBoardNo(memberNo);	
		
		managerevent.setBoardNo(boardNo);
		
		managereventservice.insertManagerEvent(managerevent);
		
		 
		 
	    return "redirect:listview.action";
	}

	

	
}
