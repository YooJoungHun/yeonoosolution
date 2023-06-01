package com.choongang.yeonsolution.product.ds.controller.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class LossViewApiDto {

    private String item_code;

    private String item_name;

    private String defective_loss_type;

    private Long defective_loss_quantity;

    private LocalDate defective_loss_date;

    private String reg_user;

    private LocalDate reg_date;

    private String update_user;

    private LocalDate update_date;

    private String memo;

    public LossViewApiDto(String item_code, String item_name, String defective_loss_type, Long defective_loss_quantity,
                          LocalDate defective_loss_date, String reg_user, LocalDate reg_date,
                          String update_user, LocalDate update_date, String memo) {
        this.item_code = item_code;
        this.item_name = item_name;
        this.defective_loss_type = defective_loss_type;
        this.defective_loss_quantity = defective_loss_quantity;
        this.defective_loss_date = defective_loss_date;
        this.reg_user = reg_user;
        this.reg_date = reg_date;
        this.update_user = update_user;
        this.update_date = update_date;
        this.memo = memo;
    }
}
