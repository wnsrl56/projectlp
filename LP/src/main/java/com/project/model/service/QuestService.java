package com.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;
import com.project.model.dto.Tag;



public interface QuestService {

	public void insertQuest(Quest quest);
	public void insertQPicture(QPicture qfile);
	public void updateAnswerCount(Quest quest);
	public void updateGoodCount(int questNo);
	public void insertTag(Tag tag);
	
	
	public List<Tag> selectAllTag();
	public int selectQuestNo(Quest quest);
	List<Map<String, Object>> selectAllQuestList(Map<String, Object> map) throws Exception;
	public List<Quest> selectQuestListOrderByDesc(int start, int end);
	
	public List<Quest> selectAllQuests();	
	public List<Quest> selectAllTagQuests(int tagNo);
	public QPicture selectQPicture();
	public Quest searchQuest(int questNo);
	public List<QPicture> searchQpicture(int questNo);	
	public List<Quest> selectAllNoneQuests();	
	public List<Quest> selectAllNoneTagQuests(int tagNo);
	
}	
