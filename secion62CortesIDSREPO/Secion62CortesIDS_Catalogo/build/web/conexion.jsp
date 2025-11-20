<%-- 
    Document   : conexion
    Created on : 13 nov. 2025, 08:13:09
    Author     : truks
--%>

<%@ page import="java.sql.*" %>
<%
    Connection cn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdcatalogocortes", "root", ""); // ajusta usuario/contraseña
    } catch (Exception e) {
        out.println("Error en la conexión: " + e.getMessage());
    }
%>
