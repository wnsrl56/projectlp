package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Comm;

public interface CommDao {

	//삽입
	public void insertComm(Comm comm);
	
	
	//조회
	public List<Comm> selectAllCommList();
	public Comm searchCommByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateComm(HashMap<String,?> hash);

	//삭제
	public void deleteCommByIndex(int index);
	
}
