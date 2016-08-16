package com.project.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.model.dto.CommReply;
import com.project.model.mapper.CommReplyMapper;


@Repository(value = "mysqlCommReplyDao" )
public class MysqlCommReplyDao implements CommReplyDao {

	
	@Autowired
	@Qualifier("commReplyMapper")
	private CommReplyMapper commReplyMapper;
	
	@Override
	public void insertCommReply(CommReply commReply) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CommReply> selectAllCommReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommReply searchCommReplyByIndex(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCommReply(HashMap<String, ?> hash) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCommReplyByIndex(int index) {
		// TODO Auto-generated method stub

	}

}
