package com.choongang.yeonsolution.product.wo.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.ItemDao;
import com.choongang.yeonsolution.product.wo.domain.Item;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {
	private final ItemDao itemDao;
	
	@Override
	public Item findItem(String itemCode) {
		return itemDao.selectItem(itemCode);
	}
}
