package com.project.model.mapper;

public interface BoardMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	
	public void insertBoard();
	public int selectBoardNo(int memberNo);

}
