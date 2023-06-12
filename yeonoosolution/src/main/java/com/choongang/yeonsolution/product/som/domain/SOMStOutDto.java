package com.choongang.yeonsolution.product.som.domain;

import lombok.Data;

@Data
public class SOMStOutDto {
	
	private String  outCode;
	private String  orderCode;
	private String  companyCode;
	private String  customerCode;
	private Long	beginEndInventory;
	private String 	regDate;
	private String  regUser;
	private String 	updateDate;
	private String  updateUser;
	private String  outDate;
	private String  outType;
	private String  deleteStatus;
	private String  memo;
	
	// detail
	private Long 	sorder;
	private String 	whCode;
	private String  itemCode;
	private Long 	outQuantity;
	private String  memo2;
	
	// join
	private String	whName;
	private String  itemName;
	
	private String	memberName;
}
