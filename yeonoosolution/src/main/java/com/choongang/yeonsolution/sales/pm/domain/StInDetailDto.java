package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StInDetailDto {
	
	private String inCode;
	private Long sorder;
	private String whCode;
	private String itemCode;
	private String inQuantity;
	private Long inPrice;
	private String memo;
	
}