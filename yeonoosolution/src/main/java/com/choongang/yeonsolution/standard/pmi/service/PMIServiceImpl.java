package com.choongang.yeonsolution.standard.pmi.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.pmi.dao.PMIDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PMIServiceImpl implements PMIService {
	private final PMIDao pmiDao;

}
