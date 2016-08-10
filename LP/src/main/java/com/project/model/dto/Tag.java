package com.project.model.dto;

import java.io.Serializable;

public class Tag implements Serializable{

	private int tagNo;
	private String tagName;
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	
	
}
