/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDTO;
import tea.Cart;
import tea.Tea;
import tea.TeaDAO;

/**
 *
 * @author denk
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String SUCCESS = "checkOut.jsp";
    private final String ERROR = "userCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String url = ERROR;
        String errorCheckout = "";
        boolean valid = true;
        try {
            float total = Float.parseFloat(request.getParameter("total")); 
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (cart != null) {
                    TeaDAO dao = new TeaDAO();
                    for (Tea tea : cart.getCart().values()) {
                        Tea teaError = dao.checkEnough(tea);
                        if (teaError != null && !teaError.getCategoyID().isEmpty()) {
                            request.setAttribute("ERROR", "The quantity of " + teaError.getName() + " not enough, only has " + teaError.getQuantity() + " left");
                            valid = false;
                            break;
                        } else if (teaError != null && teaError.getCategoyID().isEmpty()) {
                            request.setAttribute("ERROR", "The" + tea.getName() + "not enough available ");
                            valid = false;
                            break;
                        }
                    }

                    if (valid) {
                        boolean check = false;
                        int id = dao.insert_Oder(user.getUserID(), total);
                        
                        for (Tea tea : cart.getCart().values()) {
                            check = dao.checkOut(id, tea);
                        }
                        session.setAttribute("CART", null);
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("ERROR", "Your Cart is emtpy");
                }
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
