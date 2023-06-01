package com.choongang.yeonsolution.product.ds.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Getter
@Table(name = "LOSS_VIEW")
@IdClass(LossPk.class)
public class LossViewDto {
	@Id
	private String work_order_code;

	@Id
	private Long sorder;

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
}
