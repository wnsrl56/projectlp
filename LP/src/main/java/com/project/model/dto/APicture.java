package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class APicture implements Serializable{

	private int aPictureNo;
	private int answerNo;
	private String savedFilePath;
	private String realFilePath;
	private Date regDate;
	private String writer;
	
	
	
	public int getaPictureNo() {
		return aPictureNo;
	}
	public void setaPictureNo(int aPictureNo) {
		this.aPictureNo = aPictureNo;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
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
