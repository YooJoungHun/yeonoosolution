package com.choongang.yeonsolution.standard.am.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberDto implements Serializable{
	
	private static final long serialVersionUID = -2549822693402232989L;
	
	public String memberUid;
	public String deptCode;
	public String jobCode;
	public String companyCode;
	public String memberId;
	public String password;
	public String memberName;
	public String address;
	public String tel;
	public String memberImage;
	public String memberRole;
	public String regUser;
	public String regDate;
	public String updateUser;
	public String updateDate;
	public String memberYn;
}    
