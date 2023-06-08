package com.choongang.yeonsolution.product.smm.domain;

import lombok.Data;

@Data
public class StMoveDto {
	
	private String moveCode;     	     //이동번호
	private Long beginEndInventory; //기초/기몰 구분
	private String moveDate; 			 //이동일자
	private String regDate; 				//등록일자
	private String regUser; 				//등록자
	private String updateDate; 			//수정일자
	private String updateUser; 			//수정자
	private String moveType; 			//이동상태
	private String deleteStatus; 		//삭제여부
	private String memo; 				//비고
	
}
