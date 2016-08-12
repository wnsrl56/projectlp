package com.project.model.mapper;

import java.util.List;

import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;

public interface QuestMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	
	public void insertQuest(Quest quest);
	public void insertQPicture(QPicture qpicture);
	public int selectQuestNo();
	public List<Quest> selectAllQuests();
	

}
