package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class Search {
	private String startDate;
	private String endDate;
	private String orderDate;
	private String customerCode;
	private String orderEmpid;
}
