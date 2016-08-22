package com.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.BoardDao;
import com.project.model.dao.QuestDao;
import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;


@Service("questService")
public class QuestServiceImpl implements QuestService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlQuestDao")
	private QuestDao questDao;

	@Override
	public List<Map<String, Object>> selectAllQuestList(Map<String, Object> map) throws Exception {
		
		return questDao.selectAllQuestList(map);
	}

	@Override
	public void insertQuest(Quest quest) {
		questDao.insertQuest(quest);
	//	return quest.getQuestNo();
	}

	@Override
	public void insertQPicture(QPicture qfile) {
		
		questDao.insertQPicture(qfile);
	}

	@Override
	public int selectQuestNo(Quest quest) {
		int QuestNo = questDao.selectQuestNo();
		quest.setQuestNo(QuestNo);
		return quest.getQuestNo();
	}

	@Override
	public List<Quest> selectAllQuests() {
		
		List<Quest> quests = questDao.selectAllQuests();
		
		return quests;
	}

	@Override
	public QPicture selectQPicture() {
		QPicture qpicture = questDao.selectQPicture();
		return qpicture;
	}

	@Override
	public Quest searchQuest(int questNo) {
		
		Quest quest = questDao.searchQuest(questNo);
		
		return quest;
	}

	@Override
	public List<QPicture> searchQpicture(int questNo) {
		
		List<QPicture> qpicture = questDao.searchQpicture(questNo);
		
		
		return qpicture;
	}

	@Override
	public void updateAnswerCount(Quest quest) {
		
		questDao.updateAnswerCount(quest);
		
	}

	@Override
	public void updateGoodCount(int questNo) {
	
		questDao.updateGoodCount(questNo);
	}

	@Override
	public List<Quest> selectQuestListOrderByDesc(int start, int end) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> period = new HashMap<>();
		
		
		period.put("start", start);
		period.put("end", end);
		
		return questDao.selectQuestListOrderByDesc(period);
	}
	



	
	
	

}
