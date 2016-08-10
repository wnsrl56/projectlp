package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class QuestTag implements Serializable {

	private int tagNo;
	private int questNo;
	private Date regDate;
	
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public int getQuestNo() {
		return questNo;
	}
	public void setQuestNo(int questNo) {
		this.questNo = questNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
