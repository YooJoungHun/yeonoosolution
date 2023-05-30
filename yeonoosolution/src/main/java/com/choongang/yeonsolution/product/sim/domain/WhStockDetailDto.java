package com.choongang.yeonsolution.product.sim.domain;


import java.util.Date;

import lombok.Data;

@Data
public class WhStockDetailDto {
	private String 	whCode;
	private String 	itemCode;
	private String 	checkDate;
	private Long 	beginEndInventory;
	private Long 	goodQuantity;
	private Long 	badQuantity;
	private String 	updateUser;
	private Date	updateDate;
	private String 	memo;
	
	private ItemDto itemDto;
	
}