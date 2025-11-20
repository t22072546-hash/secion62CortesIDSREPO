<%-- 
    Document   : validarLogin2
    Created on : 9 nov. 2025, 08:11:38
    Author     : truks
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%-- 
    Importa la lógica de conexión a la DB.
    La variable 'conexion' debe estar definida en conexion.jsp.
--%>
<%@ include file="conexion.jsp" %> 

<%
    // 1. Recoger parámetros de forma segura
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave"); 
    
    // Variables para recursos de DB
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 2. Comprobar si la conexión a la base de datos es válida
    if (conexion == null) {
        response.sendRedirect("index.jsp?error=db_error");
        return;
    }
    
    // 3. Validar que los campos no estén vacíos antes de la consulta
    if (usuario == null || usuario.trim().isEmpty() || clave == null || clave.trim().isEmpty()) {
        // Redirige al index con un error de campos vacíos
        response.sendRedirect("index.jsp?error=campos_vacios");
        return;
    }

    try {
        // 4. Consulta SQL parametrizada
        // Usando tu tabla 'pruebasistema' y columna 'contraseña'
        String sql = "SELECT * FROM pruebasistema WHERE usuario=? AND contraseña=?";
        
        ps = conexion.prepareStatement(sql);
        ps.setString(1, usuario);
        ps.setString(2, clave);
        
        rs = ps.executeQuery();

        if (rs.next()) {
            // ===================================
            // A. ACCESO EXITOSO (ADMINISTRADOR)
            // ===================================
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("usuarioActivo", usuario);
            session.setAttribute("rolActivo", "Administrador"); 

            // Redirige a la página principal del Administrador
            response.sendRedirect("index2.jsp"); 
            
        } else {
            // ===================================
            // B. ACCESO FALLIDO
            // ===================================
            
            // Redirige al login principal con un mensaje de error
            // Mejor práctica que usar alert()
            response.sendRedirect("index.jsp?error=credenciales_invalidas"); 
        }

    } catch (SQLException e) {
        // Manejo de errores SQL
        System.err.println("Error de Base de Datos al intentar login (Admin): " + e.getMessage());
        response.sendRedirect("index.jsp?error=db_exception");
        
    } catch (Exception e) {
        // Otros errores inesperados
        System.err.println("Error inesperado en validar_login2: " + e.getMessage());
        response.sendRedirect("index.jsp?error=unknown");
        
    } finally {
        // ===================================
        // C. CIERRE SEGURO DE RECURSOS (Mejorado)
        // ===================================
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            // Evitamos cerrar la 'conexion' aquí, ya que a menudo debe ser gestionada
            // por el contenedor web (pool de conexiones) y otras páginas podrían usarla.
            // Si la cerraste en 'conexion.jsp', eso podría causar errores.
        } catch (SQLException ex) {
            System.err.println("Error al cerrar recursos de DB: " + ex.getMessage());
        }
    }
%>
