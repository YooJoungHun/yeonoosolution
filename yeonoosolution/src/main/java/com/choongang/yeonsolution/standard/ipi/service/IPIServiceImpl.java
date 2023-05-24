package com.choongang.yeonsolution.standard.ipi.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.ipi.dao.IPIDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class IPIServiceImpl implements IPIService {
	
	private final IPIDao ipiDao;
}
