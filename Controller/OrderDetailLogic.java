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
import java.util.List;

@WebServlet(name = "OrderDetailLogic", value = "/OrderDetailLogic")
public class OrderDetailLogic extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        out.println(id);

        //Page Navigation
        try {

            List<Orderdetail> lists = empbean.readOrderdetails(id,keyword,direction);
            request.setAttribute("order_detail_single", lists);

            List<Product> products = empbean.getAllProductRecords();
            request.setAttribute("product_list",products);
            out.println(products.get(1).getId());

            out.println(lists);

        }catch (EJBException ex){
            out.println("Prob");
        }
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);
        request.setAttribute("id",request.getParameter("id"));
        out.println("Keyword : " + keyword);
        out.println("Direction : " + direction);
        out.println("ID: " + id);

        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderDetailList.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}



