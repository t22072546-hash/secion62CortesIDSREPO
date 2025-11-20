<%-- 
    Document   : index2
    Created on : 9 nov. 2025, 07:21:15
    Author     : truks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Panel de Administración - Gestión de Usuarios</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Carga de Tailwind CSS para un diseño limpio y responsivo -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Configuración para usar la fuente Inter y un color principal -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary': '#D10024', // Color principal de tu diseño anterior
                        'dark-bg': '#15161D',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <!-- Font Awesome para íconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Aplicar fuente Inter globalmente y eliminar márgenes */
        body { font-family: 'Inter', sans-serif; margin: 0; background-color: #f7f7f7; }
        /* Estilo para que el botón de eliminar se vea limpio */
        .action-button {
            padding: 0.5rem 0.65rem;
            border-radius: 9999px; /* rounded-full */
            display: inline-flex;
            align-items: center;
            transition: all 150ms ease-in-out;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06); /* shadow-sm */
        }
    </style>
</head>
<body>

    <!-- Barrita Superior Minimalista -->
    <header class="bg-dark-bg text-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-3 flex justify-between items-center">
            <!-- LOGO / TÍTULO -->
            <a href="#" class="text-2xl font-bold tracking-tight">
                <i class="fas fa-book mr-2 text-primary"></i> Biblioteca TUVCH
            </a>
            
            <!-- ENLACES DE USUARIO -->
            <div class="flex items-center space-x-4 text-sm">
                <span class="hidden sm:inline"><i class="fas fa-user-circle mr-1"></i> Admin</span>
                <a href="index.jsp" class="hover:text-primary transition duration-150">
                    <i class="fas fa-sign-out-alt mr-1"></i> Cerrar Sesión
                </a>
            </div>
        </div>
    </header>

    <!-- CUERPO PRINCIPAL -->
    <div class="container mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
        
        <!-- Título y Botón de Acción -->
        <div class="flex justify-between items-center mb-6 border-b pb-4">
            <h1 class="text-3xl font-semibold text-gray-800 flex items-center">
                <i class="fas fa-users mr-3 text-primary"></i> Gestión de Usuarios
            </h1>
            <a href="rGeneral.jsp" class="bg-primary hover:bg-red-700 text-white font-medium py-2 px-4 rounded-lg shadow-md transition duration-300">
                <i class="fas fa-user-plus mr-2"></i> Registrar Nuevo
            </a>
        </div>

        <!-- Panel de Gestión de Usuarios - TABLA -->
        <div class="bg-white shadow-xl rounded-xl overflow-hidden">
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-4 py-3 text-xs font-semibold uppercase tracking-wider text-gray-500">
                                ID
                            </th>
                            <th scope="col" class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">
                                Usuario
                            </th>
                            <th scope="col" class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500">
                                Clave
                            </th>
                            <th scope="col" class="px-4 py-3 text-center text-xs font-semibold uppercase tracking-wider text-gray-500">
                                Rol
                            </th>
                            <th scope="col" class="px-4 py-3 text-center text-xs font-semibold uppercase tracking-wider text-gray-500">
                                Acciones
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        
                        <%-- INICIO: Lógica de la Base de Datos --%>
                        <%@include file="conexion.jsp"%>
                        
                        <%
                            // Declaración de variables (asumiendo que están declaradas en conexion.jsp)
                            Statement st = null;
                            ResultSet rs = null;
                            String rol = "N/A"; // Valor por defecto si la columna no existe o hay error
                            
                            try {
                                // -------------------------------------------------------------------------
                                //  OPCIÓN B: SIN COLUMNA 'ROL' EN LA BD (Para evitar el error "Unknown column")
                                //  Si ya agregaste la columna 'rol' a tu tabla, cambia la consulta por la de la Opción A
                                // -------------------------------------------------------------------------
                                
                                st = conexion.createStatement();
                                // Opción B (Si NO tienes la columna 'rol' en la tabla):
                                rs = st.executeQuery("SELECT id, usuario, clave FROM prueba"); 
                                // Opción A (Si YA tienes la columna 'rol' en la tabla):
                                // rs = st.executeQuery("SELECT id, usuario, clave, rol FROM prueba"); 

                                
                                while(rs.next()){
                                    // Intenta obtener el rol si está disponible en el ResultSet
                                    try {
                                        // Esto solo funcionará si la Opción A se usa arriba.
                                        rol = rs.getString("rol");
                                    } catch (SQLException ex) {
                                        // Si la columna 'rol' no existe en el ResultSet (Opción B),
                                        // usa el valor por defecto "N/A"
                                        rol = "N/A";
                                    }

                        %>
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">
                                <%=rs.getString("id")%>
                            </td>
                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                <%=rs.getString("usuario")%>
                            </td>
                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                <%=rs.getString("clave")%>
                            </td>
                            <td class="px-4 py-3 whitespace-nowrap text-sm text-center">
                                <% 
                                    String rolDisplay = rol;
                                    String rolClass = "bg-gray-100 text-gray-800"; // Default
                                    
                                    // Lógica simple para asignar colores si el rol se lee correctamente
                                    if (rol.equalsIgnoreCase("Administrador")) {
                                        rolClass = "bg-red-100 text-red-800";
                                    } else if (rol.equalsIgnoreCase("Usuario")) {
                                        rolClass = "bg-blue-100 text-blue-800";
                                    } else if (rol.equalsIgnoreCase("N/A")) {
                                        rolDisplay = "Indefinido";
                                        rolClass = "bg-yellow-100 text-yellow-800";
                                    }
                                %>
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%= rolClass %>">
                                    <%=rolDisplay%>
                                </span>
                            </td>

                            <%-- Botones de Acción: Editar y Eliminar --%>
                            <td class="px-4 py-3 whitespace-nowrap text-center text-sm font-medium space-x-2">
                                <!-- Botón de Editar -->
                                <a href="editarUsuario.jsp?id=<%= rs.getString("id") %>&usuario=<%= rs.getString("usuario") %>&clave=<%= rs.getString("clave") %>&rol=<%= rol %>"
                                   title="Editar Usuario"
                                   class="action-button text-blue-600 hover:text-blue-900 bg-blue-100 hover:bg-blue-200">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                
                                <!-- Botón de Eliminar -->
                                <!-- (Importante: Necesitas crear 'eliminar.jsp' y que maneje el parámetro 'id') -->
                                <a href="eliminar.jsp?id=<%=rs.getString("id")%>"
                                   title="Eliminar Usuario"
                                   class="action-button text-red-600 hover:text-red-900 bg-red-100 hover:bg-red-200"
                                   onclick="return confirm('¿Está seguro de que desea eliminar a <%=rs.getString("usuario")%>?');">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                            }//termina while
                        } catch (Exception e) {
                            // Muestra el error de una forma clara
                            out.println("<tr><td colspan='5' class='p-4'><div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative' role='alert'><strong>Error al cargar datos:</strong> " + e.getMessage() + "</div></td></tr>");
                        } finally {
                            // Cierre de recursos
                            if(rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if(st != null) try { st.close(); } catch (SQLException ignore) {}
                            if(conexion != null) try { conexion.close(); } catch (SQLException ignore) {}
                        }
                        %>
                        <%-- FIN: Lógica de la Base de Datos --%>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- /Panel de Gestión de Usuarios - TABLA -->

    </div>
    <%-- /CUERPO PRINCIPAL --%>

</body>
</html>