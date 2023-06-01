package com.choongang.yeonsolution.product.search.controller.api;

import com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto;
import com.choongang.yeonsolution.product.search.service.ItemSearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class SearchRestController {
    private final ItemSearchService searchService;

    @GetMapping("/api/item_search")
    public List<ItemViewApiDto> itemList(@RequestParam(required = false) String name, @RequestParam(required = false) String code) {
        if (name == null && code == null) {
            return searchService.findItem(null, null);
        } else if (name == null) {
            return searchService.findItem(null, code);
        } else if (code == null) {
            return searchService.findItem(name, null);
        } else {
            return searchService.findItem(name, code);
        }
    }
}
