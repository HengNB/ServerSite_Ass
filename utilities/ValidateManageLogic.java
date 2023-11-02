package com.utar.assignment.utilities;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

public class ValidateManageLogic {
    public static String validateManager(HttpServletRequest request) {
        if(request.getParameter("UPDATE")!=null&&request.getParameter("UPDATE").equals("UPDATE")) {
            return "UPDATE";
        }
        else if (request.getParameter("DELETE") != null && request.getParameter("DELETE").equals("DELETE")) {
            return "DELETE";
        }
        else if (request.getParameter("CANCEL") != null && request.getParameter("CANCEL").equals("CANCEL")) {
            return "CANCEL";
        }
        return "ADD";
    }
    // this method is used to notify a user that a record has been updated and to
// redirect to another page
    public static void navigateJS(PrintWriter out) {
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Record has been updated and url will be redirected\")");
        out.println("window.location.assign(\"PaymentDetailLogic?currentPage=1&recordsPerPage=70\")");
        out.println("</SCRIPT>");
    }

    public static void PaymentnavigateJS(PrintWriter out,String value) {
        String nextServlet = null;
        if (value == "customer"){
            nextServlet = "CustomerDetailLogic";
        }else if(value == "payment"){
            nextServlet= "PaymentDetailLogic";
        }
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Record has been updated and url will be redirected\")");
        out.println("window.location.assign(\""+nextServlet+"?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }

    public static void ProductnavigateJS(PrintWriter out, boolean cancel) {
        out.println("<SCRIPT type=\"text/javascript\">");
        if(cancel==false){
            out.println("alert(\"Record has been updated and url will be redirected\")");
        } else {
            out.println("window.location.assign(\"ProductDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        }
        out.println("window.location.assign(\"ProductDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }

    public static void ProductlinenavigateJS(PrintWriter out, boolean cancel) {
        out.println("<SCRIPT type=\"text/javascript\">");
        if(cancel==false){
            out.println("alert(\"Record has been updated and url will be redirected\")");
        } else {
            out.println("window.location.assign(\"ProductlineDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        }
        out.println("window.location.assign(\"ProductlineDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }

    public static void OrdernavigateJS(PrintWriter out, int id, boolean cancel, boolean viewProduct, int cusID) {
        out.println("<SCRIPT type=\"text/javascript\">");
        if(!cancel){
            out.println("alert(\"Record has been updated and url will be redirected\")");
        }
        if(viewProduct){
            out.println("window.location.assign(\"ProductViewController?cusID=" + cusID + "&currentPage=1&recordsPerPage=20&keyword=&direction=ASC&id=empty&quantity=0\")");
        }
        else{
            out.println("window.location.assign(\"OrderLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        }
        out.println("</SCRIPT>");
    }

    public static void OrderDetailnavigateJS(PrintWriter out, int id, boolean cancel) {
        out.println("<SCRIPT type=\"text/javascript\">");
        if(!cancel){
            out.println("alert(\"Record has been updated and url will be redirected\")");
        }
        out.println("window.location.assign(\"OrderDetailLogic?id=" + id + "&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }
}
