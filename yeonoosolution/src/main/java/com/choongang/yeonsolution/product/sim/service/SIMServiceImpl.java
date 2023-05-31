package com.choongang.yeonsolution.product.sim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.sim.dao.SIMDao;
import com.choongang.yeonsolution.product.sim.domain.StInDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SIMServiceImpl implements SIMService {
	private final SIMDao simDao;
	
	@Override
	public List<StInDto> stInList() {return simDao.findStIn(); }
	@Override
	public List<StInDto> stInList(StInDto stInDto) {return simDao.findStIn(stInDto); }
	@Override
	public void modifyStIn(StInDto stInDto) {simDao.updateStIn(stInDto); }
	@Override
	public void removeStIn(StInDto stInDto) {simDao.deleteStIn(stInDto); }
	@Override
	public void modifyStInFix(StInDto stInDto) {simDao.updateStInFix(stInDto); }
	@Override
	public void modifyStInCancel(StInDto stInDto) {simDao.updateStInCancel(stInDto); }

}
