package com.choongang.yeonsolution.standard.pmi.domain;

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
public class PMIBomDto {
	
	private String highItemCode;	// 완제품 코드
	private String lowItemCode;		// 재료 코드
	private Long materialQuantity;	// 재료 수량
	
	// item 테이블 조인용
	private String itemName;
	private String itemType; 
	private String stockUnit;
	
}
