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
import sample.user.UserError;
import tea.Tea;
import tea.TeaDAO;

@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private final String SUCCESS = "createTea.jsp";
    private final String ERROR = "createTea.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean checkValidation = true;
        String messeges = "";
        UserError userError = new UserError();
        try {
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            float price = Float.valueOf(request.getParameter("price"));
            int quantity = Integer.valueOf(request.getParameter("quantity"));
            String categoyID = request.getParameter("categoyID");

            TeaDAO dao = new TeaDAO();

            if (checkValidation) {
                Tea tea = new Tea(productID, name, price, quantity, categoyID);
                boolean checkInsert = dao.insertNewTea(tea);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Error Happened");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());

            if (e.toString().contains("duplicate")) {
                messeges = messeges + " Trung khoa chinh roi";
            }

            if (e.toString().contains("Caterory")) {
                messeges = messeges + " Caterory khong hop le";
            }
            request.setAttribute("MESSEGES", messeges);
        } finally {
            if (messeges.isEmpty()) {
                messeges = "Them thanh cong";
                request.setAttribute("MESSEGES", messeges);
            }
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
