package com.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.dto.Comm;

@Controller
@RequestMapping(value="/cboard/")
public class CommBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommBoardController.class);
	
	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView CommBoardListGet( ){
		
		
	    ModelAndView mv = new ModelAndView("board/comm/listview");
	    
	    
	    return mv;
	}
	

	
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	@ResponseBody
	public String CInsertPost(String data,Model model,BindingResult result) {
		logger.info("board.context: {}");
	     
		
        
	    return "success";
	}
	
	

}
