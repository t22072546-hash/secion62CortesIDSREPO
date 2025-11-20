<%-- 
    Document   : validarLogin
    Created on : 9 nov. 2025, 08:00:31
    Author     : truks
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- 1. Incluimos el archivo de conexión corregido --%>
<%@ include file="conexion.jsp" %> 

<%
    // Declaración y Uso de variables JUNTOS
    PreparedStatement st = null;
    ResultSet rs = null;

    // Solo procede si la conexión no es null (gestionado en conexion.jsp)
    if (conexion != null) {
        try {
            // Recoger parámetros del formulario
            String usuario = request.getParameter("usuario");
            String clave = request.getParameter("clave");

            // Consulta SQL parametrizada para prevenir inyección SQL
            String sql = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND clave = ?"; 
            
            st = conexion.prepareStatement(sql);
            st.setString(1, usuario);
            st.setString(2, clave);

            rs = st.executeQuery();

            if (rs.next()) {
                // Autenticación exitosa
                
                // Redirigir al usuario
                response.sendRedirect("bienvenido.jsp"); 
                
            } else {
                // Autenticación fallida
                out.println("<h3>Usuario o Contraseña Incorrectos.</h3>");
                // O redirigir al login
                // response.sendRedirect("index.jsp?error=credenciales"); 
            }

        } catch (SQLException e) {
            out.println("Error de Base de Datos: " + e.getMessage());
        } finally {
            // CIERRE SEGURO DE RECURSOS (MANDATORIO)
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                // Opcional: Cerrar la conexión si no se necesita más en la página
                // if (conexion != null) conexion.close(); 
            } catch (SQLException ex) {
                out.println("Error al cerrar recursos: " + ex.getMessage());
            }
        }
    } else {
        // Si conexion es null (falló en conexion.jsp), mostramos un mensaje
        out.println("<h3>ERROR FATAL: La aplicación no pudo conectarse a la Base de Datos.</h3>");
    }
%>
