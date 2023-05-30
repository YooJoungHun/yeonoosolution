package com.choongang.yeonsolution.product.wo.dao;

import com.choongang.yeonsolution.product.wo.domain.Item;

public interface ItemDao {
	public Item selectItem(String itemCode);
	
}
