<%-- 
    Document   : bienvenido
    Created on : 9 nov. 2025, 15:50:06
    Author     : truks
--%>

<%@ page language="java" %>
<%
    String usuarioActivo = (String) session.getAttribute("usuarioActivo");
    if (usuarioActivo == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bienvenido Cortes</title>
    <style>
        body { font-family: Arial; background: #0d1117; color: white; text-align: center; margin-top: 100px; }
        a { color: #58a6ff; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2>Bienvenido, <%= usuarioActivo %> ?</h2>
    <p>Has iniciado sesión correctamente.</p>
    <a href="salir.jsp">Cerrar Sesión</a>
</body>
</html>
