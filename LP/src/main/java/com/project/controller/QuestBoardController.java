package com.project.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.dto.Board;
import com.project.model.dto.Quest;

@Controller
@RequestMapping(value="/qboard/")
public class QuestBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestBoardController.class);

	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView QuestBoardListGet(Map<String,Object> Map){
	    ModelAndView mv = new ModelAndView("board/quest/listview");
	     
        
	    return mv;
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public ModelAndView QuestInsertGet(@ModelAttribute Quest quest){
	    ModelAndView mv = new ModelAndView("board/quest/registerform");
	     
        
	    return mv;
	}
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	public String QuestInsertPost(MultipartHttpServletRequest req,Board board,Model model,BindingResult result) {
		logger.info("board.context: {}");
	     
        
	    return "redirect:listview.action";
	    
	    
	}

	

	
}
