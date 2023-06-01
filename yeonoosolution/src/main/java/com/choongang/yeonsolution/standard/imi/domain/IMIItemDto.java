package com.choongang.yeonsolution.standard.imi.domain;

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
public class IMIItemDto {
	
	private String itemCode;	// 제품 코드
	private String companyCode;	// 회사 코드
	private String whCode;		// 창고 코드
	private String itemName; 	// 품명 제품명
	private String itemType;	// 구분
	private String stockUnit;	// 재고 단위
	private Long purchasePrice; // 매입 단가
	private Long salesPrice; 	// 매출 단가
	private String memo;		// 비고
	private String startDate;	// 시작일
	private String endDate;		// 종료일
	private String regDate;		// 등록일자
	private String regUser;		// 등록자
	private String updateDate;	// 수정일자
	private String updateUser;	// 수정자
	private String useYn;		// 사용여부
	
	
	// 창고 목록 조회용
	private String whName; 
	private String whCode2;
}
