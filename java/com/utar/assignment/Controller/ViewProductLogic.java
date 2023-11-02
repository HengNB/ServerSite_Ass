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

@WebServlet(name = "ViewProductLogic", value = "/ViewProductLogic")

public class ViewProductLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String customer_num = request.getParameter("cusID");
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        PrintWriter out = response.getWriter();

        //Page Navigation
        try {
            //Get Total Records from Payment DB
            int rows = empbean.getNumberOfRowsProduct(keyword);
            nOfPages = rows / recordsPerPage;

            //Determine number of pages needed - Ensure that Data is sufficient of 1 page
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }

            request.setAttribute("row", rows);

            List<Product> lists = empbean.readProduct(currentPage,recordsPerPage, keyword, direction);
            request.setAttribute("staffs", lists);

        } catch (EJBException ex){
            out.println("Prob");
        }
        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);
        request.setAttribute("cusID", customer_num);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ProductView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

