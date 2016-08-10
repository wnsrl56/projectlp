package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.QuestTag;

public interface QuestTagDao {

	//삽입
	public void insertQuestTag(QuestTag questTag);
	
	
	//조회
	public List<QuestTag> selectAllQuestTagList();
	public QuestTag searchQuestTagByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateQuestTag(HashMap<String,?> hash);

	//삭제
	public void deleteQuestTagByIndex(int index);
	
	
	
}
