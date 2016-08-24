package com.project.mobile.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

import com.google.gson.Gson;
import com.project.common.ChangeTime;
import com.project.model.dto.Comm;
import com.project.model.dto.CommReply;
import com.project.model.service.CommReplyService;
import com.project.model.service.CommService;

@Controller
@RequestMapping(value="/mcboard/")
public class mCommBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(mCommBoardController.class);
	
	
	@Autowired
	@Qualifier("commService")
	private CommService commService;
	
	@Autowired
	@Qualifier("commReplyService")
	private CommReplyService commReplyService;
	
	
	@RequestMapping(value = "commlistView.action", method = RequestMethod.POST)
	public void commlistview(HttpServletResponse resp){
		String datelength2 = null;
		

		List<Comm> comms = commService.selectAllCommListOrderBy();
		
		
		for(int index=0; index<comms.size();index++){
			 ChangeTime ct = new ChangeTime();
			 datelength2 = ct.changeDate(comms.get(index).getRegDate());
			 comms.get(index).setDateChanged(datelength2);
			 String parsedate = (new SimpleDateFormat("MM월 dd일 hh시 mm분")).format(comms.get(index).getRegDate());
			 comms.get(index).setRegDateStr(parsedate);
			 System.out.println("날짜데이터"+comms.get(index).getDateChanged());
			}

		Gson gson = new Gson();
		PrintWriter writer;
		if (!comms.isEmpty()) {
			try {
				resp.setContentType("text/plain;charset=euc-kr");
				writer = resp.getWriter();
			
				String json = null;
				json = gson.toJson(comms);
				
				System.out.println(json);
								
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	
	
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
	

	@RequestMapping(value="insertComm.action", method = RequestMethod.POST)
	@ResponseBody
	public String QuestInsertGet(@RequestBody Comm comm) {
		
		if (comm != null) {
			System.out.println(comm);
				commService.insertComm(comm);
				return "Success";
		} else {
			return "Fail";
		}
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
