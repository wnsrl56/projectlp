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
import com.project.model.dto.PartyNotice;
import com.project.model.dto.Quest;

@Controller
@RequestMapping(value="/pboard/")
public class PartyNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartyNoticeController.class);

	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeListGet(Map<String,Object> Map){
	    ModelAndView mv = new ModelAndView("board/partynotice/listview");
	     
        
	    return mv;
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeInsertGet(@ModelAttribute PartyNotice partynotice){
	    ModelAndView mv = new ModelAndView("board/partynotice/registerform");
	     
        
	    return mv;
	}
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	public String PartyNoticeInsertPost(MultipartHttpServletRequest req,PartyNotice partynotice,Model model,BindingResult result) {
		logger.info("partynotice.context: {}");
	     
        
	    return "redirect:listview.action";
	}

	

	
}
