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

@WebServlet(name = "OrderLogic", value = "/OrderLogic")

public class OrderLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        PrintWriter out = response.getWriter();


        //Page Navigation
        try {
            //Get Total Records from Payment DB
            int rows = empbean.getNumberOfRowsOrder(keyword);
            nOfPages = rows / recordsPerPage;
            //Determine number of pages needed - Ensure that Data is sufficient of 1 page
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }


            List<Order> lists = empbean.readOrder(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("row", rows);
            request.setAttribute("record", lists);

            List<Customer> customer = empbean.getAllCustomerRecords();
            request.setAttribute("customer_records", customer);


            List<Order> allOrder = empbean.getAllOrderRecords();
            request.setAttribute("allOrderRecord" , allOrder);

            out.println("Total Record per page : " + lists.size());
            out.println("Total Record : " + allOrder.size());

        }catch (EJBException ex){
            out.println("Prob");
        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);

        out.println("nOfPages : " + nOfPages);
        out.println("Current Page : "  + currentPage);
        out.println("Record Per Page : " + recordsPerPage);
        out.println("Keyword : " + keyword);
        out.println("Direction : " + direction);


        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderList.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
