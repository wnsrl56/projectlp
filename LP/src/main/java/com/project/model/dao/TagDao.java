package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Tag;

public interface TagDao {

	//삽입
	public void insertTag(Tag tag);
	
	
	//조회
	public List<Tag> selectAllTagList();
	public Tag searchTagByIndex(int index);
	
	
	//수정
	//put으로 알아서 추가하던가, 명시적으로 만들어서 쓰면 될듯
	public void updateTag(HashMap<String,?> hash);

	//삭제
	public void deleteTagByIndex(int index);
	
	
	
}
