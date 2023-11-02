package com.utar.assignment.model.sessionbean;

import com.utar.assignment.model.entity.*;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface ClassicmodelsSessionBeanLocal {
    /* Read All Records*/
    public List<Payment> getAllPaymentRecords() throws EJBException;
    public List<Customer> getAllCustomerRecords() throws EJBException;
    public List<Product> getAllProductRecords() throws EJBException;
    public List<Productline> getAllProductlineRecords() throws EJBException;
    public List<Order> getAllOrderRecords() throws EJBException;
    public List<Order> getOrderRecordByCID(String cid) throws EJBException;
    public List<Orderdetail> getAllOrderdetailRecords() throws EJBException;
    public List<Employee> getAllEmployeeRecords() throws EJBException;
    public List<User> getAllUserRecords() throws EJBException;

    /* Find the total records of the DB */
    public int getNumberOfRowsPayment(String keyword) throws EJBException;
    public int getNumberOfRowsCustomer(String keyword) throws EJBException;
    public int getNumberOfRowsProduct(String keyword) throws EJBException;
    public int getNumberOfRowsProductline(String keyword) throws EJBException;
    public int getNumberOfRowsOrder(String keyword) throws EJBException;
    public int getNumberOfRowsOrderRecordByCID(int cid) throws EJBException;

    public List<Payment> readPayment(int currentPage, int recordsPerPage, String keyword,String direction) throws EJBException;
    public List<Customer> readCustomer(int currentPage, int recordsPerPage, String keyword,String direction) throws EJBException;
    public List<Product> readProduct(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Productline> readProductline(int currentPage, int recordsPerPage, String keyword) throws EJBException;
    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Orderdetail> readOrderdetails(int id,String keyword, String direction) throws EJBException;

    /* Read Single Records*/
    public Payment findPayment(String id) throws EJBException;
    public Customer findCustomer(Integer id) throws EJBException;
    public Product findProduct(String id) throws EJBException;
    public Productline findProductline(String id) throws EJBException;
    public Order findOrderRecords(int id) throws EJBException;
    public Orderdetail findOrderDetailsRecords(String productCode, int id) throws EJBException;
    public User findUser(String username, String password) throws EJBException;
    public Employee findEmployee(Integer id) throws EJBException;

    /* Update Single Records*/
    public void updatePayment(String[] s) throws EJBException;
    public void updateCustomer(String[] s) throws EJBException;
    public void updateProduct(String[] s) throws EJBException;
    public void updateProductline(String[] s) throws EJBException;
    public void updateOrder(String[] s) throws EJBException;
    public void updateOrderdetail(String[] s) throws EJBException;

    /* Delete Single Records*/
    public void deletePayment(String id) throws EJBException;
    public void deleteCustomer(String id) throws EJBException;
    public void deleteProduct(String id) throws EJBException;
    public void deleteProductline(String id) throws EJBException;
    public void deleteOrder(String id) throws EJBException;
    public void deleteOrderdetail(String productCode, int id) throws EJBException;

    /* Add Single Records */
    public void addPayment(String[] s) throws EJBException;
    public void addCustomer(String[] s) throws EJBException;
    public void addProduct(String[] s) throws EJBException;
    public void addProductline(String[] s) throws EJBException;
    public void addOrder(String[] s) throws EJBException;
    public void addOrderdetail(String[] s) throws EJBException;

    public int UserLogin(String id, String password) throws EJBException;
    public int SetCustomerNum (String id) throws EJBException;
    public Integer findMaxCustomerNumber() throws EJBException;
    public List<Payment> findPaymentHistory(int id) throws EJBException;

}
