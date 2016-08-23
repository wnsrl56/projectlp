package com.project.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.AnswerDao;
import com.project.model.dao.AnswerReplyDao;
import com.project.model.dto.Answer;
import com.project.model.dto.AnswerReply;
import com.project.model.dto.Comm;
import com.project.model.dto.CommReply;


@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlAnswerDao")
	private AnswerDao answerDao;
	
	@Autowired
	@Qualifier("mysqlAnswerReplyDao")
	private AnswerReplyDao answerReplyDao;

	@Override
	public void insertQuest(Answer answer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Answer> selectAllAnswerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Answer> selectAnswerListOrderByDesc(int start, int end, int questIndex) {
		
		HashMap<String, Integer> period = new HashMap<>();
		period.put("start",start);
		period.put("end",end);
		period.put("questIndex", questIndex);
		
		return answerDao.selectAnswerListOrderByDesc(period);

	}

	@Override
	public List<AnswerReply> selectAllAnswerReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AnswerReply> selectAnswerReplyListOrderByDesc(int start, int end, int answerIndex) {
		HashMap<String, Integer> period = new HashMap<>();
		period.put("start",start);
		period.put("end",end);
		period.put("answerIndex",answerIndex);
		
		return answerReplyDao.selectAnswerReplyListOrderByDesc(period);
	}

	@Override
	public AnswerReply searchAnswerReplyByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int answerCount(int questNo) {
		return answerDao.answerCount(questNo);
	}

	@Override
	public void insertAnswer(Answer answer) {
		answerDao.insertAnswer(answer);
	}

	@Override
	public void insertAnswerReply(AnswerReply answerReply) {
		answerReplyDao.insertAnswerReply(answerReply);
	}



}
