package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Wh {
	private String whCode; // PK
	private Company company; // FK
	private String whName;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;
	private String useYn;
	private String memo;
}
