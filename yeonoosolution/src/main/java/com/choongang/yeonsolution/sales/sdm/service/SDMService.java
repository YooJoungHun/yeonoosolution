package com.choongang.yeonsolution.sales.sdm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.sdm.domain.SDMStOutDto;

public interface SDMService {

	List<SDMStOutDto>      findOutListByCustomerCode(String customerCode);
	List<SDMStOutDto> 		findStOutDetailDtoListByOutCode(String outCode);
	void                outTypeConfirmModify(String outCode);
	void                outTypeConfirmCancelModify(String outCode);
	String              outTypeCCYNDetails(SDMStOutDto stout);
	void                addStOut(SDMStOutDto stout);
	void                removeStOutByOutCode(String outCode);
	void                modifyStOutByOutCode(SDMStOutDto stout);
	void                modifyStOutItemByOutCodeAndSorder(SDMStOutDto stout);
	List<SDMStOutDto>      findCompanyCodeList();
	List<SDMStOutDto>      findOutCodeList();
	List<SDMStOutDto>      findWhCodeList();
	List<SDMStOutDto> 	    findItemCodeList();
	void                removeStOutItemByOutCodeAndSorder(SDMStOutDto stout);
	void                addStOutItem(SDMStOutDto stout);
	List<SDMStOutDto>      findStOutListWithDetailByCustomerCode(String customerCode);
	List<SDMStOutDto>      findCompanyCodeList2();
}
