package com.choongang.yeonsolution.sales.sdm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.sdm.dao.SDMDao;
import com.choongang.yeonsolution.sales.sdm.domain.StOutDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SDMServiceImpl implements SDMService {
	private final SDMDao sd;

	@Override
	public List<StOutDto> outListByCustomerCode(String customerCode) {
		List<StOutDto> outList = null;
		outList = sd.findOut(customerCode);
		return outList;
	}

	@Override
	public List<StOutDto> outDetailList(String outCode) {
		List<StOutDto> outDetailList = null;
		outDetailList = sd.findDetailOut(outCode);
		return outDetailList;
	}

	@Override
	public void outTypeCModify(String outCode) {
		sd.modifyOutTypeC(outCode);
	}

	@Override
	public void outTypeCCModify(String outCode) {
		sd.modifyOutTypeCC(outCode);
	}

	@Override
	public String outTypeCCYNDetails(StOutDto stout) {
		return sd.findOutTypeCCYN(stout);
	}

	@Override
	public void insertStOutAdd(StOutDto stout) {
		sd.addInsertStOut(stout);
	}

	@Override
	public void stOutRemove(String outCode) {
		sd.removeStOut(outCode);
	}

	@Override
	public void stOutModify(StOutDto stout) {
		sd.modifyStOut(stout);
	}

	@Override
	public void stOutItemModify(StOutDto stout) {
		sd.modifyStOutItem(stout);
	}

	@Override
	public List<StOutDto> companyCodeListDetails() {
		List<StOutDto> companyCodeList = null;
		companyCodeList = sd.findCompanyCodeList();
		return companyCodeList;
	}
	
	@Override
	public List<StOutDto> outCodeListDetails() {
		List<StOutDto> outCodeList = null;
		outCodeList = sd.findOutCodeList();
		return outCodeList;
	}
	
	@Override
	public List<StOutDto> whCodeListDetails() {
		List<StOutDto> whCodeList = null;
		whCodeList = sd.findWhCodeList();
		return whCodeList;
	}
	
	@Override
	public List<StOutDto> itemCodeListDetails() {
		List<StOutDto> itemCodeList = null;
		itemCodeList = sd.findItemCodeList();
		return itemCodeList;
	}

	@Override
	public void stOutItemRemove(StOutDto stout) {
		sd.removeStOutItem(stout);
	}

	@Override
	public void insertStOutDetailAdd(StOutDto stout) {
		sd.addInsertStOutDetail(stout);
	}

	@Override
	public List<StOutDto> outListWithDetailListByCustomerCode(String customerCode) {
		List<StOutDto> outListWithDetail = null;
		outListWithDetail = sd.findOutListWithDetailByCustomerCode(customerCode);
		return outListWithDetail;
	}

	@Override
	public List<StOutDto> companyCodeList2Details() {
		List<StOutDto> companyCodeList2 = null;
		companyCodeList2 = sd.findCompanyCodeList2();
		return companyCodeList2;
	}





}
