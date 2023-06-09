package com.choongang.yeonsolution.product.sim.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrdersDto {
	private String 	orderCode;
	private String 	companyCode;
	private String 	customerCode;
	private String 	receiveOrPlace;
	private String 	receiveOrderType;
	private Date 	orderDate;
	private String 	orderEmpId;
	private String 	deliveryPlan;
	private String 	orderStatus;
	private Date 	dueDate;
	private String	memo;
	private Date 	regDate;
	private String	regUser;
	private Date	updateDate;
	private String 	updateUser;
	
	
	private List<OrdersDetailDto> ordersDetailDto;
}