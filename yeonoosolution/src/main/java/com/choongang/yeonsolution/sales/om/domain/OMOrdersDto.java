package com.choongang.yeonsolution.sales.om.domain;

import lombok.Data;

@Data
public class OMOrdersDto {
	
	private String	orderCode;
	private	String	companyCode;
	private	String	customerCode;
	private	String	companyName;
	private	String	receiveOrPlace;
	private	String	receiveOrderType;
	private	String	orderDate;
	private	String	orderEmpid;
	private	String	deliveryPlan;
	private	String	orderStatus;
	private	String	dueDate;
	private	String	memo;	
	private	String	regDate;		
	private	String	regUser;
	private	String	updateDate;
	private	String	updateUser;
	
}
