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
public class MainPageDto {
	//wo chart
	private String productType;
	private Long workOrderCount;
	
	//orders chart
	private String receiveOrPlace;
	private Long orderCount;
}
