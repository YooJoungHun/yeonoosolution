package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WoDetail {
	private Wo wo; // PK
	private Integer sorder; // PK
	private Item item; // FK
	private String worker;
	private Date workDate;
	private Integer workOrderQuantity;
	private Integer workerCount;
	private String goodYn;
	private String memo;
}
