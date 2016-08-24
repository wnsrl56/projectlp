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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.common.ChangeTime;
import com.project.model.dto.PartyNotice;
import com.project.model.service.BoardService;
import com.project.model.service.PartyNoticeService;

@Controller
@RequestMapping(value = "/mpboard/")
public class mPartyNoticeController {

	@Autowired
	@Qualifier("partynoticeService")
	private PartyNoticeService partynoticeservice;

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(mPartyNoticeController.class);

	@RequestMapping(value = "listview.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeListGet(PartyNotice partynotice) {
		ModelAndView mv = new ModelAndView("board/partynotice/listview");
		List<PartyNotice> partynotices = partynoticeservice.selectAllPartyNoticeList();

		List<String> datelength = null;
		String datelength2 = null;

		for (int index = 0; index < partynotices.size(); index++) {
			ChangeTime ct = new ChangeTime();
			datelength2 = ct.changeDate(partynotices.get(index).getRegDate());
			partynotices.get(index).setDateChanged(datelength2);
			System.out.println("날짜데이터" + partynotices.get(index).getDateChanged());
		}

		mv.addObject("partynotices", partynotices);
		mv.addObject("partynotice", partynotice);

		return mv;

	}

	@RequestMapping(value = "insert.action", method = RequestMethod.GET)
	public ModelAndView PartyNoticeInsertGet(@ModelAttribute PartyNotice partynotice, Model model) {
		ModelAndView mv = new ModelAndView("board/partynotice/registerform");

		model.addAttribute("partynotice", partynotice);

		return mv;
	}

	@RequestMapping(value = "partylistView.action", method = RequestMethod.POST)
	public void partylistview(HttpServletResponse resp) {
		String datelength2 = null;

		List<PartyNotice> partyNotices = (List) partynoticeservice.selectAllPartyNoticeListByReg();

		for (int index = 0; index < partyNotices.size(); index++) {
			ChangeTime ct = new ChangeTime();
			datelength2 = ct.changeDate(partyNotices.get(index).getRegDate());
			partyNotices.get(index).setDateChanged(datelength2);
			String parsedate = (new SimpleDateFormat("yyyy년 MM월 dd일")).format(partyNotices.get(index).getRegDate());
			partyNotices.get(index).setRegDateStr(parsedate);
			System.out.println("날짜데이터" + partyNotices.get(index).getDateChanged());
		}
		Gson gson = new Gson();
		PrintWriter writer;
		if (!partyNotices.isEmpty()) {
			try {
				resp.setContentType("text/plain;charset=euc-kr");
				writer = resp.getWriter();
			
				String json = null;
				json = gson.toJson(partyNotices);
				
				System.out.println(json);
								
				writer.println(json);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

		//Gson gson = new Gson();
		//String json = gson.toJson(partyNotices);
		//return json;
	}
	

	@RequestMapping(value = "insert.action", method = RequestMethod.POST)
	public String PartyNoticeInsertPost(MultipartHttpServletRequest req, PartyNotice partynotice, Model model,
			BindingResult result) {
		/* logger.info("partynotice.context: {}"); */

		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		// boardService.insertBoard();
		int boardNo = boardService.selectBoardNo(memberNo);

		partynotice.setBoardNo(boardNo);

		partynoticeservice.insertPartyNotice(partynotice);

		System.out.println(partynotice.getTitle());

		return "redirect:listview.action";
	}

	@RequestMapping(value = "delete.action", method = RequestMethod.POST)
	@ResponseBody
	public String PartyNoticeDeleteGet(@RequestBody PartyNotice partynotice, BindingResult result) {
		ModelAndView mv = new ModelAndView("board/partynotice/listview");

		System.out.println(partynotice.getNoticeNo());

		int noticeNo = partynotice.getNoticeNo();

		if (noticeNo <= 0) {
			return "redirect:/board/partynotice/listview.action";
		}

		partynoticeservice.deletePartyNoticeByIndex(noticeNo);

		return "redirect:/board/partynotice/listview.action";
	}

}
