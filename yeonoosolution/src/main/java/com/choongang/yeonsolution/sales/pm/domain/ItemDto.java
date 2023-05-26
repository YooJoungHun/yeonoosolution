package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemDto {
	
	private String itemCode;
	private String whCode;
	private String companyCode;
	private String itemName;
	private String itemType;
	private String stockUnit;
	private Long purchasePrice;
	private Long salesPrice;
	private String memo;
	private String startDate;
	private String endDate;
	private String regUser;
	private String regDate;
	private String updateUser;
	private String updateDate;

}