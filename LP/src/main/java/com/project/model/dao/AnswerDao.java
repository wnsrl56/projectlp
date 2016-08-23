package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Answer;
import com.project.model.dto.Comm;

public interface AnswerDao {

	//삽입
	public void insertAnswer(Answer answer);
	
	
	//조회
	public List<Answer> selectAllAnswerList();
	public List<Answer> selectAnswerListOrderByDesc(HashMap<String,?> period);
	public Answer searchAnswerByIndex(int index);
	public int answerCount(int questNo);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateAnswer(HashMap<String,?> hash);

	//삭제
	public void deleteAnswerByIndex(int index);
	
}
