package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PmOrdersDetailDto {

	private String orderDetailCode;
	private Long sorder;
	private String itemCode;
	private Long quantity;
	private Long price;
	private Long amount;
	private String memo;
	private String itemStockUnit;
	private String endYn;
	
	private String itemName;
	
}