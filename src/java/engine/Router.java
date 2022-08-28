/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package engine;

import bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ProTech
 */
@WebServlet(name = "Router", urlPatterns = {"/Router"})
public class Router extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String url = "/index.jsp";
        String signal = request.getParameter("signal");
        String msg="";
        String color="red";
        
        switch(signal){
            case "login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                try(Connection db_conn = MyConnect.connectNow()){
                    String sql = "SELECT * FROM admin WHERE username = ?";
                    PreparedStatement stmt = db_conn.prepareStatement(sql);
                    stmt.setString(1, username);
                    
                    ResultSet rs = stmt.executeQuery();
                    if(rs.next()){
                        String db_pass = rs.getString("password");
                        if(password.equals(db_pass)){
                            url = "/dashboard.jsp";
                            
                        }else{
                            msg = "Invalid credentials";
                            request.setAttribute("info", msg);
                        }
                    }else{
                        msg = "No such user exist";
                        request.setAttribute("info", msg);
                    }
                }catch(SQLException e){
                    Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
                }
                break;
            case "loginvote":
                String pass_id = request.getParameter("id");
                String collect = MyConnect.connect(pass_id);
                
                String []collect_a = collect.split("_");
                switch(collect_a[0]){
                    case "valid":
                        String name = collect_a[1];
                        String phone = collect_a[2];
                        long l_time = System.currentTimeMillis();
                        String OTP = String.valueOf(l_time).substring(7);
//                      String res = SendSMS.now("234"+phone.substring(1), "Your OTP is "+OTP, "Votek");
                        boolean c_res = MyConnect.commitOTP(OTP, pass_id);
                        String email = collect_a[3];
                        url="/otp.jsp";
                        request.setAttribute("msg", name);
                        request.setAttribute("vid", pass_id);
                          break;
                    case "invalid":
                        msg="This ID is invalid";
                          break;
                    default:
                        break;
                    
                }
            break;
            
            case "submit":
                String f_name = request.getParameter("f_name");
                String l_name = request.getParameter("l_name");
                String date = request.getParameter("date");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String home_address = request.getParameter("home_address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String position = request.getParameter("position");
                
                boolean candidate = MyConnect.send(f_name,l_name,date,phone,email,gender,home_address,city,state,position);
//                String c_candidate = MyConnect.collect();
                url="/addCandidate.jsp";
                msg="Candidate Uploaded Successfully";
                break;
            case "enter-otp":
                String OTP = request.getParameter("otp");
                String id_no = request.getParameter("vid");
                String o_res = MyConnect.checkOTP(OTP, id_no);
                String []o_a = o_res.split("_");
                if(o_a[0].equals("valid")){
                    url = "/vote.jsp";   
                    
                    User user = new User();
                    user.setIdnumber(id_no);
                    request.setAttribute("user", user);
                    
                    User voter = new User();
                    voter.setIdnumber(id_no);
                    request.setAttribute("voter", voter);
                }else{
                    url = "/otp.jsp";
                    msg = "Invalid OTP";
                    request.setAttribute("info", msg);
                }
                break;
            default:
                break;
                
//                String c_vote = MyConnect.countvote();
                
        }
        
        
        request.setAttribute("color", color);
        request.setAttribute("info", msg);
        getServletContext().getRequestDispatcher(url).forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Router.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Router.class.getName()).log(Level.SEVERE, null, ex);
        }
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
