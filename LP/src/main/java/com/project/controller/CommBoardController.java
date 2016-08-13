package com.project.controller;

import java.util.List;

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
import com.project.model.dto.CommReply;
import com.project.model.service.CommService;

@Controller
@RequestMapping(value="/cboard/")
public class CommBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommBoardController.class);
	
	
	@Autowired
	@Qualifier("commService")
	private CommService commService;
	
	
	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView CommBoardListGet(@ModelAttribute Comm comm,@ModelAttribute CommReply commReply){
		
		//list 가져오기
		//List<Comm> comms = commService.selectAllCommList();
		
		//최근 갯수 가져오기
		List<Comm> comms = commService.selectCommListOrderByDesc(0,2);
		
		
		String[] aaa = {"hh","11","22"};
		
		
	    ModelAndView mv = new ModelAndView("board/comm/listview");
	    System.out.println(comms.get(0).getContext());
	    mv.addObject("comms",comms);
	    mv.addObject("aaa",aaa);
	    return mv;
	}
	

	
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	@ResponseBody
	public String CInsertPost(@RequestBody Comm comm,Model model,BindingResult result) {
		logger.info("board.context: {}");
		
		System.out.println(comm.getTitle()+":"+comm.getContext()+":"+comm.getWriter());
		
		
		//삽입
		commService.insertComm(comm);
		
        
	    return "success";
	}
	
	@RequestMapping(value="insertReply.action", method = RequestMethod.POST)
	@ResponseBody
	public String CInsertReplyPost(@RequestBody CommReply commReply,Model model,BindingResult result) {
		logger.info("board.reply: {}");
		
		System.out.println(commReply.getContext());
		
		
		//삽입
		//commService.insertComm(comm);
		
        
	    return "success";
	}
	
	

}
