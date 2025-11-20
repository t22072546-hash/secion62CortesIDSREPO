<%-- 
    Document   : eliminar
    Created on : 9 nov. 2025, 15:54:17
    Author     : truks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    // Incluir la conexión a la base de datos
    // Se asume que conexion.jsp establece la variable 'conexion' (java.sql.Connection)
    // y maneja la carga del driver y las credenciales.
    // Si no tienes 'conexion.jsp', debes agregar aquí la lógica de conexión.
%>
<%@include file="conexion.jsp"%>

<%
    String idUsuario = request.getParameter("id");
    int filasAfectadas = 0;
    String mensaje = "";
    String tipo = "success"; // success o error

    // 1. Validar que el ID no sea nulo ni esté vacío
    if (idUsuario != null && !idUsuario.trim().isEmpty()) {
        PreparedStatement ps = null;
        try {
            // 2. Definir la consulta DELETE segura usando PreparedStatement
            // Esto previene inyección SQL
            String sql = "DELETE FROM prueba WHERE id = ?";
            
            // 3. Preparar y ejecutar la sentencia
            ps = conexion.prepareStatement(sql);
            ps.setString(1, idUsuario);
            
            filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                mensaje = "Usuario con ID " + idUsuario + " eliminado correctamente.";
                tipo = "success";
            } else {
                mensaje = "Error: No se encontró el usuario con ID " + idUsuario + " para eliminar.";
                tipo = "error";
            }

        } catch (SQLException e) {
            mensaje = "Error de base de datos al eliminar el usuario: " + e.getMessage();
            tipo = "error";
        } finally {
            // 4. Cierre de recursos
            if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
            if (conexion != null) try { conexion.close(); } catch (SQLException ignore) {}
        }
    } else {
        mensaje = "Error: El ID de usuario es inválido o falta.";
        tipo = "error";
    }

    // 5. Redirigir a index2.jsp con el mensaje de estado
    response.sendRedirect("index2.jsp?status=" + tipo + "&message=" + java.net.URLEncoder.encode(mensaje, "UTF-8"));
%>