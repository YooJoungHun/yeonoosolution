package com.choongang.yeonsolution.product.som.dao;

import java.util.List;

import com.choongang.yeonsolution.product.som.domain.SOMStOutDto;

public interface SOMDao {

	List<SOMStOutDto>	selectStOutLists();
	List<SOMStOutDto>	selectStOutDetailListsByOutCode(String outCode);
	List<SOMStOutDto>	selectStOutDtoWhLists();
	List<SOMStOutDto>	selectStOutDtoItemLists();
	int					insertStOutBySOMStOutDto(SOMStOutDto stOutDto);
	int					insertStOutDetailBySOMStOutDto(SOMStOutDto stOutDto);
	int					deleteStOutByOutCode(String outCode);

}
