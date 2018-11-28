/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Jpa.Account;
import Model.Jpa.Controller.AccountJpaController;
import Model.Jpa.Controller.HistoryJpaController;
import Model.Jpa.Controller.ProductJpaController;
import Model.Jpa.Controller.exceptions.RollbackFailureException;
import Model.Jpa.History;
import Model.Jpa.Product;
import Model.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author User
 */
public class PayMoneyServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "ProjectWebProPU")
    EntityManagerFactory emf;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String creditCard = request.getParameter("creditCard");
        Account ac = (Account) session.getAttribute("ac");
        ProductJpaController pCtrl = new ProductJpaController(utx, emf);
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Product p = (Product) session.getAttribute("p");
        if (session != null) {
            if (ac != null && cart != null) {
                if (creditCard != null) {
                    try {
                            HistoryJpaController hisCtrl = new HistoryJpaController(utx, emf);
                            int hisCount = hisCtrl.getHistoryCount();
                            History his = new History(hisCount, ac, new Date(), p);
                            hisCtrl.create(his);
                            request.setAttribute("ac", ac);
                            getServletContext().getRequestDispatcher("/Homepage.jsp").forward(request, response);
                            session.removeAttribute("cart");
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(PayMoneyServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(PayMoneyServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
