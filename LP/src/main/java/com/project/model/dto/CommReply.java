package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class CommReply implements Serializable{

	private int commReplyNo;
	private int commNo;
	private String context;
	private String writer;
	private Date regDate;
	private boolean deleted;
	
	
	public int getCommReplyNo() {
		return commReplyNo;
	}
	public void setCommReplyNo(int commReplyNo) {
		this.commReplyNo = commReplyNo;
	}
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
	
	
	
	
	
}
