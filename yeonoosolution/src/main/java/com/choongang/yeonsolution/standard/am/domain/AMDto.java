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
	public String memberRegUser;
	public String memberRegDate;
	public String memberUpdateUser;
	public String memberUpdateDate;
	public String memberYn;
	//job
	public String jobName;
	public String jobYn;
	public String jobRegDate;
	public String jobRegUser;
	public String jobUpdateDate;
	public String jobUpdateUser;
	
	//department
	public String deptName;
	public String deptYn;
	public String deptRegDate;
	public String deptRegUser;
	public String deptUpdateDate;
	public String deptUpdateUser;
	
	//company
	public String businessType;
	public String orderType;
	public String companyName;
	public String businessCode;
	public String ownerName;
	public String companyTel;
	public String companyAddress;
	public String companyLogo;
	public String companyRegDate;
	public String companyRegUser;
	public String companyUpdateUser;
	public String companyUpdateDate;
	public String useYn;
	
	//search
	public String nameKeyword;
	public String idKeyword;
}   
