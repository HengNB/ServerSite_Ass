package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Payment;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserLoginLogic", value = "/UserLoginLogic")
public class UserLoginLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Integer result = empbean.UserLogin(username, password);

        if (result==1){
            // Redirect the user to the admin page
            response.sendRedirect("AdminPage.jsp");
        }
        else if (result ==2){
            int customerNum = empbean.SetCustomerNum(username);
            // Create a new session and set the username as an attribute
            HttpSession session = request.getSession();
            session.setAttribute("CustomerFirstName", username);
            session.setAttribute("CustomerNum", String.valueOf(customerNum));
            request.getRequestDispatcher("HomeLogic").include(request, response);
        }
        else if (result ==3){
            // If the username and password don't match, show an error message
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red'>Invalid username or password. Please try again.</h3>");
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
        else if (result==4){
            // If the username and password don't match, show an error message
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red'>You are not a Customer. Please register now!.</h3>");
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
    }
}

