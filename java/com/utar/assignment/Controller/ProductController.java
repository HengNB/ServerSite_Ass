package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Product;
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
import java.util.List;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        try {
            Product product = empbean.findProduct(id);
            request.setAttribute("product_detail_single", product);
            List<Productline> productline = empbean.getAllProductlineRecords();
            request.setAttribute("productline_records", productline);
            //forward the update part to other people
            RequestDispatcher req = request.getRequestDispatcher("ProductUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String productCode = request.getParameter("productCode");
        String productName = request.getParameter("productName");
        String productLine = request.getParameter("productLine");
        String productScale = request.getParameter("productScale");
        String productVendor = request.getParameter("productVendor");
        String productDescription = request.getParameter("productDescription");
        String quantityInStock = request.getParameter("quantityInStock");
        String buyPrice = request.getParameter("buyPrice");
        String mrsp = request.getParameter("msrp");

        // this line is to package the whole values into one array string variable -

        String[] s = {productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, mrsp};
        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
                // call session bean updateEmployee method
                empbean.updateProduct(s);
            } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
                // call session bean deleteEmployee method
                empbean.deleteProduct(productCode);
                // if ADD button is clicked
            } else if (ValidateManageLogic.validateManager(request).equals("CANCEL")) {
                ValidateManageLogic.ProductnavigateJS(out, true);
            } else {
                // call session bean addEmployee method
                empbean.addProduct(s);
            }
            // this line is to redirect to notify record has been updated and redirect to another page
            ValidateManageLogic.ProductnavigateJS(out, false);
        } catch (EJBException ex) {
            out.println("error");
        }
    }
}
