package com.choongang.yeonsolution.product.sim.domain;

import lombok.Data;

@Data
public class OrdersDetailDto {
	private String 	orderDetailCode;
	private Long 	sorder;
	private String 	itemCode;
	private Long 	quantity;
	private Long 	price;
	private Long 	amount;
	private String 	memo;
	private String 	itemStockUnit;
	private String 	endYn;
}