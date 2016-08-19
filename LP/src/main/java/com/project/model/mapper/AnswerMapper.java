package com.project.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Answer;
import com.project.model.dto.AnswerReply;
import com.project.model.dto.Comm;
import com.project.model.dto.CommReply;

public interface AnswerMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	public List<Answer> selectAllAnswerList();
	public List<Answer> selectAnswerListOrderByDesc(HashMap<String,?> hash);
	public List<AnswerReply> selectAnswerReplyListOrderByDesc(HashMap<String,?> period);
	public int answerCount(int questNo);
	
	//답변 입력
	public void insertAnswer(Answer answer);
	public void insertAnswerReply(AnswerReply answerReply);
}
