package com.choongang.yeonsolution.sales.om.domain;

import lombok.Data;

@Data
public class OMOrdersAOMDto {
	
	private String	orderCode;
	private String	lowItemCode;
	private String	itemCode;
	private String	itemName;
	private String	itemType;
	private Long	quantity;
	private String	receiveOrderType;
	private String	orderDate;
	private String	orderEmpid;
	private String	orderStatus;
	
	private String	stockUnit;
	private Long	goodQuantity;
	private Long	workOrderQuantity;
	
}
