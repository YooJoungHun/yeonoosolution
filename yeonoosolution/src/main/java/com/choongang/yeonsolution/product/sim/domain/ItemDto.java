package com.choongang.yeonsolution.product.sim.domain;


import java.util.Date;

import lombok.Data;

@Data
public class ItemDto {
	private String 	itemCode;
	private String 	whCode;
	private String 	companyCode;
	private String 	itemName;
	private String 	itemType;
	private String 	stockUnit;
	private Long 	purchasePrice;
	private Long 	salesPrice;
	private String 	memo;
	private Date 	startDate;
	private Date 	endDate;
	private String	regUser;
	private Date 	regDate;
	private String 	updateUser;
	private Date	updateDate;
	private String 	useYn;
}