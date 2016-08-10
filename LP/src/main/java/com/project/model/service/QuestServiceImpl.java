package com.project.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.BoardDao;
import com.project.model.dao.QuestDao;


@Service("questService")
public class QuestServiceImpl implements QuestService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlQuestDao")
	private QuestDao questDao;

	@Override
	public List<Map<String, Object>> selectAllQuestList(Map<String, Object> map) throws Exception {
		
		return questDao.selectAllQuestList(map);
	}

	
	
	

}
