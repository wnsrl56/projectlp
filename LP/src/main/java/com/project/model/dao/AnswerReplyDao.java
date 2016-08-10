package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.AnswerReply;

public interface AnswerReplyDao {

	//삽입
		public void insertAnswerReply(AnswerReply answerReply);
		
		
		//조회
		public List<AnswerReply> selectAllAnswerReplyList();
		public AnswerReply searchAnswerReplyByIndex(int index);
		
		
		//수정
		//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
		public void updateAnswerReply(HashMap<String,?> hash);

		//삭제
		public void deleteAnswerReplyByIndex(int index);
		
	
	
}
