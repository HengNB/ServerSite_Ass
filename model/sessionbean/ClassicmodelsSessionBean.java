package com.utar.assignment.model.sessionbean;

import com.utar.assignment.model.entity.*;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Stateless
public class ClassicmodelsSessionBean implements ClassicmodelsSessionBeanLocal {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Payment> getAllPaymentRecords() throws EJBException {
        return em.createNamedQuery("Payment.findbyAll").getResultList();
    }

    @Override
    public List<Customer> getAllCustomerRecords() throws EJBException {
        return em.createNamedQuery("Customer.findbyAll").getResultList();
    }

    @Override
    public List<Product> getAllProductRecords() throws EJBException {
        return em.createNamedQuery("Product.findbyAll").getResultList();
    }

    @Override
    public List<Productline> getAllProductlineRecords() throws EJBException {
        return em.createNamedQuery("Productline.findbyAll").getResultList();
    }

    @Override
    public List<Order> getAllOrderRecords() throws EJBException {
        return em.createNamedQuery("Order.findbyAll").getResultList();
    }

    @Override
    public List<Order> getOrderRecordByCID(String cid) throws EJBException {
        Query query = em.createNamedQuery("Order.findbyCustomerID");
        query.setParameter("cid",Integer.parseInt(cid));
        List<Order> result = query.getResultList();
        return result;
    }


    @Override
    public List<Orderdetail> getAllOrderdetailRecords() throws EJBException {
        return em.createNamedQuery("Orderdetail.findbyAll").getResultList();
    }

    @Override
    public List<Employee> getAllEmployeeRecords() throws EJBException {
        return em.createNamedQuery("Employee.findbyAll").getResultList();
    }

    @Override
    public List<User> getAllUserRecords() throws EJBException {
        return em.createNamedQuery("User.findbyAll").getResultList();
    }

