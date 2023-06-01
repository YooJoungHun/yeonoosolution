package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Item {
	private String itemCode; // PK
	private Wh wh; // FK
	private Company company;
	private String itemName;
	private String itemType;
	private String stockUnit;
	private Integer purchasePrice;
	private Integer salesPrice;
	private String memo;
	private Date startDate;
	private Date endDate;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;
}
