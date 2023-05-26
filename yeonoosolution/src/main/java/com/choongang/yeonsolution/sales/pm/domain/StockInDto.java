package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StockInDto {
	
	private String inCode;
	private String orderCode;
	private String companyCode;
	private String customerCode;
	private Long begin_endInventory;
	private String inDate;
	private String regDate;
	private String regUser;
	private String updateDate;
	private String updateUser;
	private String inType;
	private String deleteStatus;
	private String memo;

}