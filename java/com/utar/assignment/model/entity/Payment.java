package com.utar.assignment.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "payments", schema = "classicmodels")
@NamedQuery(name = "Payment.findbyId", query = "SELECT p FROM Payment p WHERE p.id.checknumber = :id")
@NamedQuery(name = "Payment.findbyCustomerNum", query = "SELECT p FROM Payment p WHERE p.id.customernumber = :id")
@NamedQuery(name = "Payment.findbyAll", query = "SELECT p FROM Payment p")

public class Payment {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @EmbeddedId
    private PaymentId id;

    @MapsId("customernumber")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "customernumber", nullable = false)
    private Customer customernumber;

    @Column(name = "paymentdate", nullable = false, length = 10)
    private String paymentdate;

    @Column(name = "amount", nullable = false, precision = 8, scale = 2)
    private BigDecimal amount;

    @MapsId("customernumber")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customernumber")
    private Customer customer;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }

    public Customer getCustomernumber() {
        return customernumber;
    }

    public void setCustomernumber(Customer customernumber) {
        this.customernumber = customernumber;
    }

    public PaymentId getId() {
        return id;
    }

    public void setId(PaymentId id) {
        this.id = id;
    }
}