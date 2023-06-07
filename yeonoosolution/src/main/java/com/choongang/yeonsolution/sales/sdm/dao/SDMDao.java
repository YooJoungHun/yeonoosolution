package com.choongang.yeonsolution.sales.sdm.dao;

import java.util.List;

import com.choongang.yeonsolution.sales.sdm.domain.SDMStOutDto;

public interface SDMDao {

	List<SDMStOutDto>      	selectOutList(String customerCode);
	List<SDMStOutDto> 		selectStOutDetailDtoListByOutCode(String outCode);
	void                	updateOutTypeConfirm(String outCode);
	void                	updateOutTypeConfirmCancel(String outCode);
	String              	findOutTypeCCYN(String outCode);
	void                	insertStOut(SDMStOutDto stout);
	void                	deleteStOutByOutCode(String outCode);
	void                	updateStOutByOutCode(SDMStOutDto stout);
	void                	updateStOutItemByOutCodeAndSorder(SDMStOutDto stout);
	List<SDMStOutDto>      	selectCompanyCodeList();
	List<SDMStOutDto>		selectfindOutCodeList();
	List<SDMStOutDto>      	selectfindWhCodeList();
	List<SDMStOutDto>      	selectfindItemCodeList();
	void                	deleteStOutItemByOutCodeAndSorder(SDMStOutDto stout);
	void                	insertStOutItem(SDMStOutDto stout);
	List<SDMStOutDto>     	selectStOutWithDetailByCustomerCode(String customerCode);
	List<SDMStOutDto>     	selectCompanyCodeList2();
}
