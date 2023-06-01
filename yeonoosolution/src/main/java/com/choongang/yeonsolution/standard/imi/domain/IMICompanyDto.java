package com.choongang.yeonsolution.standard.imi.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class IMICompanyDto {
	
	private String companyCode; // 회사 코드
	private String orderType;	// 발/수주 구분
	private String companyName; // 회사명
}
