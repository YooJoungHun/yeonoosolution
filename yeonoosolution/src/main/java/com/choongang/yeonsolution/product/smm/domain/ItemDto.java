package com.choongang.yeonsolution.product.smm.domain;

import lombok.Data;

@Data
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
	private String useYn;
	
	// wh_stock_detail
	private Long goodQuantity; 	//양품수량
	private Long badQuantity;  	//불량수량
	private Long stockQuantity;   //양품+불량 수량
}
