package com.choongang.yeonsolution.sales.sdm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class SDMDaoImpl implements SDMDao {
	private final SqlSession session;


}
