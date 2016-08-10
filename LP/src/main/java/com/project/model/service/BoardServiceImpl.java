package com.project.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.model.dao.BoardDao;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Qualifier("mysqlBoardDao")
	private BoardDao boardDao;

	
	
	@Override
	public List<Map<String, Object>> selectAllBoardList(Map<String, Object> map) throws Exception {
		
	
		
		return boardDao.selectAllBoardList(map);
	}
	
	
	


}
