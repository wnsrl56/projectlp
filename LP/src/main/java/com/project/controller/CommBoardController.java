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

import com.project.common.ChangeTime;
import com.project.model.dto.Comm;
import com.project.model.dto.CommReply;
import com.project.model.service.CommReplyService;
import com.project.model.service.CommService;

@Controller
@RequestMapping(value="/cboard/")
public class CommBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommBoardController.class);
	
	
	@Autowired
	@Qualifier("commService")
	private CommService commService;
	
	@Autowired
	@Qualifier("commReplyService")
	private CommReplyService commReplyService;
	
	
	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	public ModelAndView CommBoardListGet(@ModelAttribute Comm comm){
		 ModelAndView mv = new ModelAndView("board/comm/listview");
		//list 가져오기
		//List<Comm> comms = commService.selectAllCommList();
		int end =2;
		//최근 갯수 가져오기
		List<Comm> comms = commService.selectCommListOrderByDesc(0,end);
		
		
		List<CommReply>[] AllReplies = null;
		List<CommReply> replies = null;
		//test
		
			if(comms == null){
				
				System.out.println("에러에러");
			}
		
			for(int i=0;i<comms.size();i++){
				
				comms.get(i).setReply(commReplyService.selectCommReplyListOrderByDesc(0,3, comms.get(i).getCommNo()));
				
			
			}
			
			//System.out.println(comms.get(0).getReply().get(0).getContext());
			
			String datechange = null;
			
			
			for(int index=0; index<comms.size();index++){
			 ChangeTime ct = new ChangeTime();
			 datechange = ct.changeDate(comms.get(index).getRegDate());
			 comms.get(index).setDateChanged(datechange);
			// System.out.println("날짜데이터"+comms.get(index).getDateChanged());
			}
			
		/*	for(int index=0; index<replies.size();index++){
				 ChangeTime ct = new ChangeTime();
				  datechange = ct.changeDate(replies.get(index).getRegDate());
				  replies.get(index).setDateChanged(datechange);
				  //System.out.println("날짜데이터"+replies.get(index).getDateChanged());
				 }*/
		
			
				
			System.out.println("secces");
			
			
		
		
		
	   
	    //System.out.println(comms.get(0).getContext());
	    
	    mv.addObject("comms",comms);
	    
	    
	
	    
	    
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
		
		System.out.println(commReply.getContext()+commReply.getCommNo()+commReply.getWriter());
		
		
		//삽입
		commReplyService.insertCommReply(commReply);
		
        
	    return "success";
	}
	
	

}
