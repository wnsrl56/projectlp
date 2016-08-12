package com.project.model.service;

import java.util.List;
import java.util.Map;

import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;



public interface QuestService {

	public void insertQuest(Quest quest);
	public void insertQPicture(QPicture qfile);
	public int selectQuestNo(Quest quest);
	List<Map<String, Object>> selectAllQuestList(Map<String, Object> map) throws Exception;
	public List<Quest> selectAllQuests();	
	public QPicture selectQPicture();
}	
