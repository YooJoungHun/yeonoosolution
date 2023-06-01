package com.choongang.yeonsolution.product.search.service;

import com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto;
import com.choongang.yeonsolution.product.search.repository.ItemSearchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemSearchService {
    private final ItemSearchRepository searchRepository;
    public List<ItemViewApiDto> findItem(String name, String code) {
        return searchRepository.selectItem(name,code);
    }
}
