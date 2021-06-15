package com.lmsu.orderdata.orders;

import lombok.Data;

import java.io.Serializable;
import java.sql.Date;

public @Data
class OrderDTO implements Serializable {
    /**
     * @param lendMethod false = direct, true = delivery
     */
    private int id;
    private String memberID;
    private Date orderDate;
    private boolean lendMethod;

    public OrderDTO() {
    }

    public OrderDTO(int id, String memberID, Date orderDate, boolean lendMethod) {
        this.id = id;
        this.memberID = memberID;
        this.orderDate = orderDate;
        this.lendMethod = lendMethod;
    }
}
