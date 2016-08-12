package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Board;
import com.project.model.mapper.BoardMapper;
import com.project.model.mapper.MemberMapper;

@Repository(value = "mysqlBoardDao" )
public class MysqlBoardDao implements BoardDao {

	
	
	@Autowired
	@Qualifier("boardMapper")
	private BoardMapper boardMapper;
	
	
	@Override
	public void insertBoard() {
		
		boardMapper.insertBoard();
		
	}
	
	@Override
	public int selectBoardNo(int memberNo) {
		
		int boardNo	= boardMapper.selectBoardNo(memberNo);
		
		return boardNo;
	}

	

	@Override
	public Board searchBoardByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoardByIndex(int index) {
		// TODO Auto-generated method stub

	}


	@Override
	public List<Map<String, Object>> selectAllBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}



}
