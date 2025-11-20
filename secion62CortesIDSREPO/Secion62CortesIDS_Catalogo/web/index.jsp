<%-- 
    Document   : index
    Created on : 13 nov. 2025, 08:20:48
    Author     : truks
--%>

<%@ page import="java.sql.*" %>   <!-- lineas de codigo de base de datoss sql relacional -->
<%@ include file="conexion.jsp" %>       <!-- lineas de codigo llamado de base de datoss sql relacional -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Productos JSP Cortes Java</title>
    <!-- API de BOOTSTRAP funciona solo con internet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1 class="text-center mb-4 text-primary fw-bold">Catálogo de Productos</h1>
    <div class="row g-4">

    <%
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM tproductos");
        while (rs.next()) {
    %>
        <div class="col-md-4 col-sm-6">
            <div class="card shadow-sm h-100 producto animate__animated animate__fadeInUp">
                <img src="imagenes/<%= rs.getString("imagen") %>" class="card-img-top img-fluid" alt="<%= rs.getString("nombre") %>">
                <div class="card-body">
                    <h5 class="card-title text-center"><%= rs.getString("nombre") %></h5>
                    <p class="card-text text-muted"><%= rs.getString("descripcion") %></p>
                    <h6 class="text-success text-center fw-bold">$<%= rs.getDouble("precio") %></h6>
                    <div class="text-center mt-2">
                        <a href="detalle.jsp?id=<%= rs.getInt("id")%>" class="btn btn-primary btn-sm">Ver detalles</a>
                    </div>
                      
                </div>
            </div>
        </div>
    <%
        }
        rs.close();
        st.close();
        cn.close();
    %>
    </div>
</div>

<!-- Bootstrap y animaciones -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</body>
</html>

