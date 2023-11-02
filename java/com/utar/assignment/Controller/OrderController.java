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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        out.println(id);

        try {

            Order order = empbean.findOrderRecords(id);
            request.setAttribute("order", order);
            List<Customer> customer = empbean.getAllCustomerRecords();
            request.setAttribute("customer_records", customer);


            RequestDispatcher req = request.getRequestDispatcher("OrderListUpdate.jsp");
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
        String orderDate = request.getParameter("orderDate");
        String requireDate = request.getParameter("requireDate");
        String shippedDate = request.getParameter("shippedDate");
        String status = request.getParameter("status");
        String comments = request.getParameter("comments");
        String customerNumber = request.getParameter("customerNumber");

// this line is to package the whole values into one array string variable -
        String[] s = {orderNumber, orderDate , requireDate, shippedDate ,status,comments,customerNumber};
        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateEmployee method
                empbean.updateOrder(s);
            }
            else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteEmployee method
                empbean.deleteOrder(orderNumber);
// if ADD button is clicked
            }
            else if (ValidateManageLogic.validateManager(request).equals("CANCEL")) {
                ValidateManageLogic.OrdernavigateJS(out,Integer.parseInt(s[0]),true, false, 0);
            }
            else {
// call session bean addEmployee method
                empbean.addOrder(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page
            ValidateManageLogic.OrdernavigateJS(out,Integer.parseInt(s[0]),false, false, 0);
        } catch (EJBException ex) {
            out.println("error");
        }
    }
}

