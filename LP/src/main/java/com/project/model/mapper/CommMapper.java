package com.project.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.model.dto.Comm;

public interface CommMapper {
	
	// dao 에 들어있는 interface를 기준으로 필요한 내용을 추가
	public void insertComm(Comm comm);
	public List<Comm> selectAllCommList();
	public List<Comm> selectCommListOrderByDesc(HashMap<String,?> hash);
}
