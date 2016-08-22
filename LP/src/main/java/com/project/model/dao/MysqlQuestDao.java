package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Board;
import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;
import com.project.model.mapper.BoardMapper;
import com.project.model.mapper.MemberMapper;
import com.project.model.mapper.QuestMapper;

@Repository(value = "mysqlQuestDao" )
public class MysqlQuestDao implements QuestDao {

	
	
	@Autowired
	@Qualifier("questMapper")
	private QuestMapper questMapper;

	@Override
	public void insertQuest(Quest quest) {
		
		questMapper.insertQuest(quest);
	}
	
	@Override
	public void insertQPicture(QPicture qpicture) {
		
		questMapper.insertQPicture(qpicture);
	}
	
	@Override
	public int selectQuestNo() {
		int QuestNo = questMapper.selectQuestNo();
		return QuestNo;
	}

	@Override
	public List<Map<String, Object>> selectAllQuestList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Quest searchQuestByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateQuest(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuestByIndex(int index) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Quest> selectAllQuests() {
		
		List<Quest> quests	= questMapper.selectAllQuests();
		
		return quests;
	}

	@Override
	public QPicture selectQPicture() {
		
		QPicture qpicture = questMapper.selectQPicture();
		
		return qpicture;
	}

	@Override
	public Quest searchQuest(int questNo) {
		
		Quest quest = questMapper.searchQuest(questNo);
		
		return quest;
	}

	@Override
	public List<QPicture> searchQpicture(int questNo) {
		
		List<QPicture> qpicture = questMapper.searchQpicture(questNo);
		
		return qpicture;
	}

	@Override
	public void updateAnswerCount(Quest quest) {
		
		questMapper.updateAnswerCount(quest);
		
	}

	@Override
	public void updateGoodCount(int questNo) {

		questMapper.updateGoodCount(questNo);
	}

	@Override
	public List<Quest> selectQuestListOrderByDesc(HashMap<String, ?> period) {
		// TODO Auto-generated method stub
		return questMapper.selectQuestListOrderByDesc(period);
	}

	


	
	



}
