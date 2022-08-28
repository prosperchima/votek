/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package engine;

import bean.Candidate;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public final class MyConnect {
    public static Connection connectNow() throws SQLException, ClassNotFoundException{
        String URL= "jdbc:mysql://localhost:3306/votek?useSSL=false&serverTimezone=Africa/Lagos";
        String USERNAME = "root";
        String PASSWORD = "password";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    
    
    public static String enrollAdmin(String username) throws SQLException, ClassNotFoundException {
        try(Connection db_conn = connectNow()){
            String sql = "SELECT * FROM admin WHERE username = ?";
            PreparedStatement stmt = db_conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                String u_name = rs.getString("username");
                String password = rs.getString("password");
                
                
                return "yes_"+u_name;
            }else{
                return "no";
            }
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
            return "error";
        }
    }

    public static String connect(String pass_id) throws ClassNotFoundException {
      try(Connection db_conn = MyConnect.connectNow()){
          String sql ="SELECT * FROM user WHERE id_no = ?";
          PreparedStatement stmt =db_conn.prepareStatement(sql);
          stmt.setString(1, pass_id);
          ResultSet res = stmt.executeQuery();
          if(res.next()){
              String name = res.getString("name");
              String phone = res.getString("phone");
              String email = res.getString("email");
              
             return "valid"+"_"+name+"_"+phone+"_"+email;
          }
          else{
              return "invalid";
          }
          
      }catch(SQLException e){
          Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
          return "Error";
      }
        
    }

    public static boolean send(String f_name, String l_name, String date, String phone, String email, String gender, String home_address, String city, String state, String position) throws ClassNotFoundException {
       
        try(Connection db_conn = MyConnect.connectNow()){
            String sql = "INSERT INTO candidate (f_name,l_name,dob,phone,email,gender,home_address,city,state,position) VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement insertStmt = db_conn.prepareStatement(sql);
            
            insertStmt.setString(1, f_name);
            insertStmt.setString(2, l_name);
            insertStmt.setString(3, date);
            insertStmt.setString(4, phone);
            insertStmt.setString(5, email);
            insertStmt.setString(6, gender);
            insertStmt.setString(7, home_address);
            insertStmt.setString(8, city);
            insertStmt.setString(9, state);
            insertStmt.setString(10, position);
            
            boolean execute = insertStmt.execute();
            if(execute){
                return false;
            }else{
                return true;
            }
            
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
        }
       return true;
    }

    public static boolean commitOTP(String OTP, String pass_id) throws ClassNotFoundException {
        boolean res = true;
        try(Connection db_conn = MyConnect.connectNow()){
          String sql ="UPDATE user SET otp = ? WHERE id_no = ?";
          PreparedStatement stmt =db_conn.prepareStatement(sql);
          stmt.setString(1, OTP);
          stmt.setString(2, pass_id);
          res = stmt.execute();
          return res;          
      }catch(SQLException e){
          Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
          return res;
      }
    }

    public static String checkOTP(String OTP, String id_no) throws ClassNotFoundException {
        try(Connection db_conn = MyConnect.connectNow()){
          String sql ="SELECT * FROM user WHERE id_no = ?";
          PreparedStatement stmt =db_conn.prepareStatement(sql);
          stmt.setString(1, id_no);
          ResultSet res = stmt.executeQuery();
          if(res.next()){
                String otp = res.getString("otp");
                if(otp.equals(OTP)){
                    return "valid_"+otp+OTP+id_no;
                }else{
                    return "invalid_"+otp+OTP+id_no;
                }
            }else{
                return "invalid_"+OTP+id_no;
            }
        }catch(SQLException e){
          Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
          return "error_"+OTP+id_no;
        }
    }

//    public static String collect() throws SQLException, ClassNotFoundException {
//   
//        try(Connection db_conn = MyConnect.connectNow()){
//             String sql ="SELECT * FROM candidate";
//             PreparedStatement stmt = db_conn.prepareStatement(sql);
//             ResultSet res = stmt.executeQuery();
//             
//             ObjectMapper mapper = new ObjectMapper();
//             
//             try{
//                String json = mapper.writeValueAsString(res);
//                System.out.print(json);
//             }
//             catch(JsonProcessingException e)
//             {
//                 e.printStackTrace();
//             }
//             
//        }catch(SQLException e){
//
//        }
//        return null;
//    }

    public static String manageUser(String action, String id) throws SQLException, ClassNotFoundException {
        String sql;
        switch (action) {
            case "delete":
                sql = "DELETE FROM candidate WHERE u_id = ?";
                break;
            case "vote":
                sql ="UPDATE user SET president=? WHERE id = ?" ;

                break;
            case "disable":
                sql = "UPDATE users SET status = 'disabled' WHERE u_id = ?";
                break;
            default:
                sql = "UPDATE users SET status = 'enabled' WHERE u_id = ?";
                break;
        }
        try(Connection dbConn = MyConnect.connectNow()){
            PreparedStatement stmt = dbConn.prepareStatement(sql);
            stmt.setString(1, id);
            boolean a = stmt.execute();
            return "OK";
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
            return "error";
        }
    
    }
    
    public static ArrayList<Candidate> fetchCandidates() throws ClassNotFoundException{
        ArrayList<Candidate> candids = new ArrayList();
        try(Connection dbConn = MyConnect.connectNow()){
            String sql = "SELECT * FROM candidate WHERE position = 'President'";
            PreparedStatement stmt = dbConn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Candidate candid = new Candidate();
                candid.setCandidateid(rs.getString("u_id"));
                candid.setFirstname(rs.getString("f_name"));
                candids.add(candid);
            }
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
        }
        return candids;
        
        
    }
    
   
    public static ArrayList<Candidate> fetchCandidatesec() throws ClassNotFoundException{
        ArrayList<Candidate> secretary = new ArrayList();
        try(Connection dbConn = MyConnect.connectNow()){
            String sql = "SELECT * FROM candidate WHERE position = 'Secretary'";
            PreparedStatement stmt = dbConn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Candidate candid = new Candidate();
                candid.setCandidateid(rs.getString("u_id"));
                candid.setFirstname(rs.getString("f_name"));
                secretary.add(candid);
            }
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
        }
     return secretary;   
    }

    
     public static ArrayList<Candidate> getCandidates() throws ClassNotFoundException{
        ArrayList<Candidate> presCan = new ArrayList();
        try(Connection dbConn = MyConnect.connectNow()){
            String sql = "SELECT * FROM candidate WHERE position = 'President'";
            PreparedStatement stmt = dbConn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Candidate can = new Candidate();
                can.setCandidateid(rs.getString("u_id"));
                can.setFirstname(rs.getString("f_name"));
                can.setLastname(rs.getString("l_name"));
                presCan.add(can);
            }
            
        }catch(SQLException e){
            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
            
        }
        return presCan;
        
    }
     

//    public static String countvote() throws ClassNotFoundException {
//        try(Connection dbConn = MyConnect.connectNow()){
//            String
//        }catch(SQLException e){
//            Logger.getLogger(MyConnect.class.getName()).log(Level.SEVERE, null, e);
//        }
//    }
//    
    
}
