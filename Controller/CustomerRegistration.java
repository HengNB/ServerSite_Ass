package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;


import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CustomerRegistration", value = "/CustomerRegistration")
public class CustomerRegistration extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String customerNumber = request.getParameter("customerNumber");
        String customerName = request.getParameter("customerName");
        String contactLastName = request.getParameter("contactLastName");
        String contactFirstName = request.getParameter("contactFirstName");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String salesRepEmployeeNumber = request.getParameter("salesRepEmployeeNumber");
        String creditLimit = request.getParameter("creditLimit");

        Integer maxNum = empbean.findMaxCustomerNumber();
        PrintWriter out = response.getWriter();
        //out.println(maxNum);

        String customerNumber = String.valueOf(maxNum + 1);
        String[] s = {customerNumber, customerName, contactLastName, contactFirstName,phone,
                addressLine1, addressLine2, city, state,postalCode,
                country, salesRepEmployeeNumber, creditLimit};

        // Create a new session and set the username as an attribute
        HttpSession session = request.getSession();
        session.setAttribute("CustomerFirstName", contactFirstName);
        session.setAttribute("CustomerNum", customerNumber);


        empbean.addCustomer(s);

        // Redirect the user to the admin page
        response.sendRedirect("HomeLogic");

    }
}
