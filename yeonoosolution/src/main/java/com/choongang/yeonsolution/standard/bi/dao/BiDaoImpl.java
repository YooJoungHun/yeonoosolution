package com.choongang.yeonsolution.standard.bi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.bi.domain.CompanyDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class BiDaoImpl implements BiDao {
	private final SqlSession session;

	@Override
	public List<CompanyDto> selectCompanyInfoByCompanyCode(String companyCode) {
		List<CompanyDto> companyDtoList = null;
		try {
			companyDtoList = session.selectList("biSelectCompanyInfoByCompanyCode", companyCode);
		} catch (Exception e) {
			log.error("bidao selectCompanyInfoByCompanyCode 에러  -> {} ",e.getMessage());
			
		}
		return companyDtoList;
	}

	@Override
	public String selectCompanyImgByCompanyCode(String companyCode) {
		String logoImg = null;
		try {
			logoImg = session.selectOne("biSelectCompanyImgByCompanyCode", companyCode);
		} catch (Exception e) {
			log.error("bidao biSelectCompanyImgByCompanyCode 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return logoImg;
	}

	@Override
	public int updateCompanyInfoByCompanyCode(CompanyDto companyDto) {
		int result = 0;
		try {
			result = session.update("biUpdateCompanyInfoByCompanyCode", companyDto);
		} catch (Exception e) {
			log.error("bidao updateCompanyInfoByCompanyCode 에러  -> {} ",e.getMessage());
		}
		return result;
	}

	@Override
	public int updateCompanyLogoImgByCompanyCode(CompanyDto companyDto) {
		int result = 0;
		try {
			result = session.update("biUpdateCompanyLogoImgByCompanyCode", companyDto);
		} catch (Exception e) {
			log.error("bidao updateCompanyLogoImgByCompanyCode 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
		
	}

	@Override
	public List<CompanyDto> selectCustomerInfoByCompanyCode(String companyCode) {
		List<CompanyDto> companyDtoList = null;
		try {
			companyDtoList = session.selectList("biSelectCustomerInfoByCompanyCode", companyCode);
		} catch (Exception e) {
			log.error("bidao selectCustomerInfoByCompanyCode 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return companyDtoList;
	}

	@Override
	public int insertCustomerInfo(CompanyDto companyDto) {
		int result = 0;
		try {
			result = session.insert("biInsertCustomerInfo", companyDto);
		} catch (Exception e) {
			log.error("bidao insertCustomerInfo 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int updateCustomerInfoByCompanyCode(CompanyDto companyDto) {
		int result = 0;
		try {
			result = session.update("biUpdateCustomerInfoByCompanyCode", companyDto);
		} catch (Exception e) {
			log.error("bidao updateCustomerInfoByCompanyCode 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<CompanyDto> selectCustomerInfoByCompanyNameAndOrderType(CompanyDto companyDto) {
		List<CompanyDto> companyDtoList = null;
		try {
			companyDtoList = session.selectList("biSelectCustomerInfoByCompanyNameAndOrderType", companyDto);
		} catch (Exception e) {
			log.error("bidao selectCustomerInfoByCompanyNameAndOrderType 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return companyDtoList;
	}

	@Override
	public String selectCompanyLogoImgByCompanyCode(String companyCode) {
		String deletedName = null;
		try {
			deletedName = session.selectOne("biSelectCompanyLogoImgByCompanyCode", companyCode);
		} catch (Exception e) {
			log.error("bidao selectCompanyLogoImgByCompanyCode 에러  -> {} ",e.getMessage());
			// TODO: handle exception
		}
		return deletedName;
	}

}
