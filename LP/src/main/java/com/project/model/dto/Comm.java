package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Comm implements Serializable {

	private int commNo;
	private int boardNo;
	private String title;
	private String context;
	private String writer;
	private Date regDate;
	private boolean deleted;
	private String dateChanged;
	private List<CommReply> reply;
	private String regDateStr;
	
	
	public String getRegDateStr() {
		return regDateStr;
	}
	public void setRegDateStr(String regDateStr) {
		this.regDateStr = regDateStr;
	}
	public List<CommReply> getReply() {
		return reply;
	}
	public void setReply(List<CommReply> reply) {
		this.reply = reply;
	}
	
	public String getDateChanged() {
		return dateChanged;
	}
	public void setDateChanged(String dateChanged) {
		this.dateChanged = dateChanged;
	}
	
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
