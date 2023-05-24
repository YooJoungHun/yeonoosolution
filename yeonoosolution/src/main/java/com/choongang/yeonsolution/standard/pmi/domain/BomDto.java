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
public class BomDto {
	
	private String itemCode;	// 완제품 코드
	private String itemCode2;	// 재료 코드
	private Long materialQuantity;	// 재료 수량
}
