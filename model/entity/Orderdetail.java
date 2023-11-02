package com.utar.assignment.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "orderdetails", schema = "classicmodels")
@NamedQuery(name = "Orderdetail.findbyId", query = "SELECT od FROM Orderdetail od WHERE od.id.ordernumber = :id")
@NamedQuery(name = "Orderdetail.findbyAll", query = "SELECT od FROM Orderdetail od")
@NamedQuery(name = "Orderdetail.findbyProductCode", query = "SELECT od FROM Orderdetail od WHERE od.id.productcode = :productcode AND od.id.ordernumber = :id")
public class Orderdetail {
    @EmbeddedId
    private OrderdetailId id;

    @MapsId("ordernumber")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "ordernumber", nullable = false)
    private Order ordernumber;

    @MapsId("productcode")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "productcode", nullable = false)
    private Product productcode;

    @Column(name = "quantityordered", nullable = false)
    private Integer quantityordered;

    @Column(name = "priceeach", nullable = false, precision = 5, scale = 2)
    private BigDecimal priceeach;

    @Column(name = "orderlinenumber", nullable = false)
    private Integer orderlinenumber;

    public Integer getOrderlinenumber() {
        return orderlinenumber;
    }

    public void setOrderlinenumber(Integer orderlinenumber) {
        this.orderlinenumber = orderlinenumber;
    }

    public BigDecimal getPriceeach() {
        return priceeach;
    }

    public void setPriceeach(BigDecimal priceeach) {
        this.priceeach = priceeach;
    }

    public Integer getQuantityordered() {
        return quantityordered;
    }

    public void setQuantityordered(Integer quantityordered) {
        this.quantityordered = quantityordered;
    }

    public Product getProductcode() {
        return productcode;
    }

    public void setProductcode(Product productcode) {
        this.productcode = productcode;
    }

    public Order getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Order ordernumber) {
        this.ordernumber = ordernumber;
    }

    public OrderdetailId getId() {
        return id;
    }

    public void setId(OrderdetailId id) {
        this.id = id;
    }
}