package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.ManagerEvent;

public interface ManagerEventDao {

	//삽입
	public void insertManagerEvent(ManagerEvent managerevent);
	
	
	//조회
	public List<ManagerEvent> selectAllManagerEventList();
	public ManagerEvent searchManagerEventByIndex(int index);
	public int selectManagerEventNo();
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateManagerEvent(HashMap<String,?> hash);

	//삭제
	public void deleteManagerEventByIndex(int index);
	
	
	
}
