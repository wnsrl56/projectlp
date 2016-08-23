package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Answer;
import com.project.model.mapper.AnswerMapper;
import com.project.model.mapper.QuestMapper;

@Repository(value = "mysqlAnswerDao" )
public class MysqlAnswerDao implements AnswerDao {

	
	
	@Autowired
	@Qualifier("answerMapper")
	private AnswerMapper answerMapper;

	
	@Override
	public void insertAnswer(Answer answer) {
		answerMapper.insertAnswer(answer);
	}

	@Override
	public List<Answer> selectAllAnswerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Answer searchAnswerByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAnswer(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAnswerByIndex(int index) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Answer> selectAnswerListOrderByDesc(HashMap<String, ?> period) {
		// TODO Auto-generated method stub
		return answerMapper.selectAnswerListOrderByDesc(period);
	}
	
	
	@Override
	public int answerCount(int questNo) {
		return answerMapper.answerCount(questNo);
	}




}
