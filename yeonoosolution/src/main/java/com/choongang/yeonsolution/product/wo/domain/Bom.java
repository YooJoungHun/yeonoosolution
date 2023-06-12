package com.choongang.yeonsolution.product.wo.domain;

import lombok.Data;

@Data
public class Bom {
	public String highItemCode;
	public String lowItemCode;
	public Item lowItem;
	public Integer materialQuantity;
}
