<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Procesando Actualización</title>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { background-color: #f0f4f8; font-family: 'Inter', sans-serif; }
    </style>
</head>
<body>

<%
    // Definición de las variables de conexión (¡AJUSTAR ESTOS VALORES!)
    String DRIVER = "com.mysql.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/pruebas"; // Cambia el nombre de la base de datos
    String USER = "usuario";
    String PASS = "password";

    // 1. Obtener los parámetros enviados por POST desde editar.jsp
    // Obtenemos el ID como String primero, para manejo de errores
    String idStr = request.getParameter("id");
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave");

    int id = -1; // Inicializamos el ID numérico
    Connection conn = null;
    PreparedStatement pstmt = null;
    boolean exito = false;
    String mensaje = "";

    try {
        // Validación: Intentamos convertir el ID de String a entero.
        id = Integer.parseInt(idStr); 

        // 2. Cargar el Driver de la base de datos
        Class.forName(DB_DRIVER);

        // 3. Establecer la conexión
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        // 4. Definir la consulta SQL para actualizar (Sintaxis corregida y agregando 'rol')
        String sql = "UPDATE prueba SET usuario = ?, clave = ?, rol = ? WHERE id = ?";
        
        // 5. Preparar la sentencia
        pstmt = conn.prepareStatement(sql);
        
        // 6. Asignar los valores a los placeholders (?)
        // La consulta tiene 4 placeholders: usuario, clave, rol, id
        pstmt.setString(1, usuario);
        pstmt.setString(2, clave); 
        // CORRECCIÓN CLAVE: Usamos setInt para el ID
        pstmt.setInt(4, id); 

        // 7. Ejecutar la actualización
        int filasAfectadas = pstmt.executeUpdate();

        if (filasAfectadas > 0) {
            exito = true;
            mensaje = "Usuario ID " + id + " actualizado con éxito.";
        } else {
            mensaje = "No se encontró el usuario ID " + id + " o no se realizaron cambios.";
        }

    } catch (NumberFormatException e) {
        mensaje = "ERROR: El ID de usuario no es un número válido (" + idStr + ").";
    } catch (ClassNotFoundException e) {
        mensaje = "ERROR: No se encontró el driver de la base de datos. Asegúrate de tener el JAR del conector en tu proyecto.";
    } catch (SQLException e) {
        mensaje = "ERROR SQL: No se pudo actualizar el registro. Asegúrate que la tabla 'prueba' y las columnas existan. Detalle: " + e.getMessage();
    } catch (Exception e) {
        mensaje = "ERROR General: " + e.getMessage();
    } finally {
        // 8. Cerrar los recursos
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    // 9. Redirección o Mostrar Mensaje
    if (exito) {
        // Redirigir de vuelta a la página principal de listado si fue exitoso
        response.sendRedirect("index2.jsp?mensaje=" + java.net.URLEncoder.encode(mensaje, "UTF-8") + "&tipo=success");
    } else {
        // Mostrar un mensaje de error si la redirección falló o hubo un error fatal
%>
    <div class="container mx-auto max-w-lg px-4 py-12">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative shadow-xl" role="alert">
            <strong class="font-bold">Error de Actualización:</strong>
            <span class="block sm:inline"><%= mensaje %></span>
            <div class="mt-4">
                <a href="index2.jsp" class="text-blue-600 hover:text-blue-800 font-medium underline">Volver al listado</a>
            </div>
        </div>
    </div>
<%
    }
%>

</body>
</html>