<%-- 
    Document   : index
    Created on : 7 nov. 2025, 13:12:41
    Author     : truks
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso al Sistema - Portal Corporativo Oscuro</title>
    
    <style>
        /**
         * 🎨 Variables CSS - Dark Mode y Elegancia Corporativa
         */
        :root {
            --color-primary: #5a75ff; /* Azul Índigo Brillante (Foco, Botones) */
            --color-primary-dark: #3f55c5; /* Tono más oscuro para el botón normal */
            --color-text-light: #e5e7eb; /* Gris claro para el texto principal */
            --color-text-muted: #9ca3af; /* Gris medio para placeholders */
            --color-bg-card: rgba(17, 24, 39, 0.85); /* Fondo oscuro semi-transparente (85% opacidad) */
            --color-border-input: #374151; /* Borde oscuro sutil */
            --color-shadow-base: rgba(0, 0, 0, 0.5); /* Sombra oscura intensa */
            --color-glow: rgba(90, 117, 255, 0.6); 

            --spacing-large: 2.5rem;
            --spacing-medium: 1.25rem;
            --border-radius-default: 1rem;
            --font-family-base: 'Inter', 'Segoe UI', Arial, sans-serif;
        }
        
        /* --- Keyframes para la Animación de Brillo Ambiental --- */
        @keyframes subtleGlow {
            0% { box-shadow: 0 8px 30px var(--color-shadow-base), 0 0 10px rgba(90, 117, 255, 0.2); }
            50% { box-shadow: 0 8px 30px var(--color-shadow-base), 0 0 15px rgba(90, 117, 255, 0.4); }
            100% { box-shadow: 0 8px 30px var(--color-shadow-base), 0 0 10px rgba(90, 117, 255, 0.2); }
        }

        /* --- Base Styling: Cuerpo con Imagen de Fondo Visible (Se asume la ruta 'img/fondo-login.jpg') --- */
        body {
            font-family: var(--font-family-base);
            color: var(--color-text-light); 
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            
            /* Usamos la imagen de fondo con su color original */
            background-image: url('img/fondo-login.jpg'); 
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-color: #0d1117; 
        }

        /* --- Component: Auth Form - Oscuro y Transparente --- */
        .auth-form { 
            background-color: var(--color-bg-card); 
            backdrop-filter: blur(8px); 
            padding: var(--spacing-large);
            border-radius: var(--border-radius-default);
            width: 90%;
            max-width: 400px;
            border: 1px solid var(--color-border-input); 
            
            /* Animación de brillo ambiental */
            animation: subtleGlow 4s ease-in-out infinite;
            
            transition: transform 0.3s ease-out, box-shadow 0.3s ease-out; 
        }
        
        .auth-form:hover {
            transform: translateY(-5px); 
            box-shadow: 
                0 15px 40px var(--color-shadow-base), 
                0 0 8px var(--color-primary), 
                0 0 30px var(--color-glow);
            animation-play-state: paused;
        }

        .auth-form h2 {
            margin-top: 0; 
            margin-bottom: var(--spacing-large);
            text-align: center;
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--color-primary); 
        }

        /* --- Contenedor para los Radio Buttons de Rol --- */
        .role-selector {
            display: flex;
            justify-content: space-around;
            margin: 1.5rem 0 1rem 0; /* Espacio superior e inferior */
            padding: 0.5rem;
            border-radius: 0.5rem;
            background-color: rgba(31, 41, 55, 0.5);
            border: 1px solid var(--color-border-input);
        }

        .role-selector label {
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: 0.3rem;
            transition: background-color 0.2s, color 0.2s;
            display: flex;
            align-items: center;
            font-weight: 500;
        }

        .role-selector input[type="radio"] {
            display: none; /* Ocultar el radio button nativo */
        }

        /* Estilo cuando el radio button está seleccionado */
        .role-selector input[type="radio"]:checked + label {
            background-color: var(--color-primary);
            color: var(--color-bg-card); /* Texto oscuro para contraste */
            box-shadow: 0 2px 8px rgba(90, 117, 255, 0.4);
        }

        /* Ícono para el selector de rol (Font Awesome) */
        .role-selector i {
            margin-right: 8px;
        }


        /* --- Component: Form Inputs (Se mantiene) --- */
        .auth-form input:not([type="submit"]):not([type="radio"]) { 
            display: block;
            width: 100%; 
            margin: var(--spacing-medium) 0; 
            padding: 0.8rem;
            border: 1px solid var(--color-border-input); 
            background-color: rgba(31, 41, 55, 0.7); 
            color: var(--color-text-light);
            border-radius: 0.5rem;
            box-sizing: border-box; 
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .auth-form input:focus {
            border-color: var(--color-primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(90, 117, 255, 0.3); 
            background-color: rgba(31, 41, 55, 1); 
        }
        
        /* --- Component: Submit Button (Se mantiene) --- */
        .auth-form .btn-submit { 
            background-color: var(--color-primary-dark);
            color: var(--color-bg-card);
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.2s ease, transform 0.1s ease-out, box-shadow 0.2s ease; 
            display: block;
            width: 100%;
            margin: var(--spacing-large) 0 0.5rem 0;
            padding: 0.9rem;
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .auth-form .btn-submit:hover {
            background-color: var(--color-primary); 
            box-shadow: 0 6px 15px rgba(90, 117, 255, 0.4);
        }

        .auth-form .btn-submit:active {
            transform: scale(0.99); 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.4) inset;
        }

        /* --- Mensaje de Error (Estilo JSP) --- */
        .error-message {
            background-color: #ff5a5a; 
            color: #111827;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 1rem;
            font-weight: 600;
        }
    </style>
    <!-- Incluir Font Awesome (asumo que tienes acceso a él, si no, usa solo el texto) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form class="auth-form" id="loginForm" action="validarLogin.jsp" method="post">
        <h2>Acceso al Portal</h2>

        <!-- SELECTOR DE ROL (Nuevo) -->
        <div class="role-selector">
            <input type="radio" id="roleEmpleado" name="role" value="empleado" checked>
            <label for="roleEmpleado">
                <i class="fa fa-user"></i> Empleado
            </label>

            <input type="radio" id="roleAdmin" name="role" value="admin">
            <label for="roleAdmin">
                <i class="fa fa-lock"></i> Administrador
            </label>
        </div>
        
        <input type="text" name="usuario" placeholder="Usuario o ID" required>
        <input type="password" name="clave" placeholder="Contraseña de Acceso" required>
        
        <input type="submit" value="Iniciar Sesión de Forma Segura" class="btn-submit">
        
        <div class="auth-footer">
            <a href="#">¿Problemas de Acceso? Contacte a IT</a>
        </div>
    </form>

    <script>
        /**
         * Lógica para cambiar la acción del formulario basado en el rol seleccionado.
         */
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const roleInputs = document.querySelectorAll('input[name="role"]');

            // Función para actualizar la acción del formulario
            function updateFormAction() {
                const selectedRole = document.querySelector('input[name="role"]:checked').value;
                
                if (selectedRole === 'admin') {
                    // Si es Administrador, enviar a validarLogin2.jsp
                    form.action = 'validarLogin2.jsp';
                    form.querySelector('.btn-submit').value = 'Acceder como Administrador';
                    form.querySelector('h2').textContent = 'Acceso de Administradores';
                } else {
                    // Si es Empleado, enviar a validarLogin.jsp
                    form.action = 'validarLogin.jsp';
                    form.querySelector('.btn-submit').value = 'Iniciar Sesión de Forma Segura';
                    form.querySelector('h2').textContent = 'Acceso de Empleados';
                }
            }

            // Escuchar cambios en los radio buttons
            roleInputs.forEach(input => {
                input.addEventListener('change', updateFormAction);
            });

            // Inicializar la acción al cargar la página (por defecto es Empleado)
            updateFormAction(); 
        });
    </script>
</body>
</html>
