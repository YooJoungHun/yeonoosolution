package com.choongang.yeonsolution.sales.sdm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.sdm.dao.SDMDao;
import com.choongang.yeonsolution.sales.sdm.domain.SDMStOutDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SDMServiceImpl implements SDMService {
	private final SDMDao sd;

	@Override
	public List<SDMStOutDto> findOutListByCustomerCode(String customerCode) {
		List<SDMStOutDto> outList = null;
		outList = sd.selectOutList(customerCode);
		return outList;
	}

	@Override
	public List<SDMStOutDto> findStOutDetailDtoListByOutCode(String outCode) {
		List<SDMStOutDto> outDetailList = null;
		outDetailList = sd.selectStOutDetailDtoListByOutCode(outCode);
		return outDetailList;
	}

	@Override
	public void outTypeConfirmModify(String outCode) {
		sd.updateOutTypeConfirm(outCode);
	}

	@Override
	public void outTypeConfirmCancelModify(String outCode) {
		sd.updateOutTypeConfirmCancel(outCode);
	}

	@Override
	public String outTypeCCYNDetails(String outCode) {
		return sd.findOutTypeCCYN(outCode);
	}

	@Override
	public void addStOut(SDMStOutDto stout) {
		sd.insertStOut(stout);
	}

	@Override
	public void removeStOutByOutCode(String outCode) {
		sd.deleteStOutByOutCode(outCode);
	}

	@Override
	public void modifyStOutByOutCode(SDMStOutDto stout) {
		sd.updateStOutByOutCode(stout);
	}

	@Override
	public void modifyStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		sd.updateStOutItemByOutCodeAndSorder(stout);
	}

	@Override
	public List<SDMStOutDto> findCompanyCodeList() {
		List<SDMStOutDto> companyCodeList = null;
		companyCodeList = sd.selectCompanyCodeList();
		return companyCodeList;
	}
	
	@Override
	public List<SDMStOutDto>  findOutCodeList() {
		List<SDMStOutDto> outCodeList = null;
		outCodeList = sd.selectfindOutCodeList();
		return outCodeList;
	}
	
	@Override
	public List<SDMStOutDto> findWhCodeList() {
		List<SDMStOutDto> whCodeList = null;
		whCodeList = sd.selectfindWhCodeList();
		return whCodeList;
	}
	
	@Override
	public List<SDMStOutDto> findItemCodeList() {
		List<SDMStOutDto> itemCodeList = null;
		itemCodeList = sd.selectfindItemCodeList();
		return itemCodeList;
	}

	@Override
	public void removeStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		sd.deleteStOutItemByOutCodeAndSorder(stout);
	}

	@Override
	public void addStOutItem(SDMStOutDto stout) {
		sd.insertStOutItem(stout);
	}

	@Override
	public List<SDMStOutDto> findStOutListWithDetailByCustomerCode(String customerCode) {
		List<SDMStOutDto> outListWithDetail = null;
		outListWithDetail = sd.selectStOutWithDetailByCustomerCode(customerCode);
		return outListWithDetail;
	}

	@Override
	public List<SDMStOutDto> findCompanyCodeList2() {
		List<SDMStOutDto> companyCodeList2 = null;
		companyCodeList2 = sd.selectCompanyCodeList2();
		return companyCodeList2;
	}






}
