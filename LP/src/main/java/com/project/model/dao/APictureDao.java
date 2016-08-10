package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.APicture;

public interface APictureDao {

	//삽입
	public void insertAPicture(APicture apicture);
	
	
	//조회
	public List<APicture> selectAllAPictureList();
	public APicture searchAPictureByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateAPicture(HashMap<String,?> hash);

	//삭제
	public void deleteAPictureByIndex(int index);
	
}
