package com.project.model.service;

import java.util.List;
import java.util.Map;

import com.project.model.dto.Answer;
import com.project.model.dto.Board;
import com.project.model.dto.Quest;



public interface BoardService {

	public void insertBoard();
	public int selectBoardNo(int memberNo);
	public List<Board> selectAllBoard();
	
	List<Map<String, Object>> selectAllBoardList(Map<String, Object> map) throws Exception;
		
	
}	
