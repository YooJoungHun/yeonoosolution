package com.choongang.yeonsolution.product.sim.domain;

import lombok.Data;

@Data
public class StInDetailDto {
	private String 	inCode;
	private Long 	sorder;
	private String 	whCode;
	private String 	itemCode;
	private Long 	inQuantity;
	private Long 	inPrice;
	private String 	memo;
}