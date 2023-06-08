package com.choongang.yeonsolution.standard.ipi.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.ipi.dao.IPIDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class IPIServiceImpl implements IPIService {
	
	private final IPIDao ipiDao;

	@Override
	public int modifyItemByItemDto(IMIItemDto itemDto) {
		
		itemDto.setPurchasePrice(itemDto.getPurchasePrice() == null ? 0 : itemDto.getPurchasePrice());
		itemDto.setSalesPrice(itemDto.getSalesPrice() == null ? 0 : itemDto.getSalesPrice());
		itemDto.setMemo(itemDto.getMemo() == null ? "" : itemDto.getMemo());
		
		return ipiDao.updateItemByItemDto(itemDto);
	}
}
