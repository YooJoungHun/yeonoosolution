package com.choongang.yeonsolution.product.is.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class IsLossDto {
	private String workOrderCode;
	private Long sorder;
	private String itemCode;
	private String defectiveLossType;
	private Long defectiveLossQuantity;
	private String defectiveLossDate;
	private String regUser;
	private String regDate;
	private String updateUser;
	private String updateDate;
	private String memo;
}
