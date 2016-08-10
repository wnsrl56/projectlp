package com.project.controller;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.service.BoardService;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="listview.action")
	public ModelAndView BoardList(Map<String,Object> Map) throws Exception{
	    ModelAndView mv = new ModelAndView("board/boardlist");
	     
	    List<Map<String,Object>> list = boardService.selectAllBoardList(Map);
        mv.addObject("boardlist", list);
	    return mv;
	}
	
	}
	

