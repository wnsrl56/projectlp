package com.project.model.service;

import java.util.List;

import com.project.model.dto.Comm;

public interface CommService {
	
	//삽입
	public void insertComm(Comm comm);
	
	//조회
	public List<Comm> selectAllCommList();

}
