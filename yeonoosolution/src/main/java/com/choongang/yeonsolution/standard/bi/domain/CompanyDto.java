package com.choongang.yeonsolution.standard.bi.domain;

import lombok.Data;

@Data
public class CompanyDto {
	private String companyCode; 	// 회사코드
	private String businessType;	// 법인, 개인
	private String orderType;		// 수주, 발주
	private String companyName;  	// 회사이름
	private String businessCode;	// 사업자 번호
	private String ownerName; 		// 대표이름
	private String tel;				// 전화번호
	private String address;			// 주소
	private String companyLogo;		// 이미지 파일 경로
	private String regDate;			// 등록일
	private String regUser;			// 등록자
	private String updateUser;		// 수정자
	private String updateDate;		// 수정일
	private String useYn;			// 사용여부
	
	// 찬규 추가
	private String memberUid;		// 수정자 사용
	private String rn;				// 로우넘버
	private int kind;				// 삭제, 수정 구분자
}
