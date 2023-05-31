package com.choongang.yeonsolution.sales.sdm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.sdm.domain.StOutDto;

public interface SDMService {

	List<StOutDto>      outListByCustomerCode(String customerCode);
	List<StOutDto> 		outDetailList(String outCode);
	void                outTypeCModify(String outCode);
	void                outTypeCCModify(String outCode);
	String              outTypeCCYNDetails(StOutDto stout);
	void                insertStOutAdd(StOutDto stout);
	void                stOutRemove(String outCode);
	void                stOutModify(StOutDto stout);
	void                stOutItemModify(StOutDto stout);
	List<StOutDto>      companyCodeListDetails();
	List<StOutDto>      outCodeListDetails();
	List<StOutDto>      whCodeListDetails();
	List<StOutDto> 	    itemCodeListDetails();
	void                stOutItemRemove(StOutDto stout);
	void                insertStOutDetailAdd(StOutDto stout);
	List<StOutDto>      outListWithDetailListByCustomerCode(String customerCode);
	List<StOutDto>      companyCodeList2Details();
}
