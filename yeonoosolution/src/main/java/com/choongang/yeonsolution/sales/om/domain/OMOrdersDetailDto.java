package com.choongang.yeonsolution.sales.om.domain;

import lombok.Data;

@Data
public class OMOrdersDetailDto {

	private String	orderDetailCode;
	private Long	sorder;
	private	String	itemCode;
	private String	itemName;
	private	Long	quantity;
	private	Long	price;
	private	Long	amount;
	private	String	memo;
	private	String	itemStockUnit;
	private	String	endYn;
	private String	orderCodeHidden;
	private String	regUser;
	private String	updateUser;
	private String	companyCode;
	
}
