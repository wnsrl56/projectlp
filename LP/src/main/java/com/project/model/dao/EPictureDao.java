package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.EPicture;

public interface EPictureDao {

	//삽입
	public void insertEPicture(EPicture epicture);
	
	
	//조회
	public List<EPicture> selectAllEPictureList();
	public EPicture searchEPictureByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateEPicture(HashMap<String,?> hash);

	//삭제
	public void deleteEPictureByIndex(int index);
	
}
