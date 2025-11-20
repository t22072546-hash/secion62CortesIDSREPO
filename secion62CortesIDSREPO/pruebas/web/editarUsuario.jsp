<%-- 
    Document   : editarUsuario
    Created on : 9 nov. 2025, 18:28:09
    Author     : truks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Editar Usuario</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary': '#D10024',
                        'dark-bg': '#15161D',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f0f4f8; }
    </style>
</head>
<body>
    <!-- Barrita Superior Minimalista -->
    <header class="bg-dark-bg text-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-3 flex justify-between items-center">
            <a href="index2.jsp" class="text-2xl font-bold tracking-tight">
                <i class="fas fa-book mr-2 text-primary"></i> Biblioteca TUVCH
            </a>
            <div class="flex items-center space-x-4 text-sm">
                <span class="hidden sm:inline"><i class="fas fa-user-circle mr-1"></i> Admin</span>
                <a href="index.jsp" class="hover:text-primary transition duration-150">
                    <i class="fas fa-sign-out-alt mr-1"></i> Cerrar Sesión
                </a>
            </div>
        </div>
    </header>

    <%
        // Obtener los parámetros de la URL enviados desde index2.jsp
        String id = request.getParameter("id");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String rol = request.getParameter("rol");

        // Decodificación básica para mostrar en el formulario
        // Nota: En una aplicación robusta, se usaría un filtro/servlet para obtener datos frescos de la DB
        // en lugar de depender de parámetros de URL. Aquí asumimos que los datos son seguros.
        if (usuario == null) usuario = "";
        if (clave == null) clave = "";
        if (rol == null || rol.equalsIgnoreCase("N/A")) rol = "Usuario"; 
    %>

    <!-- CUERPO PRINCIPAL -->
    <div class="container mx-auto max-w-lg px-4 sm:px-6 lg:px-8 py-12">
        <div class="bg-white p-8 rounded-xl shadow-2xl border border-gray-200">
            
            <h1 class="text-3xl font-bold mb-6 text-gray-800 flex items-center">
                <i class="fas fa-user-edit mr-3 text-primary"></i>
                Editar Usuario #<%= id %>
            </h1>

            <form action="actualizar.jsp" method="post" class="space-y-6">
                
                <!-- ID oculto para saber qué registro actualizar -->
                <input type="hidden" name="id" value="<%= id %>">

                <!-- Campo de Usuario -->
                <div>
                    <label for="usuario" class="block text-sm font-medium text-gray-700 mb-1">Nombre de Usuario</label>
                    <input type="text" id="usuario" name="usuario" value="<%= usuario %>" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary focus:border-primary transition duration-150 shadow-sm"
                           placeholder="Escribe el nuevo nombre de usuario">
                </div>

                <!-- Campo de Clave/Contraseña -->
                <div>
                    <label for="clave" class="block text-sm font-medium text-gray-700 mb-1">Clave/Contraseña</label>
                    <input type="text" id="clave" name="clave" value="<%= clave %>" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary focus:border-primary transition duration-150 shadow-sm"
                           placeholder="Escribe la nueva contraseña">
                </div>

                <!-- Campo de Rol (Selector) -->
                <div>
                    <label for="rol" class="block text-sm font-medium text-gray-700 mb-1">Rol</label>
                    <select id="rol" name="rol"
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-primary focus:border-primary transition duration-150 shadow-sm appearance-none bg-white">
                        <option value="Usuario" <%= "Usuario".equals(rol) ? "selected" : "" %>>Usuario</option>
                        <option value="Administrador" <%= "Administrador".equals(rol) ? "selected" : "" %>>Administrador</option>
                    </select>
                </div>
                
                <!-- Botón de Guardar Cambios -->
                <div class="flex justify-between items-center pt-4">
                    <a href="index2.jsp" class="text-gray-600 hover:text-gray-900 transition duration-150 font-medium">
                        <i class="fas fa-arrow-left mr-2"></i> Cancelar
                    </a>
                    <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-6 rounded-lg shadow-md transition duration-300 flex items-center">
                        <i class="fas fa-save mr-2"></i> Guardar Cambios
                    </button>
                </div>

            </form>
        </div>
    </div>
    <%-- /CUERPO PRINCIPAL --%>

</body>
</html>