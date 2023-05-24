package com.choongang.yeonsolution.standard.imi.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.dao.IMIDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class IMIServiceImpl implements IMIService {
	
	private final IMIDao imiDao;

}
