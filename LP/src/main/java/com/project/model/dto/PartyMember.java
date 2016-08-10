package com.project.model.dto;

import java.io.Serializable;
import java.util.Date;


//안쓴다.
public class PartyMember implements Serializable{

	private int partyNo;
	private int memberNo;
	private Date regDate;
	
	public int getPartyNo() {
		return partyNo;
	}
	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
