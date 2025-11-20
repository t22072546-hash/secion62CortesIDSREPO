<%-- 
    Document   : conexion
    Created on : 7 nov. 2025, 08:01:12
    Author     : truks
--%>

<%@ page import="java.sql.*" %>
<%
    Connection conexion = null;
    String url = "jdbc:mysql://localhost:3306/pruebas"; // base de datos
    String user = "root";
    String pass = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("Error en la conexión: " + e.getMessage());
    }
%>