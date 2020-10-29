/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.login;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author cuongnm
 */
public class logIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String remember = request.getParameter("remember");
        AccountDAO accountDao = new AccountDAO();
        Account a = accountDao.logIn(email, pass);

        if (a != null) {
            if (remember != null) {
                Cookie emailCookie = new Cookie("email", email);
                Cookie passCookie = new Cookie("pass", pass);
                emailCookie.setMaxAge(3600*24*7);
                passCookie.setMaxAge(3600*24*7);
                response.addCookie(passCookie);
                response.addCookie(emailCookie);
            }

            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.setMaxInactiveInterval(3600);
            response.sendRedirect("showSurvey");
            return;
        }

        request.setAttribute("err", "Email or password is wrong!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookie = request.getCookies();
        String email = "";
        String pass = "";
        
        for (Cookie c : cookie) {
            if(c.getName().equals("email")){
                email = c.getValue();
            }
            if (c.getName().equals("pass")) {
                pass = c.getValue();
            }
        }
        
        AccountDAO accountDao = new AccountDAO();
        Account a = accountDao.logIn(email, pass);
        
        if (a != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            response.sendRedirect("showSurvey");
            return;
        }
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestGet(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestPost(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
