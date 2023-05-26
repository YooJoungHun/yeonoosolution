package com.choongang.yeonsolution.product.is.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.is.dao.ISDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@Service
@Slf4j
@RequiredArgsConstructor
public class ISServiceImpl implements ISService {
	private final ISDao isDao;
	
}
