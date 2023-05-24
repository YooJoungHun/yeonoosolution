package com.choongang.yeonsolution.sales.sdm.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.sdm.dao.SDMDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SDMServiceImpl implements SDMService {
	private final SDMDao sd;

}
