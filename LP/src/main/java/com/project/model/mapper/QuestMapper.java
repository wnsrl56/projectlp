package com.project.model.mapper;

import java.util.List;

import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;
import com.project.model.dto.Tag;

public interface QuestMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	
	public void insertQuest(Quest quest);
	public void insertQPicture(QPicture qpicture);
	public void updateAnswerCount(Quest quest);
	public void updateGoodCount(int questNo);
	public void insertTag(Tag tag);
	
	public List<Tag> selectAllTag();
	public int selectQuestNo();
	public List<Quest> selectAllQuests();
	public List<Quest> selectAllTagQuests(int tagNo);
	public QPicture selectQPicture();
	public Quest searchQuest(int questNo);
	public List<QPicture> searchQpicture(int questNo);
	
	public List<Quest> selectAllNoneQuests();
	public List<Quest> selectAllNoneTagQuests(int tagNo);

}
