package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Order;
import com.utar.assignment.model.entity.Payment;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ViewOrderHistoryLogic", value = "/ViewOrderHistoryLogic")

public class ViewOrderHistoryLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cusID = request.getParameter("cusID");
        PrintWriter out = response.getWriter();


        //Page Navigation
        try {
            int rows = empbean.getNumberOfRowsOrderRecordByCID(Integer.parseInt(cusID));
            List<Order> orderHistory = empbean.getOrderRecordByCID(cusID);
            System.out.println("Order History list length :" + orderHistory.size());
            request.setAttribute("rows", rows);
            request.setAttribute("orderHistory", orderHistory);

        }catch (EJBException ex){
            out.println("Prob");
        }

        request.setAttribute("cusID", cusID);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/OrderHistory.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
