package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Answer;
import com.project.model.dto.AnswerReply;
import com.project.model.mapper.AnswerMapper;
import com.project.model.mapper.QuestMapper;

@Repository(value = "mysqlAnswerReplyDao" )
public class MysqlAnswerReplyDao implements AnswerReplyDao {

	@Autowired
	@Qualifier("answerMapper")
	private AnswerMapper answerMapper;

	@Override
	public void insertAnswerReply(AnswerReply answerReply) {
		answerMapper.insertAnswerReply(answerReply);
	}

	@Override
	public List<AnswerReply> selectAllAnswerReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AnswerReply> selectAnswerReplyListOrderByDesc(HashMap<String, ?> period) {
		
		return answerMapper.selectAnswerReplyListOrderByDesc(period);
	}

	@Override
	public AnswerReply searchAnswerReplyByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAnswerReply(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAnswerReplyByIndex(int index) {
		// TODO Auto-generated method stub
		
	}


}
