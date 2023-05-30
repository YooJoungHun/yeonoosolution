package com.choongang.yeonsolution.standard.am.domain;

import lombok.Data;

@Data
public class AMDto {
	//member
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
	
	//job
	public String jobName;
	public String jobYn;
	public String jobRegDate;
	public String jobRegUser;
	public String jobUpdateDate;
	public String jobUpdateUser;
	
	//dept
	public String deptName;
	public String deptYn;
	public String deptRegDate;
	public String deptRegUser;
	public String deptUpdateDate;
	public String deptUpdateUser;
	
	//company
	public String companyName;
	
}   
