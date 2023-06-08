package com.choongang.yeonsolution.product.smm.domain;

import lombok.Data;

@Data
public class StMoveDetailDto {
	
	private String moveCode;    	//이동번호
	private Long sorder;				//순번
	private String whCodeIn; 		//입고창고
	private String whCodeOut; 		//출고창고
	private String itemCode; 		//제품코드
	private Long moveQuantity; 	// 이동수량
	private String memo; 			//비고
	
	private String moveDate; 		//이동일자
	private String moveType; 		//이동상태
	private Long goodQuantity; 	//양품수량
	private Long badQuantity;  	//불량수량
	private Long stockQuantity;   //양품+불량 수량
	
	private String itemName;  		//품명
}
