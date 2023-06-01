package com.choongang.yeonsolution.product.ps.controller.dto;

import lombok.Data;

@Data
public class PsViewApiDto {
    private String item_code;
    private String item_name;
    private Long item_quantity;
    private Long product_count_y;
    private Long product_count_n;

    public PsViewApiDto(String item_code, String item_name, Long item_quantity, Long product_count_y, Long product_count_n) {
        this.item_code = item_code;
        this.item_name = item_name;
        this.item_quantity = item_quantity;
        this.product_count_y = product_count_y;
        this.product_count_n = product_count_n;
    }
}


