package com.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.common.Util;
import com.project.model.dto.Board;
import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;
import com.project.model.dto.Tag;
import com.project.model.service.BoardService;
import com.project.model.service.QuestService;

@Controller
@RequestMapping(value="/qboard/")
public class QuestBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestBoardController.class);
	
	@Autowired
	@Qualifier("questService")
	private QuestService questService;
	
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	

	@RequestMapping(value="listview.action", method = RequestMethod.GET)
	/*public ModelAndView QuestBoardListGet(Map<String,Object> Map){*/
	public ModelAndView QuestBoardListGet(Quest quest){
	    ModelAndView mv = new ModelAndView("board/quest/listview");
	
	    List<Quest> quests = questService.selectAllQuests();
/*	    QPicture qpicture = questService.selectQPicture();
	    
	    mv.addObject("qpicture", qpicture);*/
		mv.addObject("quests", quests);
		mv.addObject("quest", quest);
		
	    return mv;
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public ModelAndView QuestInsertGet(@ModelAttribute Quest quest,@ModelAttribute Board board, @ModelAttribute Tag tag){
		
	    ModelAndView mv = new ModelAndView("board/quest/registerform");
        
	    return mv;
	}
	
	
	@RequestMapping(value="insert.action", method = RequestMethod.POST)
	public String QuestInsertPost(MultipartHttpServletRequest req, Quest quest, Board board, Model model, BindingResult result) {
		logger.info("board.context: {}");
	     
		if (result.hasErrors()) {

			return "index";
		}
		
		int memberNo =  Integer.parseInt(req.getParameter("memberNo")); 
		//boardService.insertBoard();
		int boardNo = boardService.selectBoardNo(memberNo);	
		quest.setBoardNo(boardNo);
		
		String path = req.getRealPath("/resources/image");// 실제 파일을 저장할 경로
		
		System.out.println(path);
		try {
			ArrayList<QPicture> files = new ArrayList<>();

			List<MultipartFile> file = req.getFiles("attach");
			
			if (file.size() == 1 && file.get(0).getOriginalFilename().equals("")) {
			} else {
				for (int i = 0; i < file.size(); i++) {

					String fileName = file.get(i).getOriginalFilename();

					if (fileName.contains("\\")) {
						fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
					}
					

					String uniqueFileName = Util.getUniqueFileName(path, fileName);
					
					file.get(i).transferTo(new File(path, uniqueFileName));
					

					QPicture f = new QPicture();
					f.setSavedFilePath(uniqueFileName);
					f.setRealFilePath(fileName);

					files.add(f);
					int newUploadNo = 0;
					if (i == 0) {
						quest.setSavedFilePath(uniqueFileName);
						quest.setRealFilePath(fileName);
						questService.insertQuest(quest);// Upload
						//questService.insertQuest(quest);// Upload
						newUploadNo = questService.selectQuestNo(quest);
						
					} else {
						newUploadNo = quest.getQuestNo();
						//newUploadNo = questService.selectQuestNo();
					}

					// int x = 10 / 0;//
//					files.get(i).setBoardFileNo(newUploadNo);
					//files.get(i).setQuestNo(newUploadNo);
					files.get(i).setQuestNo(newUploadNo);
					questService.insertQPicture(files.get(i));// UploadFile
				}
			}

		} catch (Exception ex) {
			// tx:advice 설정으로 구현한 경우 사용
			// TransactionAspectSupport
			// .currentTransactionStatus().setRollbackOnly();

			ex.printStackTrace();

			// 직접 구현한 advice를 사용한 경우 사용
			// throw new RuntimeException(ex);}
		}
			
	    return "redirect:listview.action";
	    
	    
	}
	
	
	@RequestMapping(value="questview.action", method = RequestMethod.GET)
	public ModelAndView QuestViewGet(@RequestParam("questNo") String questNo, Model model){
		
	    ModelAndView mv = new ModelAndView("board/quest/questview");
        
	    if (questNo == null || questNo.length() == 0){ 
			mv.setViewName("redirect:listview.action");
			return mv;
		}
		
		Quest quest = questService.searchQuest(Integer.parseInt(questNo));
		
		List<QPicture> qpictures = questService.searchQpicture(Integer.parseInt(questNo));

		System.out.println(qpictures);
		quest.setQpicture(qpictures);
		
		mv.addObject("quest", quest);
	    
	    return mv;
	}

	

	
}
