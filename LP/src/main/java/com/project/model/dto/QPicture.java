package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class QPicture implements Serializable {

	private int qPictureNo;
	private int questNo;
	private String savedFilePath;
	private String realFilePath;
	private Date regDate;
	private String writer;
	
	
	public int getqPictureNo() {
		return qPictureNo;
	}
	public void setqPictureNo(int qPictureNo) {
		this.qPictureNo = qPictureNo;
	}
	public int getQuestNo() {
		return questNo;
	}
	public void setQuestNo(int questNo) {
		this.questNo = questNo;
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
