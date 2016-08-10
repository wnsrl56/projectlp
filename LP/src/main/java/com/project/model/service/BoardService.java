package com.project.model.service;

import java.util.List;
import java.util.Map;



public interface BoardService {

	
	List<Map<String, Object>> selectAllBoardList(Map<String, Object> map) throws Exception;
		
	
}	
