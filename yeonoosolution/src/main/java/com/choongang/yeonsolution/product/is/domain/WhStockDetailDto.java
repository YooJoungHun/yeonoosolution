package com.choongang.yeonsolution.product.is.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WhStockDetailDto {
	private String whCode;
	private String itemCode;
	private String checkDate;
	private Long beginEndInventory;
	private Long goodQuantity;
	private Long badQuantity;
	private String updateUser;
	private String updateDate;
	private String memo;
	
	//join 데이터
	private String itemName;
	private String itemType;
	private String stockUnit;
}
