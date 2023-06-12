package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Wo {
	private String workOrderCode; // PK
	private Wh wh; // FK
	private Orders orders; // FK
	private Item item; // FK
	private Integer itemQuantity;
	private String workStatus;
	private String productType;
	private String workOrderType;
	private Date workOrderDate;
	private String workOrderStatus;
	private Date startDate;
	private Date endDate;
	private Date finishDate;
	private String deleteStatus;
	private String memo;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;
	
	// workedQuantity
	private Integer workedQuantity;
	// good and bad
	private Integer goodQuantity;
	private Integer badQuantity;

}
