package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Quest implements Serializable {

	private int questNo;
	private int boardNo;
	private String title;
	private String context;
	private String writer;
	private Date regDate;
	private int viewCount;
	private int goodCount;
	private boolean deleted;
	private String savedFilePath;
	private String realFilePath;
	private String dateChanged;
	private String tagName;
	private int tagNo;
	

	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	private List<QPicture> Qpicture;
	
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getDateChanged() {
		return dateChanged;
	}
	public void setDateChanged(String dateChanged) {
		this.dateChanged = dateChanged;
	}
	public List<QPicture> getQpicture() {
		return Qpicture;
	}
	public void setQpicture(List<QPicture> qpicture) {
		Qpicture = qpicture;
	}
	public String getSavedFilePath() {
		return savedFilePath;
	}
	public void setSavedFilePath(String savedFilePath) {
		this.savedFilePath = savedFilePath;
	}
	public String getRealFilePath() {
		return realFilePath;
	}
	public void setRealFilePath(String realFilePath) {
		this.realFilePath = realFilePath;
	}
	public int getQuestNo() {
		return questNo;
	}
	public void setQuestNo(int questNo) {
		this.questNo = questNo;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
	
	
}
