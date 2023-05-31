package com.choongang.yeonsolution.sales.sdm.domain;

import lombok.Data;

@Data
public class StOutDto {
	
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
	
	
	//detail
	private Long 	sorder;
	private String 	whCode;
	private String  itemCode;
	private Long 	outQuantity;
	private String  memo2;
	
	//##
	private String 	memberUid;
	private String 	memberName;
	private String 	companyName;
	private String  itemName;
	private Long	salesPrice;
	
	
	// 단가 * 출고수량 = 총액
	private Long 	totalPrice;

}
