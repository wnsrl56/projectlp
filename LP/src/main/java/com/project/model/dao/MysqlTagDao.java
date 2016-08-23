package com.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.Board;
import com.project.model.dto.QPicture;
import com.project.model.dto.Quest;
import com.project.model.dto.Tag;
import com.project.model.mapper.BoardMapper;
import com.project.model.mapper.MemberMapper;
import com.project.model.mapper.QuestMapper;

@Repository(value = "mysqlTagDao" )
public class MysqlTagDao implements TagDao {

	
	
	@Autowired
	@Qualifier("questMapper")
	private QuestMapper questMapper;

	@Override
	public void insertTag(Tag tag) {
		questMapper.insertTag(tag);
		
	}

	@Override
	public List<Tag> selectAllTagList() {
		
		return questMapper.selectAllTag();
	}

	@Override
	public Tag searchTagByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateTag(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTagByIndex(int index) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Quest> selectAllTagQuests(int tagNo) {
		return questMapper.selectAllTagQuests(tagNo);
	}

	@Override
	public List<Quest> selectAllNoneTagQuests(int tagNo) {
		return questMapper.selectAllNoneTagQuests(tagNo);
	}




	
	



}
