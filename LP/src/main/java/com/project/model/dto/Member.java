package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable {

	private int MemberNo;
	private String email;
	private String password;
	private String sexual;
	private String name;
	private String grade;
	private String userType;
	private String extMember;
	private boolean submit;
	private boolean deleted;
	private Date regDate;
	private String dateChanged;
	
	public String getDateChanged() {
		return dateChanged;
	}
	public void setDateChanged(String dateChanged) {
		this.dateChanged = dateChanged;
	}
	public int getMemberNo() {
		return MemberNo;
	}
	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSexual() {
		return sexual;
	}
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getExtMember() {
		return extMember;
	}
	public void setExtMember(String extMember) {
		this.extMember = extMember;
	}
	public boolean isSubmit() {
		return submit;
	}
	public void setSubmit(boolean submit) {
		this.submit = submit;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
