package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.MemberEvent;

public interface MemberEventDao {

	//삽입
	public void insertMemberEvent(MemberEvent memberEvent);
	
	
	//조회
	public List<MemberEvent> selectAllMemberEventList();
	public MemberEvent searchMemberEventByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateMemberEvent(HashMap<String,?> hash);

	//삭제
	public void deleteMemberEventByIndex(int index);
	
	
	
}
