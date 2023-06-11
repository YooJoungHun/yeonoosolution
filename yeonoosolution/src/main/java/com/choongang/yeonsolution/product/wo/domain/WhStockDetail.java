package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WhStockDetail {
	private String whCode; // PK
	private String itemCode; // PK
	private String checkDate;
	private Integer beginEndInventory;
	private Integer goodQuantity;
	private Integer badQuantity;
	private String updateUser;
	private Date updateDate;
	private String memo;
}