    @Override
    public int getNumberOfRowsPayment(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.payments");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.payments WHERE concat(customernumber,checknumber,paymentdate,amount) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }

        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsCustomer(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.customers");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.customers WHERE concat(customernumber,customername,contactlastname,contactfirstname,phone,addressline1,addressline2,city, state, postalcode, country) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }


        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    public int getNumberOfRowsPayment() throws EJBException{
        Query query = null;
        query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.payments");
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    public int getNumberOfRowsProduct(String keyword) throws EJBException{
        Query query = null;
        if (keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.products");
        } else {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.products WHERE concat(productcode,productname) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsProductline(String keyword) throws EJBException {
        Query query = null;
        if (keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.productlines");
        } else {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.productlines WHERE concat(productline) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsOrder(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.orders");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.orders WHERE concat(CAST(ordernumber AS VARCHAR(10)),orderdate,requireddate,shippeddate,status,comments,customernumber) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }

        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsOrderRecordByCID(int cid) throws EJBException {
        Query query = null;
        query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.orders WHERE customernumber = :cid");
        query.setParameter("cid", cid);
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public List<Payment> readPayment(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.payments order by customernumber" + direction, Payment.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * from classicmodels.payments WHERE concat(customernumber,checknumber,paymentdate,amount) LIKE ? order by customernumber" + direction, Payment.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Payment> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Customer> readCustomer(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.customers order by customernumber" + direction, Customer.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * from classicmodels.customers WHERE concat(customernumber,customername,contactlastname,contactfirstname,phone,addressline1,addressline2,city, state, postalcode, country)LIKE ? order by customernumber" + direction, Customer.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }

        //start of the record that shows ( every 20 records then start new record )
        List<Customer> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Product> readProduct(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.products order by quantityinstock" + direction , Product.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM classicmodels.products WHERE concat(productcode,productname) LIKE ? order by quantityinstock" + direction, Product.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }

        List<Product> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Productline> readProductline(int currentPage, int recordsPerPage, String keyword) throws EJBException {
        Query q = null;
        int start = 0;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.productlines", Productline.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM classicmodels.productlines WHERE concat(productline) LIKE ?", Productline.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }

        List<Productline> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orders order by ordernumber"+ direction , Order.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        }else{

            q = em.createNativeQuery("SELECT * from classicmodels.orders WHERE concat(CAST(ordernumber AS VARCHAR(10)),orderdate,requireddate,shippeddate,status,comments,customernumber) LIKE ? order by ordernumber"+ direction ,Order.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        List<Order> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Orderdetail> readOrderdetails(int id, String keyword, String direction) throws EJBException {

        Query q= null;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE ordernumber = ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            //start of the record that shows ( every 20 records then start new record )
        }else{
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE ordernumber = ? AND concat(productcode, orderlinenumber,priceeach,quantityordered) LIKE ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            q.setParameter(2 ,"%" + keyword + "%");

        }
        List<Orderdetail> results = q.getResultList();
        return results;
    }

    @Override
    public Payment findPayment(String id) throws EJBException {
        Query query = em.createNamedQuery("Payment.findbyId");
        query.setParameter("id", id);
        return (Payment) query.getSingleResult();
    }

    @Override
    public Product findProduct(String id) throws EJBException {
        Query query = em.createNamedQuery("Product.findbyId");
        query.setParameter("id", id);
        return (Product) query.getSingleResult();
    }

    @Override
    public Productline findProductline(String id) throws EJBException {
        Query query = em.createNamedQuery("Productline.findbyId");
        query.setParameter("id", id);
        return (Productline) query.getSingleResult();
    }

    @Override
    public Order findOrderRecords(int id) throws EJBException {
        Query query = em.createNamedQuery("Order.findbyId");
        query.setParameter("id", id);
        return (Order) query.getSingleResult();
    }

    @Override
    public Orderdetail findOrderDetailsRecords(String productCode, int id) throws EJBException{
        Query query = em.createNamedQuery("Orderdetail.findbyProductCode");
        query.setParameter("productcode", productCode);
        query.setParameter("id", id);
        return (Orderdetail) query.getSingleResult();
    }

    @Override
    public User findUser(String username, String password) throws EJBException {
        Query query = em.createNamedQuery("User.findbyRecord");
        query.setParameter("id", username);
        query.setParameter("password", password);
        return (User) query.getSingleResult();
    }

    @Override
    public Employee findEmployee(Integer id) throws EJBException {
        Query query = em.createNamedQuery("Employee.findbyId");
        query.setParameter("id", id);
        return (Employee) query.getSingleResult();
    }

    @Override
    public Customer findCustomer(Integer id) throws EJBException {
        Query query = em.createNamedQuery("Customer.findbyId");
        query.setParameter("id", id);
        return (Customer) query.getSingleResult();
    }


    @Override
    public void updatePayment(String[] s) throws EJBException {
        Payment payment = findPayment(s[1]);
        PaymentId paymentId = new PaymentId();
        paymentId.setCustomernumber(Integer.valueOf(s[0]));
        paymentId.setChecknumber(s[1]);
        payment.setId(paymentId);
        payment.setPaymentdate(s[2]);
        payment.setAmount(BigDecimal.valueOf(Double.parseDouble(s[3])));
        em.merge(payment);
    }

    @Override
    public void updateCustomer(String[] s) throws EJBException {
        Customer customer = findCustomer(Integer.parseInt(s[0]));
        customer.setCustomername(s[1]);
        customer.setContactlastname(s[2]);
        customer.setContactfirstname(s[3]);
        customer.setPhone(s[4]);
        customer.setAddressline1(s[5]);
        customer.setAddressline2(s[6]);
        customer.setCity(s[7]);
        customer.setState(s[8]);
        customer.setPostalcode(s[9]);
        customer.setCountry(s[10]);

        if (!(s[11].equals("null"))) {
            Employee emp = findEmployee(Integer.parseInt(s[11]));
            customer.setSalesrepemployeenumber(emp);
        } else {
            customer.setSalesrepemployeenumber(null);
        }
        if (s[12] != null && s[12].length() > 0 && !s[12].equals("") && !(s[12].equals("null"))) {
            customer.setCreditlimit(BigDecimal.valueOf(Double.parseDouble(s[12])));
        } else {
            customer.setCreditlimit(null);
        }
        em.merge(customer);
    }

    @Override
    public void updateProduct(String[] s) throws EJBException {
        Product product = findProduct(s[0]);
        product.setId(s[0]);
        product.setProductname(s[1]);
        Productline productline = new Productline();
        productline.setId(s[2]);
        productline.setHtmldescription(null);
        productline.setTextdescription(null);
        productline.setImage(null);
        product.setProductline(productline);
        product.setProductscale(s[3]);
        product.setProductvendor(s[4]);
        product.setProductdescription(s[5]);
        product.setQuantityinstock(Integer.parseInt(s[6]));
        product.setBuyprice(BigDecimal.valueOf(Double.parseDouble(s[7])));
        product.setMsrp(BigDecimal.valueOf(Double.parseDouble(s[8])));
        em.merge(product);
    }

    @Override
    public void updateProductline(String[] s) throws EJBException {
        Productline productline = findProductline(s[0]);
        productline.setId(s[0]);
        productline.setTextdescription(s[1]);
        productline.setHtmldescription(s[2]);
        productline.setImage(s[3]);
        em.merge(productline);
    }

    @Override
    public void updateOrder(String[] s) throws EJBException {
        Order order = findOrderRecords(Integer.parseInt(s[0]));
        order.setRequireddate(s[2]);
        order.setShippeddate(s[3]);
        order.setStatus(s[4]);
        order.setComments(s[5]);
        order.setCustomernumber(Integer.parseInt(s[6]));
        em.merge(order);
    }

    @Override
    public void updateOrderdetail(String[] s) throws EJBException {
        Orderdetail orderdetail = findOrderDetailsRecords(s[1],Integer.parseInt(s[0]));
        OrderdetailId orderDetailId = new OrderdetailId();
        orderdetail.setQuantityordered(Integer.parseInt(s[2]));
        orderdetail.setPriceeach(BigDecimal.valueOf(Double.parseDouble(s[3])));
        orderdetail.setOrderlinenumber(Integer.parseInt(s[4]));
        em.merge(orderdetail);
    }

    @Override
    public void deletePayment(String id) throws EJBException {
        Payment payment = findPayment(id);
        em.remove(payment);
    }

    @Override
    public void deleteCustomer(String id) throws EJBException {
        Customer customer = findCustomer(Integer.parseInt(id));

        List<Payment> payment = findPaymentHistory(Integer.parseInt(id));
        if (payment.size() != 0) {
            for (Payment t : payment) {
                    em.remove(t);

            }
        } else {
            System.out.println("No such thing");
        }

        em.remove(customer);
    }

    @Override
    public void deleteProduct(String id) throws EJBException {
        Product product = findProduct(id);
        em.remove(product);
    }

    @Override
    public void deleteProductline(String id) throws EJBException {
        Productline productline = findProductline(id);
        List<Product> product = getAllProductRecords();
        if (product.size() != 0) {
            for (Product t : product) {
                if(t.getProductline().getId().equals(id)) {
                    em.remove(t);
                }
            }
        } else {
            System.out.println("No product with such product line.");
        }
        em.remove(productline);
    }

    @Override
    public void deleteOrder(String id) throws EJBException {
        Order order = findOrderRecords(Integer.parseInt(id));
        List<Orderdetail> orderDetails = readOrderdetails(Integer.parseInt(id), "", "ASC");
        for (Orderdetail od : orderDetails) {
            em.remove(od);
        }
        em.remove(order);
    }

    @Override
    public void deleteOrderdetail(String productCode,int id) throws EJBException {
        Orderdetail orderdetail = findOrderDetailsRecords(productCode, id);
        em.remove(orderdetail);
    }

    @Override
    public void addPayment(String[] s) throws EJBException {
        try {
            Payment payment = new Payment();
            PaymentId paymentId = new PaymentId();
            Customer customer = findCustomer(Integer.valueOf(s[0]));
            payment.setCustomer(customer);
            payment.setCustomernumber(customer);
            paymentId.setCustomernumber(Integer.valueOf(s[0]));
            paymentId.setChecknumber(s[1]);
            payment.setId(paymentId);
            payment.setPaymentdate(s[2]);
            payment.setAmount(BigDecimal.valueOf(Double.parseDouble(s[3])));
            em.persist(payment);
        } catch (Exception ex) {
            System.out.println("ERROR");
        }
    }

    @Override
    public void addCustomer(String[] s) throws EJBException {
        try {
            Customer customer = new Customer();
            customer.setId(Integer.valueOf(s[0]));
            customer.setCustomername(s[1]);
            customer.setContactlastname(s[2]);
            customer.setContactfirstname(s[3]);
            customer.setPhone(s[4]);
            customer.setAddressline1(s[5]);
            customer.setAddressline2(s[6]);
            customer.setCity(s[7]);
            customer.setState(s[8]);
            customer.setPostalcode(s[9]);
            customer.setCountry(s[10]);
            if (s[11] != null && s[11].length() > 0 && !s[11].equals("") && !(s[11].equals("null"))) {
                Employee employee = findEmployee(Integer.valueOf(s[11]));
                customer.setSalesrepemployeenumber(employee);

            } else {
                customer.setSalesrepemployeenumber(null);
            }
            if (s[12] != null && s[12].length() > 0 && !s[12].equals("") && !(s[12].equals("null"))) {
                customer.setCreditlimit(BigDecimal.valueOf(Double.parseDouble(s[12])));
            } else {
                customer.setCreditlimit(null);
            }

            em.persist(customer);
        } catch(Exception ex) {
            System.out.println("ERROR");
        }
    }

    @Override
    public void addProduct(String[] s) throws EJBException {
        try {
            Product product = new Product();
            product.setId(s[0]);
            product.setProductname(s[1]);
            Productline productline = findProductline(s[2]);
            product.setProductline(productline);
            product.setProductscale(s[3]);
            product.setProductvendor(s[4]);
            product.setProductdescription(s[5]);
            product.setQuantityinstock(Integer.parseInt(s[6]));
            product.setBuyprice(BigDecimal.valueOf(Double.parseDouble(s[7])));
            product.setMsrp(BigDecimal.valueOf(Double.parseDouble(s[8])));
            em.persist(product);
        } catch (Exception ex){
            System.out.println("ERROR");
            ex.printStackTrace();
        }
    }

    @Override
    public void addProductline(String[] s) throws EJBException {
        try {
            Productline productline = new Productline();
            productline.setId(s[0]);
            productline.setTextdescription(s[1]);
            productline.setHtmldescription(s[2]);
            productline.setImage(s[3]);
            em.persist(productline);
        } catch (Exception ex){
            System.out.println("ERROR");
            ex.printStackTrace();
        }
    }

    @Override
    public void addOrder(String[] s) throws EJBException {
        try {
            Order order= new Order();
            order.setId(Integer.parseInt(s[0]));
            order.setOrderdate(s[1]);
            order.setRequireddate(s[2]);
            order.setShippeddate(s[3]);
            order.setStatus(s[4]);
            order.setComments(s[5]);
            order.setCustomernumber(Integer.parseInt(s[6]));
            em.persist(order);
        }catch (Exception ex){
            System.out.println("ERROR");
            ex.printStackTrace();
        }
    }

    @Override
    public void addOrderdetail(String[] s) throws EJBException {
        try {
            Orderdetail orderdetail= new Orderdetail();
            OrderdetailId orderdetailId = new OrderdetailId();
            orderdetailId.setOrdernumber(Integer.parseInt(s[0]));
            orderdetailId.setProductcode(s[1]);
            Order order = findOrderRecords(Integer.parseInt(s[0]));
            Product product = findProduct(s[1]);
            orderdetail.setId(orderdetailId);
            orderdetail.setOrdernumber(order);
            orderdetail.setProductcode(product);
            orderdetail.setQuantityordered(Integer.parseInt(s[2]));
            orderdetail.setPriceeach(BigDecimal.valueOf(Double.parseDouble(s[3])));
            orderdetail.setOrderlinenumber(Integer.parseInt(s[4]));
            em.persist(orderdetail);
        }catch (Exception ex){
            System.out.println("ERROR");
            ex.printStackTrace();
        }
    }

    @Override
    public int UserLogin(String id, String password) throws EJBException {
        try {
            User user = findUser(id, password);
            List<User> users = getAllUserRecords();
            if (users.size() != 0) {
                for (User t : users) {
                    if (t.getId().equals(id) && t.getPassword().equals(password)) {
                        if (id.equals("admin") && password.equals("admin")) {
                            return 1;
                        }
                        else if (id.equals("sam") && password.equals("sam")){
                            return 4;
                        }
                        else if (id.equals("david") && password.equals("david")){
                            return 4;
                        }
                        else{
                            return 2;
                        }
                    }
                }
            }
        }
        catch (Exception ex) {
            return 3;
        }
        return 3;
    }

    @Override
    public int SetCustomerNum (String id) throws EJBException{
        List<Customer> customers = getAllCustomerRecords();
        if (customers.size() != 0) {
            for (Customer t : customers) {
                if (t.getContactfirstname().equals(id)) {
                    return t.getId();
                }
            }
        } else {
            System.out.println("No such thing");
        }
        return 0;
    }

    @Override
    public Integer findMaxCustomerNumber() {
        TypedQuery<Integer> query = em.createNamedQuery("Customer.findMaxId", Integer.class);
        Integer result = query.getSingleResult();
        return result;
    }

    @Override
    public List<Payment> findPaymentHistory(int id) throws EJBException{
        Query query = em.createNamedQuery("Payment.findbyCustomerNum");
        query.setParameter("id", id);
        return query.getResultList();
    }
}
