package com.choongang.yeonsolution.standard.imi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.dao.IMIDao;
import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class IMIServiceImpl implements IMIService {
	
	private final IMIDao imiDao;

	@Override
	public List<ItemDto> findItemList() {
		log.info("selectItemList -> " + imiDao.selectItemList());
		
		return imiDao.selectItemList();
	}

}
