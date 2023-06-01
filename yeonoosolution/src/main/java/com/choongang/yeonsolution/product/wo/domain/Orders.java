package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Orders {
	private String orderCode; // PK
	private Company company; // FK
	private Company customer; // FK
	private String receiveOrPlace;
	private String receiveOrderType;
	private Date orderDate;
	private String orderEmpid;
	private String deliveryPlan;
	private String orderStatus;
	private Date dueDate;
	private String memo;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;
}
