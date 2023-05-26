package com.choongang.yeonsolution.product.sim.domain;

import java.util.List;

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
	
	
	private WhDto 	whDto;
	private List<WhStockDetailDto> whStockDetailDto;
}