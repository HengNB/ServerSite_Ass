package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.*;
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
import java.util.Map;

@WebServlet(name = "HomeLogic", value = "/HomeLogic")

public class HomeLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String customer_num = (String) session.getAttribute("CustomerNum");
        PrintWriter out = response.getWriter();

        //Page Navigation
        try {
            List<Product> lists = empbean.getAllProductRecords();
            request.setAttribute("staffs", lists);
        } catch (EJBException ex){
            out.println("Prob");
        }

        String customer_firstname = empbean.findCustomer(Integer.parseInt(customer_num)).getContactfirstname();
        request.setAttribute("CustomerFirstName", customer_firstname);
        request.setAttribute("CustomerNum", customer_num);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
