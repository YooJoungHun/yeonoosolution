package com.choongang.yeonsolution.sales.pm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.sales.pm.dao.PmDao;
import com.choongang.yeonsolution.sales.pm.domain.PmCompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.PmItemDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.PmSearch;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStockInDto;
import com.choongang.yeonsolution.sales.pm.domain.PmWhDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class PmServiceImpl implements PmService{
	private final PmDao pmDao;

	@Override
	public List<PmOrdersDto> findOrdersBySearch(PmSearch search) {
		List<PmOrdersDto> orderList = pmDao.selectOrdersBySearch(search);
		for(PmOrdersDto otder : orderList) {
			if(otder.getOrderDate() != null) {
				otder.setOrderDate(otder.getOrderDate().substring(0, 10));
			}
			if(otder.getDueDate() != null) {
				otder.setDueDate(otder.getDueDate().substring(0, 10));
			}
		}
		return orderList;
	}

	@Override
	public List<PmOrdersDetailDto> findOrdersDetailByOrderCode(String orderCode) {
		return pmDao.selectOrdersDetailByOrderCode(orderCode);
	}

	@Override
	public String modifyOrdersByOrderCode(PmOrdersDto pmOrdersDto, HttpSession session) {
		pmOrdersDto.setUpdateUser(((MemberDto) session.getAttribute("member")).getMemberName());
		int result = pmDao.updateOrdersByOrderCode(pmOrdersDto);
		String msg = "";
		log.info("result -> {}",result);
		if(pmOrdersDto.getColumn().equals("deleteStatus")) {
			msg += "삭제 ";
		}else if(pmOrdersDto.getColumn().equals("orderStatus")) {
			if(pmOrdersDto.getData().equals("확정")) {
				msg += "발주확정 ";
			}else if(pmOrdersDto.getData().equals("저장")) {
				msg += "확정취소 ";
			}else {
				msg += "발주마감 ";
			}
		}
		if(result > 0 ) {
			msg += "되었습니다.";
		}else {
			msg = "되지 못했습니다. 잠시후 다시 시도해 주세요.";
		}
		return msg;
	}

	@Override
	public List<PmCompanyDto> findCompanyBySearch(String search) {
		return pmDao.selectCompanyBySearch(search);
	}

	@Override
	public List<PmItemDto> findItemBySearch(String search) {
		return pmDao.selectItemyBySearch(search);
	}

	@Override
	public String addOrder(PmOrdersDataDto orderData, HttpSession session) {
		String companyCode = ((MemberDto) session.getAttribute("member")).getCompanyCode();
		String loginUserName = ((MemberDto) session.getAttribute("member")).getMemberName();
		PmOrdersDto order = orderData.getOrder();
		order.setCompanyCode(companyCode);
		order.setRegUser(loginUserName);
		order.setUpdateUser(loginUserName);
		
        List<PmOrdersDetailDto> orderDetails = orderData.getOrderDetails();
        String orderCode = pmDao.insertOrder(order);
        int insertRow = 0;
        for(PmOrdersDetailDto orderDetail : orderDetails) {
        	orderDetail.setOrderDetailCode(orderCode);
        	insertRow += pmDao.insertOrdersDetail(orderDetail);
        }
        if(orderCode != null && insertRow == orderDetails.size()) {
        	return "저장 성공";
        }else {
        	return "저장 실패";
        }
	}

	@Override
	public String modifyOrder(PmOrdersDataDto orderData, HttpSession session) {
		String companyCode = ((MemberDto) session.getAttribute("member")).getCompanyCode();
		String loginUserName = ((MemberDto) session.getAttribute("member")).getMemberName();
		PmOrdersDto order = orderData.getOrder();
		order.setCompanyCode(companyCode);
		order.setRegUser(loginUserName);
		order.setUpdateUser(loginUserName);
		
        List<PmOrdersDetailDto> orderDetails = orderData.getOrderDetails();
        int insertRow = 0;
		int orderUpdateResult = pmDao.updateOrder(order);
		if(orderUpdateResult > 0) {
			pmDao.deleteOrderDetailByOrderCode(order.getOrderCode());
			for(PmOrdersDetailDto orderDetail : orderDetails) {
				insertRow += pmDao.insertOrdersDetail(orderDetail);
			}
		}if(insertRow == orderDetails.size()) {
        	return "수정 성공";
        }else {
        	return "수정 실패";
        }
	}

	
	
	/////////////////////////////////////////////////////////////////////////////
	// 입고
	
	
	@Override
	public List<PmStockInDto> findStockInListBySearch(PmSearch search) {
		search.setOrderDate(search.getOrderDate().replaceAll("-", "/"));
		List<PmStockInDto> stockInList = pmDao.selectStockInListBySearch(search);
		for(PmStockInDto stockIn : stockInList) {
			if(stockIn.getInDate().length() <= 9) {
				stockIn.setInDate("20" + stockIn.getInDate());
			}
			if(stockIn.getInDate() != null && stockIn.getInDate().length() > 9) {
				stockIn.setInDate(stockIn.getInDate().substring(0, 10).replaceAll("/", "-"));
			}
		}
		return stockInList;
	}

	@Override
	public List<PmStInDetailDto> findStockInDetailByInCode(String inCode) {
		return pmDao.selectStockInDetailByInCode(inCode);
	}

	@Override
	public String modifyStockInByInCode(PmStockInDto pmStockInDto, HttpSession session) {
		String loginUserName = ((MemberDto) session.getAttribute("member")).getMemberName();
		pmStockInDto.setUpdateUser(loginUserName);
		
		int result = pmDao.updateStockInByInCode(pmStockInDto);
		String msg = "";
		if(pmStockInDto.getData().equals("확정") && result > 0) {
			List<PmStInDetailDto> stInDetailList = pmDao.selectStockInDetailByInCode(pmStockInDto.getInCode());
			for(PmStInDetailDto stInDetail : stInDetailList) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("whCode", stInDetail.getWhCode());
				map.put("itemCode", stInDetail.getItemCode());
				map.put("inQuantity", stInDetail.getInQuantity());
				map.put("updateUser", loginUserName);			// 추후 세센에서 받아올 값
				pmDao.updateWhStockDetailBystInDetail(map);
			}
			
		}else if(pmStockInDto.getData().equals("저장") && result > 0) {
			List<PmStInDetailDto> stInDetailList = pmDao.selectStockInDetailByInCode(pmStockInDto.getInCode());
			for(PmStInDetailDto stInDetail : stInDetailList) {
					stInDetail.setUpdateUser(loginUserName);
				pmDao.updateWhStockDetailBystInDetail(stInDetail);
			}
		}
			
		if(pmStockInDto.getColumn().equals("deleteStatus")) {
			msg += "삭제 ";
		}else if(pmStockInDto.getColumn().equals("orderStatus")) {
			if(pmStockInDto.getData().equals("확정")) {
				msg += "입고확정 ";
			}else if(pmStockInDto.getData().equals("저장")) {
				msg += "확정취소 ";
			}else {
				msg += "발주마감 ";
			}
		}
		if(result > 0 ) {
			msg += "되었습니다.";
		}else {
			msg = "되지 못했습니다. 잠시후 다시 시도해 주세요.";
		}
		return msg;
	}

	@Override
	public List<PmWhDto> findWhList() {
		return pmDao.selectWh();
	}

	@Override
	public String addStIn(PmStInDataDto stInData, HttpSession session) {
		String companyCode = ((MemberDto) session.getAttribute("member")).getCompanyCode();
		String loginUserName = ((MemberDto) session.getAttribute("member")).getMemberName();
		PmStockInDto stIn = stInData.getStockIn();
		stIn.setInDate(stIn.getInDate().replaceAll("-", "/"));
		stIn.setCompanyCode(companyCode);
		stIn.setRegUser(loginUserName);
		stIn.setUpdateUser(loginUserName);
		
		List<PmStInDetailDto> stInDetails = stInData.getStInDetails();
		String stInCode = pmDao.insertStIn(stIn);
		log.info("stIn -> {}", stIn);
		log.info("stInDetails -> {}", stInDetails);
		int insertRow = 0;
		for(PmStInDetailDto stInDetail : stInDetails) {
			stInDetail.setInCode(stInCode);
        	insertRow += pmDao.insertStInDetail(stInDetail);
        }
		 if(stInCode != null && insertRow == stInDetails.size()) {
        	return "저장 성공";
        }else {
        	return "저장 실패";
        }
       
	}

	@Override
	public String modifyStIn(PmStInDataDto stInData, HttpSession session) {
		String companyCode = ((MemberDto) session.getAttribute("member")).getCompanyCode();
		String loginUserName = ((MemberDto) session.getAttribute("member")).getMemberName();
		PmStockInDto stIn = stInData.getStockIn();
		stIn.setInDate(stIn.getInDate().replaceAll("-", "/"));
		stIn.setCompanyCode(companyCode);
		stIn.setRegUser(loginUserName);
		stIn.setUpdateUser(loginUserName);
		
		List<PmStInDetailDto> stInDetails = stInData.getStInDetails();
		log.info("stIn -> {}", stIn);
		log.info("stInDetails -> {}", stInDetails);
		int insertRow = 0;
		int stInUpdateResult = pmDao.updateStIn(stIn);
		if(stInUpdateResult > 0) {
			int stInDetailDel = pmDao.deleteStInDetailByInCode(stIn.getInCode());
			log.info("stInDetailDel -> {}",stInDetailDel);
			log.info("stInDetails -> {}",stInDetails);
			for(PmStInDetailDto stInDetail : stInDetails) {
				insertRow += pmDao.insertStInDetail(stInDetail);
			}
		}if(insertRow == stInDetails.size()) {
        	return "수정 성공";
        }else {
        	return "수정 실패";
        }
	}
}
