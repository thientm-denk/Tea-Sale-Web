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
import tea.Cart;
import tea.Tea;

/**
 *
 * @author Denk
 */
@WebServlet(name = "EditController", urlPatterns = {"/EditController"})
public class EditController extends HttpServlet {
 
    
    private final String SUCCESS = "userCart.jsp";
    private final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("productID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            if(session != null){
                Cart cart = (Cart) session.getAttribute("CART");
                if(cart != null){
                    Tea tea = new Tea();
                    if(cart.getCart().containsKey(id)){
                        tea = cart.getCart().get(id);
                        tea.setQuantity(quantity);
                        cart.update(id, tea);
                        session.setAttribute("Cart", cart);
                        url = SUCCESS;
                    }
                }
            }
            
           
        } catch (Exception e) {
            log("Error at LoginController: " +e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request,response);
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
