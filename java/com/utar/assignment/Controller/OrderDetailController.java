package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Orderdetail;
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
import java.util.List;

@WebServlet(name = "OrderDetailController", value = "/OrderDetailController")
public class OrderDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String productCode = request.getParameter("productCode");
        int id = Integer.parseInt(request.getParameter("id"));
        out.println(id);
        out.println(productCode);
        try {

            Orderdetail orderdetail = empbean.findOrderDetailsRecords(productCode,id);
            request.setAttribute("product_code", orderdetail);
            RequestDispatcher req = request.getRequestDispatcher("OrderDetailListUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String orderNumber = request.getParameter("orderNumber");
        String productCode = request.getParameter("productCode");
        String quantityOrdered = request.getParameter("quantityOrdered");
        String orderLineNumber = request.getParameter("orderLineNumber");
        Product product = empbean.findProduct(productCode);
        String priceEach = String.valueOf(product.getMsrp());


// this line is to package the whole values into one array string variable -
        String[] s = {orderNumber, productCode , quantityOrdered, priceEach,orderLineNumber};
        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateEmployee method
                empbean.updateOrderdetail(s);
            }
            else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteEmployee method
                empbean.deleteOrderdetail(productCode,Integer.parseInt(orderNumber));
// if ADD button is clicked
            }
            else if (ValidateManageLogic.validateManager(request).equals("CANCEL")) {
// call session bean deleteEmployee method
                ValidateManageLogic.OrderDetailnavigateJS(out,Integer.parseInt(s[0]),true);
// if ADD button is clicked
            }
            else {
// call session bean addEmployee method
                empbean.addOrderdetail(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page
            ValidateManageLogic.OrderDetailnavigateJS(out,Integer.parseInt(s[0]),false);
        } catch (EJBException ex) {
            out.println("error");
        }
    }
}