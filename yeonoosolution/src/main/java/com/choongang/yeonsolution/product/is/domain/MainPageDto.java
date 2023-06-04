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
	private String productType;
	private Long workOrderCount;
}
