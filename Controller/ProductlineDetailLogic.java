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

@WebServlet(name = "ProductlineDetailLogic", value = "/ProductlineDetailLogic")

public class ProductlineDetailLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        PrintWriter out = response.getWriter();

        //Page Navigation
        try {
            //Get Total Records from Payment DB
            int rows = empbean.getNumberOfRowsProductline(keyword);
            nOfPages = rows / recordsPerPage;

            //Determine number of pages needed - Ensure that Data is sufficient of 1 page
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }

            request.setAttribute("row", rows);

            List<Productline> lists = empbean.readProductline(currentPage,recordsPerPage, keyword);
            request.setAttribute("staffs", lists);

        } catch (EJBException ex){
            out.println("Prob");
        }
        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ProductlineDetail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
