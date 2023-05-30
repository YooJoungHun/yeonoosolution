package com.choongang.yeonsolution.sales.pm.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDataDto {
	private OrdersDto order;
    private List<OrdersDetailDto> orderDetails;

}
