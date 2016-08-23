package com.project.model.service;

import java.util.List;

import com.project.model.dto.Answer;
import com.project.model.dto.AnswerReply;
import com.project.model.dto.Comm;
import com.project.model.dto.CommReply;



public interface AnswerService {

	public void insertQuest(Answer answer);
	
	public List<Answer> selectAllAnswerList();
	public List<Answer> selectAnswerListOrderByDesc(int start,int end, int questIndex);

	//조회
	public List<AnswerReply> selectAllAnswerReplyList();
	public List<AnswerReply> selectAnswerReplyListOrderByDesc(int start, int end,int answerIndex) ;
	public AnswerReply searchAnswerReplyByIndex(int index);
	public int answerCount(int questNo);
	
	
	//답변 입력
	public void insertAnswer(Answer answer);
	public void insertAnswerReply(AnswerReply answerReply);
}	
