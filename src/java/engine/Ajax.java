/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package engine;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Ajax", urlPatterns = {"/ajax"})
public class Ajax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String uId = request.getParameter("uId");
            String cId = request.getParameter("cId");
            String positn = request.getParameter("positn");
            String sql = "";
            try(Connection conn = MyConnect.connectNow()){
                switch (positn) {
                    case "president":
                        sql = "UPDATE user SET president = ? WHERE id_no = ?";
                        break;
                    case "secretary":
                        sql = "UPDATE user SET secretary = ? WHERE id_no = ?";
                        break;
                    default:
                        break;
                }
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, cId);
                stmt.setString(2, uId);
                stmt.execute();
            }catch(SQLException e){
                Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, e);
            }
            out.print("OK");
        }
        
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
