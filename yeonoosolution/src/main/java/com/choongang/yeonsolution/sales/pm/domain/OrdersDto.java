package com.choongang.yeonsolution.sales.pm.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDto {
	
	private String orderCode;
	private String companyCode;
	private String customerCode;
	private String receiveOrPlace;
	private String receiveOrderType;
	private String orderDate;
	private String orderEmpid;
	private String deliveryPlan;
	private String orderStatus;
	private String dueDate;
	private String memo;
	private String regDate;
	private String regUser;
	private String updateDate;
	private String updateUser;
	
	// 거래처명
	private String customerName;
}