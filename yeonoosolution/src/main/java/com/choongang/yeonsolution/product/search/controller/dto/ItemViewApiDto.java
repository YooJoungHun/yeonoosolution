package com.choongang.yeonsolution.product.search.controller.dto;

import lombok.Data;

@Data
public class ItemViewApiDto {
    private String item_name;
    private String item_code;

    public ItemViewApiDto(String item_name, String item_code) {
        this.item_name = item_name;
        this.item_code = item_code;
    }
}
