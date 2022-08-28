<%@page import="java.util.ArrayList"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@page import="com.fasterxml.jackson.core.JsonProcessingException"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%@page import="java.sql.PreparedStatement"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Connection"%><%@page import="java.sql.Statement"%><%@page import="java.sql.ResultSet"%><%@page contentType="text/html" pageEncoding="UTF-8"%><%
                try
                                    {
                                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                        Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/votek?useSSL=false&serverTimeZone=Africa/Lagos","root","password442"); 
                                        String sql ="SELECT * FROM candidate";
                                        PreparedStatement stmt = dbConn.prepareStatement(sql);
                                        ResultSet res = stmt.executeQuery();
                                        
                                        ArrayList list = new ArrayList();
                                        
                                        while(res.next())
                                        {
                                            list.add(res.getString("l_name"));
                                        }

                                        ObjectMapper mapper = new ObjectMapper();

                                        try
                                        {
                                           String json = mapper.writeValueAsString(list.toArray());
                                           pageContext.setAttribute("json", json);
                                        }
                                        catch(JsonProcessingException e)
                                        {
                                            e.printStackTrace();
                                            String json = e.getMessage();
                                            pageContext.setAttribute("json", json);
                                        }
                                    }
                                    catch(Exception ex)
                                    {
                                        out.println("Exception:"+ex.getMessage());
                                        ex.printStackTrace();
                                        String json = ex.getMessage();
                                        pageContext.setAttribute("json", json);
                                    }
                
               
            %><c:out value="${json}"/>