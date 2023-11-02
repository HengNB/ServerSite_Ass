package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.model.entity.Orderdetail;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderHistoryDetailLogic", value = "/OrderHistoryDetailLogic")
public class OrderHistoryDetailLogic extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        String cusID = request.getParameter("cusID");
        out.println(id);

        //Page Navigation
        try {

            List<Orderdetail> lists = empbean.readOrderdetails(id,keyword,direction);
            if (lists.size() != 0) {
                System.out.println("notnull");
                request.setAttribute("order_detail_single", lists);
                // other logic here
            }else{
                // If the list is null, create an empty list instead
                List<Orderdetail> emptyList = new ArrayList<Orderdetail>();
                System.out.println("null");
                request.setAttribute("order_detail_single", emptyList);
            }

            List<Product> products = empbean.getAllProductRecords();
            request.setAttribute("product_list",products);

            out.println(lists);

        }catch (EJBException ex){
            out.println("Prob");
        }
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);
        request.setAttribute("id",request.getParameter("id"));
        request.setAttribute("cusID",cusID);
        System.out.println("Order History Details : " + cusID);

        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderHistoryDetails.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}



