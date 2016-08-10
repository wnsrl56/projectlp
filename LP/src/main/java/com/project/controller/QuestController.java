package com.project.controller;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.service.BoardService;
import com.project.model.service.QuestService;

@Controller
@RequestMapping(value="/quest/")
public class QuestController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="questService")
	private QuestService questService;
	
	@RequestMapping(value="questlistview.action")
	public ModelAndView QuestList(Map<String,Object> Map) throws Exception{
	    ModelAndView mv = new ModelAndView("quest/questlist");
	     
	    List<Map<String,Object>> list = questService.selectAllQuestList(Map);
        mv.addObject("questlist", list);
	    return mv;
	}
	
	}
	

