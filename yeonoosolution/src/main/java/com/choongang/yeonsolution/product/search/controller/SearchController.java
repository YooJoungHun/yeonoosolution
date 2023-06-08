package com.choongang.yeonsolution.product.search.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class SearchController {
    @GetMapping("/item/search")
    public String itemList() {
        return "product/item_search";
    }
}
