package com.project.model.mapper;

import java.util.List;

import com.project.model.dto.ManagerEvent;

public interface ManagerEventMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	
	public void insertManagerEvent(ManagerEvent managerevent);
	public int selectManagerEventNo();
	public List<ManagerEvent> selectAllManagerEventList();

}
