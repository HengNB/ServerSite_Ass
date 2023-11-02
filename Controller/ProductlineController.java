package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Productline;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

@WebServlet(name = "ProductlineController", value = "/ProductlineController")
public class ProductlineController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        out.println(id);
        try {
            Productline productline = empbean.findProductline(id);
            request.setAttribute("productline_detail_single", productline);
            //forward the update part to other people
            RequestDispatcher req = request.getRequestDispatcher("ProductlineUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String productLine = request.getParameter("productLine");
        String textDescription = request.getParameter("textDescription");
        String htmlDescription = request.getParameter("htmlDescription");
        String image = request.getParameter("image");

        // this line is to package the whole values into one array string variable -

        String[] s = {productLine,textDescription, htmlDescription, image};
        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
                // call session bean updateEmployee method
                empbean.updateProductline(s);
            } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
                // call session bean deleteEmployee method
                empbean.deleteProductline(productLine);
                // if ADD button is clicked
            } else if (ValidateManageLogic.validateManager(request).equals("CANCEL")) {
                ValidateManageLogic.ProductlinenavigateJS(out, true);
            } else {
                // call session bean addEmployee method
                empbean.addProductline(s);
            }
            // this line is to redirect to notify record has been updated and redirect to another page
            ValidateManageLogic.ProductlinenavigateJS(out, false);
        } catch (EJBException ex) {
            out.println("error");
        }
    }
}