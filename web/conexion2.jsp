<%-- 
    Document   : conexion2
    Created on : 9 nov. 2025, 17:39:18
    Author     : truks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import= "java.sql.*" %>
<%
       Connection conexion=null;
       PreparedStatement st=null;
       ResultSet rs=null;
    
       Class.forName("com.mysql.jdbc.Driver");
       conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebas","root","");
%>
