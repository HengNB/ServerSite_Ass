package com.utar.assignment.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "products", schema = "classicmodels")
@NamedQuery(name = "Product.findbyId", query = "SELECT p FROM Product p WHERE p.id = :id")
@NamedQuery(name = "Product.findbyAll", query = "SELECT p FROM Product p")
public class Product {
    @Id
    @Column(name = "productcode", nullable = false, length = 9)
    private String id;

    @Column(name = "productname", nullable = false, length = 43)
    private String productname;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "productline", nullable = false)
    private Productline productline;

    @Column(name = "productscale", nullable = false, length = 5)
    private String productscale;

    @Column(name = "productvendor", nullable = false, length = 25)
    private String productvendor;

    @Column(name = "productdescription", nullable = false, length = 495)
    private String productdescription;

    @Column(name = "quantityinstock", nullable = false)
    private Integer quantityinstock;

    @Column(name = "buyprice", nullable = false, precision = 5, scale = 2)
    private BigDecimal buyprice;

    @Column(name = "msrp", nullable = false, precision = 5, scale = 2)
    private BigDecimal msrp;

    public BigDecimal getMsrp() {
        return msrp;
    }

    public void setMsrp(BigDecimal msrp) {
        this.msrp = msrp;
    }

    public BigDecimal getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(BigDecimal buyprice) {
        this.buyprice = buyprice;
    }

    public Integer getQuantityinstock() {
        return quantityinstock;
    }

    public void setQuantityinstock(Integer quantityinstock) {
        this.quantityinstock = quantityinstock;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public String getProductvendor() {
        return productvendor;
    }

    public void setProductvendor(String productvendor) {
        this.productvendor = productvendor;
    }

    public String getProductscale() {
        return productscale;
    }

    public void setProductscale(String productscale) {
        this.productscale = productscale;
    }

    public Productline getProductline() {
        return productline;
    }

    public void setProductline(Productline productline) {
        this.productline = productline;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}