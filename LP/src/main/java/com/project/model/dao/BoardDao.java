package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.model.dto.Board;


public interface BoardDao {

	//삽입
	public void insertBoard(Board board);
	
	
	//조회
	public List<Map<String, Object>> selectAllBoardList(Map<String, Object> map);
	public Board searchBoardByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateBoard(HashMap<String,?> hash);

	//삭제
	public void deleteBoardByIndex(int index);
	
}
