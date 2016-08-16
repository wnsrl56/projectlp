package com.project.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.CommReplyDao;
import com.project.model.dto.CommReply;


@Service("commReplyService")
public class CommReplyServiceImpl implements CommReplyService {

	
	@Autowired
	@Qualifier("mysqlCommReplyDao")
	private CommReplyDao commReplyDao;
	
	
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
