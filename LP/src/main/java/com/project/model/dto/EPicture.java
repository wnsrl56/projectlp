package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class EPicture implements Serializable{

	private int ePictureNo;
	private int eventNo;
	private String savedFilePath;
	private String realFilePath;
	private Date regDate;
	private String writer;
	
	public int getePictureNo() {
		return ePictureNo;
	}
	public void setePictureNo(int ePictureNo) {
		this.ePictureNo = ePictureNo;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
