package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Order;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductViewController", value = "/ProductViewController")
public class ProductViewController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;
    List<Product> productlist = new ArrayList<>();
    List<Integer> quantitylist = new ArrayList<>();
    Map<Product, Integer> productquantitylist = new LinkedHashMap<Product, Integer>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        String customer_num = request.getParameter("cusID");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        int quantity = Integer.valueOf(request.getParameter("quantity"));

        if((id.equals("empty")) && (quantity==0)){
            request.setAttribute("product_quantity_list", productquantitylist);
            Map<Product, Integer> cart = (Map<Product, Integer>) request.getAttribute("product_quantity_list");
            productlist.clear();
            quantitylist.clear();
            for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
                productlist.add(entry.getKey());
                quantitylist.add(entry.getValue());
                System.out.println("Product: " + entry.getKey().getId() + ", Quantity: " + entry.getValue().toString());
            }
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("recordsPerPage", recordsPerPage);
            request.setAttribute("keyword", keyword);
            request.setAttribute("direction", direction);
            request.setAttribute("cusID", customer_num);

            RequestDispatcher req = request.getRequestDispatcher("ViewProductLogic");
            req.forward(request, response);
        } else {
            try {
                boolean check = false;
                for (int i = 0; i < productlist.size(); i++) {
                    Product product = productlist.get(i);
                    if (product.getId().equals(id)) {
                        quantitylist.set(i, (quantitylist.get(i) + quantity));
                        check = true;
                    }
                }
                if (!check) {
                    Product product = empbean.findProduct(id);
                    productlist.add(product);
                    quantitylist.add(quantity);
                }
            } catch (EJBException ex) {
                out.println("error");
            }

            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("recordsPerPage", recordsPerPage);
            request.setAttribute("keyword", keyword);
            request.setAttribute("direction", direction);
            request.setAttribute("cusID", customer_num);

            RequestDispatcher req = request.getRequestDispatcher("ViewProductLogic");
            req.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customer_num = request.getParameter("cusID");
        PrintWriter out = response.getWriter();

        try {
            for (int i = 0; i < productlist.size(); i++) {
                Product product = productlist.get(i);
                Integer quantity = quantitylist.get(i);
                productquantitylist.put(product, quantity);
            }
            for (Map.Entry<Product, Integer> entry : productquantitylist.entrySet()) {
                System.out.println("**Product: " + entry.getKey().getId() + ", Quantity: " + entry.getValue().toString());
            }
            request.setAttribute("product_quantity_list", productquantitylist);

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
            request.setAttribute("cusID", customer_num);

        } catch (EJBException ex) {
            out.println("error");
        }

        RequestDispatcher req = request.getRequestDispatcher("OrderCart.jsp");
        req.forward(request, response);
    }
}
