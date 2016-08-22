package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;

public interface QuestDao {

	//삽입
	public void insertQuest(Quest quest);
	public void insertQPicture(QPicture qpicture);
	public void updateAnswerCount(Quest quest);
	public void updateGoodCount(int questNo);
	
	//조회
	public List<Map<String, Object>> selectAllQuestList(Map<String, Object> map);
	public Quest searchQuestByIndex(int index);
	public int selectQuestNo();
	public List<Quest> selectAllQuests();
	public QPicture selectQPicture();
	public Quest searchQuest(int questNo);
	public List<QPicture> searchQpicture(int questNo);
	public List<Quest> selectAllNoneQuests();
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateQuest(HashMap<String,?> hash);

	//삭제
	public void deleteQuestByIndex(int index);
	
	
	
}
