package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Order;
import com.utar.assignment.model.entity.Orderdetail;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

@WebServlet(name = "OrderCartController", value = "/OrderCartController")
public class OrderCartController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static String generateRandomId() {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(index));
        }
        for (int i = 0; i < 4; i++) {
            builder.append(random.nextInt(10));
        }
        return builder.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
//Clean Cart
        System.out.println("Clean cart");
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            System.out.println("Cart is empty.");
        } else{
            System.out.println("Cart is not empty.");
            cart.clear();
        }

        request.setAttribute("product_quantity_list", cart);

        Map<Product, Integer> cart2 = (Map<Product, Integer>) request.getAttribute("product_quantity_list");
        if (cart2 == null || cart2.isEmpty()) {
            System.out.println("Cart is empty.");
        } else {
            System.out.println("Items in cart:");
            for (Map.Entry<Product, Integer> entry : cart2.entrySet()) {
                Product product = entry.getKey();
                int quantity2 = entry.getValue();
                System.out.println(product.getId() + " x " + quantity2);
            }
        }

        List<Order> allOrder = empbean.getAllOrderRecords();
        request.setAttribute("allOrderRecord" , allOrder);

        int largestNumber = 0;
        for (Order o : allOrder) {
            if (o.getId() > largestNumber) {
                largestNumber = o.getId();
            }
        }
        int nextNumber = largestNumber + 1;

        request.setAttribute("nextNumber" , nextNumber);

//Set Database
        System.out.println("OrderCartController");
        // Order data
        String orderNumber = request.getParameter("orderNumber");
        String orderDate = request.getParameter("orderDate");
        String requireDate = request.getParameter("requireDate");
        String shippedDate = request.getParameter("shippedDate");
        String status = request.getParameter("status");
        String comments = request.getParameter("comments");
        String customerNumber = request.getParameter("customerNumber");

        // change it become order details
        String[] itemList = request.getParameterValues("itemList[]");
        String[] quantityList = request.getParameterValues("quantity[]");

        // Payment
        // change it become order details
        String checknum = generateRandomId();
        String paymentDate = request.getParameter("paymentDate");
        String amount = request.getParameter("amount");

        // this line is to package the whole values into one array string variable -
        String[] s = {orderNumber, orderDate , requireDate, shippedDate ,status, comments, customerNumber};
        Random rand = new Random();
        empbean.addOrder(s);
        System.out.println("Adding Order Details");
        System.out.println(itemList.length);
        for(int i = 0 ; i < itemList.length; i++) {
            System.out.println("I : " + i);
            System.out.println(itemList[i]);
            Product findProductList = empbean.findProduct(itemList[i]);
            System.out.println(quantityList[i]);
            String orderLineNumber = String.valueOf(rand.nextInt(20) + 1);
            System.out.println(orderLineNumber);
            String[] od = {orderNumber, findProductList.getId() , quantityList[i],findProductList.getMsrp().toString(),orderLineNumber};

            String productCode = findProductList.getId();
            String productName = findProductList.getProductname();
            String productLine = findProductList.getProductline().getId();
            String productScale = findProductList.getProductscale();
            String productVendor = findProductList.getProductvendor();
            String productDescription = findProductList.getProductdescription();
            String buyPrice = findProductList.getBuyprice().toString();
            String msrp = findProductList.getMsrp().toString();
            String newQuantityinStock = String.valueOf(findProductList.getQuantityinstock() - Integer.parseInt(quantityList[i]));

            String[] productUpdate = {productCode, productName, productLine, productScale, productVendor, productDescription, newQuantityinStock, buyPrice, msrp};

            empbean.updateProduct(productUpdate);
            empbean.addOrderdetail(od);
        }

        String[] pay = {customerNumber, checknum, paymentDate, amount};
        empbean.addPayment(pay);

        ValidateManageLogic.OrdernavigateJS(out,Integer.parseInt(s[0]),false,true, Integer.parseInt(customerNumber));
    }
}

