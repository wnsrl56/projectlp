package com.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.dto.Comm;
import com.project.model.service.CommService;

@Controller
@RequestMapping(value="/cboard/")
public class CommBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommBoardController.class);
	
	
	@Autowired
	@Qualifier("commService")
	private CommService commService;
	
	
	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView CommBoardListGet(@ModelAttribute Comm comm ){
		
		
	    ModelAndView mv = new ModelAndView("board/comm/listview");
	    
	    
	    return mv;
	}
	

	
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	@ResponseBody
	public String CInsertPost(@RequestBody Comm comm,Model model,BindingResult result) {
		logger.info("board.context: {}");
		
		System.out.println(comm.getTitle()+":"+comm.getContext()+":"+comm.getWriter());
		
		commService.insertComm(comm);
		
        
	    return "success";
	}
	
	

}
