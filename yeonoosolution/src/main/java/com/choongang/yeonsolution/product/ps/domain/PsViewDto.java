package com.choongang.yeonsolution.product.ps.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "PS_VIEW")
@IdClass(WODetailPK.class)
@Getter
public class PsViewDto {
    @Id
    private String work_order_code;

    @Id
    private Long sorder;

    private String item_code;

    private String worker;

    private LocalDate work_date;

    private Long work_order_quantity;

    private Long worker_count;

    private String good_yn;

    private String memo;

    private String item_name;

    private Long item_quantity;
}
