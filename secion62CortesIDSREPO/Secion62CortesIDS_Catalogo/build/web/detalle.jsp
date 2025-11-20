<%-- 
    Document   : detalle
    Created on : 13 nov. 2025, 08:30:52
    Author     : truks
--%>

<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle del Producto JSP Cortes Java</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container py-5">  <!-- ess un contenedor web que almacena y modela elementos web -->
        <a href="index.jsp" class="btn btn-secondary mb-4">&larr; Volver al catálogo</a> <!-- hipper vinculo -->

    <%
        String id = request.getParameter("id");
        if (id != null) {
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM tproductos WHERE id=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
    %>

    <div class="card mx-auto shadow-lg animate__animated animate__fadeIn" style="max-width: 700px; border-radius: 20px;">
        <img src="imagenes/<%= rs.getString("imagen") %>" class="card-img-top img-fluid" alt="<%= rs.getString("nombre") %>" style="border-top-left-radius: 20px; border-top-right-radius: 20px;">
        <div class="card-body text-center">
            <h3 class="card-title text-primary fw-bold"><%= rs.getString("nombre") %></h3>
            <p class="card-text fs-5 text-muted"><%= rs.getString("descripcion") %></p>
            <h4 class="text-success fw-bold">$<%= rs.getDouble("precio") %></h4>
        </div>  
    </div>

    <%
            } else {
                out.println("<div class='alert alert-danger text-center'>Producto no encontrado.</div>");
            }
            rs.close();
            ps.close();
        } else {
            out.println("<div class='alert alert-warning text-center'>No se especificó el producto.</div>");
        }
        cn.close();
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</body>
</html>

