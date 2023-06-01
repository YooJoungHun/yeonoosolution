package com.choongang.yeonsolution.product.ds.repository;

import com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class DsRepository {
    private final EntityManager em;

    public List<LossViewApiDto> selectDsAll(LocalDate start, LocalDate end, String name, String code) {
        if (name == null && code == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto(" +
                            "l.item_code,l.item_name,l.defective_loss_type, l.defective_loss_quantity, l.defective_loss_date" +
                            ", l.reg_user, l.reg_date, l.update_user, l.update_date, l.memo)"
                            + " from LossViewDto l"
                            + " where l.defective_loss_date between :startDate and :endDate", LossViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .getResultList();
        } else if (code == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto(" +
                            "l.item_code,l.item_name,l.defective_loss_type, l.defective_loss_quantity, l.defective_loss_date" +
                            ", l.reg_user, l.reg_date, l.update_user, l.update_date, l.memo)"
                            + " from LossViewDto l"
                            + " where l.defective_loss_date between :startDate and :endDate"
                            + " and l.item_name like CONCAT('%', :item_name, '%')", LossViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_name", name)
                    .getResultList();
        } else if (name == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto(" +
                            "l.item_code,l.item_name,l.defective_loss_type, l.defective_loss_quantity, l.defective_loss_date" +
                            ", l.reg_user, l.reg_date, l.update_user, l.update_date, l.memo)"
                            + " from LossViewDto l"
                            + " where l.defective_loss_date between :startDate and :endDate"
                            + " and l.item_code LIKE CONCAT('%', :item_code, '%')", LossViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_code", code)
                    .getResultList();
        } else {
            return em.createQuery("select new com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto(" +
                            "l.item_code,l.item_name,l.defective_loss_type, l.defective_loss_quantity, l.defective_loss_date" +
                            ", l.reg_user, l.reg_date, l.update_user, l.update_date, l.memo)"
                            + " from LossViewDto l"
                            + " where l.defective_loss_date between :startDate and :endDate"
                            + " and l.item_code LIKE CONCAT('%', :item_code, '%')"
                            + " and l.item_name like CONCAT('%', :item_name, '%')", LossViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_name", name)
                    .setParameter("item_code", code)
                    .getResultList();
        }
    }
}
