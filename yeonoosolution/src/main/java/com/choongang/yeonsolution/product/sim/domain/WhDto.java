package com.choongang.yeonsolution.product.sim.domain;


import java.util.Date;

import lombok.Data;

@Data
public class WhDto {
	private String 	whCode;
	private String 	companyCode;
	private String 	whName;
	private String 	regUser;
	private Date 	regDate;
	private String 	updateUser;
	private Date 	updateDate;
	private String 	useYn;
	private String	memo;
}