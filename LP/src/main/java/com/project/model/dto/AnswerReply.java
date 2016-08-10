package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class AnswerReply implements Serializable{

	private int ansReplyNo;
	private int answerNo;
	private String context;
	private String writer;
	private Date regDate;
	private boolean deleted;
	
	
	public int getAnsReplyNo() {
		return ansReplyNo;
	}
	public void setAnsReplyNo(int ansReplyNo) {
		this.ansReplyNo = ansReplyNo;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
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
