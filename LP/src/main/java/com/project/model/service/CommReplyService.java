package com.project.model.service;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.CommReply;

public interface CommReplyService {
	
	//삽입
		public void insertCommReply(CommReply commReply);
		
		
		//조회
		public List<CommReply> selectAllCommReplyList();
		public CommReply searchCommReplyByIndex(int index);
		
		
		//수정
		//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
		public void updateCommReply(HashMap<String,?> hash);

		//삭제
		public void deleteCommReplyByIndex(int index);

}
