package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Order;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ChangeQuantityServlet", value = "/ChangeQuantityServlet")
public class ChangeQuantityServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String productId = request.getParameter("id");
        String quantityStr = request.getParameter("num");
        String cusID = request.getParameter("cusID");

        Product b = new Product();
        b.setId(productId);
        int quantity = Integer.parseInt(quantityStr);
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Product p = empbean.findProduct(productId);

        if (cart == null || cart.isEmpty()) {
            out.println("Cart is empty.");
        } else {
            if(quantity != 0) {
                for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
                    Product product = entry.getKey();
                    int quantity2 = entry.getValue();
                    if(product.getId().equals(productId)){
                        cart.put(product, quantity);
                        out.println(productId);
                        break; // exit the loop after updating the quantity
                    }
                }
            }
            else{
                for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
                    Product product = entry.getKey();
                    int quantity2 = entry.getValue();
                    if(product.getId().equals(productId)){
                        cart.remove(product);
                        out.println(productId);
                        break; // exit the loop after updating the quantity
                    }
                }
            }
        }

        request.setAttribute("product_quantity_list", cart);
        request.setAttribute("cusID", cusID);
        Map<Product, Integer> cart2 = (Map<Product, Integer>) request.getAttribute("product_quantity_list");

        if (cart2 == null || cart2.isEmpty()) {
            out.println("Cart is empty.");
        } else {
            out.println("Items in cart:");
            for (Map.Entry<Product, Integer> entry : cart2.entrySet()) {
                Product product = entry.getKey();
                int quantity2 = entry.getValue();
                out.println(product.getId() + " x " + quantity2);
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
        // Forward the request back to the JSP pag
        RequestDispatcher dispatcher = request.getRequestDispatcher("/OrderCart.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}