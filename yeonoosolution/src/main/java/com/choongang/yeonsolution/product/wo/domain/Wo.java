package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Wo {
	private String workOrderCode;
	private String whCode;
	private String orderCode;
	private String itemCode;
	private Integer itemQuantity;
	private String workOrderType;
	private Date workOrderDate;
	private String workOrderStatus;
	private Date startDate;
	private Date endDate;
	private Date finishDate;
	private String deleteStatus;
	private String memo;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;

}
