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
public class IsBomDto {
	private String highItemCode;
	private String lowItemCode;
	private Long materialQuantity;
	
	//parameter column
	private String itemName;
	private String itemType;
	
	//join column
	private String whCode;
	private String whName;
	private Long goodQuantity;
	private Long badQuantity;
	private String highItemName;
}
