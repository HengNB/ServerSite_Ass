package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Employee;
import com.utar.assignment.model.entity.Payment;
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

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        Integer id = Integer.parseInt(request.getParameter("id"));
        out.println(id);

        try {
            Customer customer = empbean.findCustomer(id);
            List<Employee> employeeList = empbean.getAllEmployeeRecords();

            request.setAttribute("customer_detail", customer);
            request.setAttribute("employee_records",employeeList);

            //forward the update part to other people
            RequestDispatcher req = request.getRequestDispatcher("CustomerUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error ? y ");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String customerNumber = request.getParameter("customerNumber");
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

        // this line is to package the whole values into one array string variable -

        String[] s = {customerNumber, customerName, contactLastName, contactFirstName,phone,
                addressLine1, addressLine2, city, state,postalCode,
                country, salesRepEmployeeNumber, creditLimit};

        //Validate if the user click update or delete !!
        if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
            // call session bean updateEmployee method
            empbean.updateCustomer(s);
        } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
            // call session bean deleteEmployee method
            empbean.deleteCustomer(customerNumber);
            // if ADD button is clicked
        } else {
            // call session bean addEmployee method
            empbean.addCustomer(s);
        }
        // this line is to redirect to notify record has been updated and redirect to
        // another page
        ValidateManageLogic.PaymentnavigateJS(out,"customer");
    }
}
