package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.model.dto.Quest;

public interface QuestDao {

	//삽입
	public void insertQuest(Quest quest);
	
	
	//조회
	public List<Map<String, Object>> selectAllQuestList(Map<String, Object> map);
	public Quest searchQuestByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateQuest(HashMap<String,?> hash);

	//삭제
	public void deleteQuestByIndex(int index);
	
	
	
}
