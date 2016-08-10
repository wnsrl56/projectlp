package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.QPicture;

public interface QPictureDao {

	//삽입
	public void insertQPicture(QPicture qpicture);
	
	
	//조회
	public List<QPicture> selectAllQPictureList();
	public QPicture searchQPictureByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateQPicture(HashMap<String,?> hash);

	//삭제
	public void deleteQPictureByIndex(int index);
	
	
	
}
