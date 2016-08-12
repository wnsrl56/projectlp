package com.project.model.service;

import java.util.List;
import java.util.Map;

import com.project.model.dto.Quest;



public interface BoardService {

	public void insertBoard();
	public int selectBoardNo(int memberNo);
	
	List<Map<String, Object>> selectAllBoardList(Map<String, Object> map) throws Exception;
		
	
}	
