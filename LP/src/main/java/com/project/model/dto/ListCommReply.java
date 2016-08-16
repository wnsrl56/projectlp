package com.project.model.dto;

import java.io.Serializable;
import java.util.List;

public class ListCommReply implements Serializable{
	
	private List<CommReply> list;

	public List<CommReply> getList() {
		return list;
	}

	public void setList(List<CommReply> list) {
		this.list = list;
	}
	
	

}
