<%-- 
    Document   : rGeneral
    Created on : 9 nov. 2025, 16:19:29
    Author     : truks
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Alta de Nuevo Usuario</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Carga de Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Configuración de Estilo: Azul, Gris y Rojo (Para el botón principal) -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary-red': '#DC2626', // Rojo fuerte para el botón
                        'secondary-bg': '#F9FAFB', 
                        'dark-text': '#1F2937',
                        'light-text': '#FFFFFF',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <!-- Carga de Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        /* Estilos personalizados para asegurar la coherencia visual */
        .form-container {
            border: 1px solid #E5E7EB;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }
        .styled-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #D1D5DB;
            border-radius: 0.5rem;
            background-color: #F3F4F6; /* Fondo del campo */
            transition: all 0.2s;
            outline: none;
        }
        .styled-input:focus {
            border-color: #DC2626; 
            background-color: #FFFFFF;
        }
    </style>
</head>
<body class="bg-secondary-bg font-sans text-dark-text min-h-screen flex flex-col">

    <!-- MAIN CONTENT - FORMULARIO ALTA USUARIO -->
    <main class="flex-grow flex items-center justify-center p-6">
        <div class="w-full max-w-lg bg-white p-8 md:p-10 rounded-xl form-container">
            
            <!-- HEADER DEL FORMULARIO -->
            <div class="mb-8 border-b pb-4 border-gray-200">
                <div class="flex items-center text-primary-red mb-2">
                    <!-- Icono principal de registro -->
                    <i data-lucide="user-plus" class="w-8 h-8 mr-3"></i>
                    <h3 class="text-3xl font-extrabold text-dark-text">Alta de Nuevo Usuario</h3>
                </div>
                <p class="text-gray-500 mt-1 ml-11">Crea tu cuenta. Todos los campos son obligatorios.</p>
            </div>

            <!-- El formulario ahora solo incluye Nombre de Usuario y Claves -->
            <form method="post" action="rUsuario.jsp" class="space-y-6" onsubmit="return validatePasswords()">
                
                <!-- FILA 1: Nombre de Usuario -->
                <div>
                    <label for="usuario" class="block text-sm font-medium text-gray-700 mb-1">Nombre de Usuario</label>
                    <input id="usuario" class="styled-input" 
                           type="text" placeholder="Ingresa tu nombre de usuario" required name="usuario"/>
                </div>

                <!-- FILA 2: Clave de Acceso y Confirmar Clave (2 columnas) -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="contrase" class="block text-sm font-medium text-gray-700 mb-1">Clave de Acceso</label>
                        <input id="contrase" class="styled-input" 
                               type="password" placeholder="Mínimo 6 caracteres" required name="contrase"/>
                    </div>
                    <div>
                        <label for="confirm_contrase" class="block text-sm font-medium text-gray-700 mb-1">Confirmar Clave</label>
                        <input id="confirm_contrase" class="styled-input" 
                               type="password" placeholder="Repite la clave" required name="confirm_contrase"/>
                    </div>
                </div>

                <!-- Mensaje de Error (Inicialmente oculto) -->
                <div id="password-error" class="text-center text-sm font-medium text-primary-red hidden p-2 bg-red-100 rounded-lg" role="alert">
                    Las contraseñas no coinciden o son demasiado cortas.
                </div>
                
                <!-- Botón de Registro -->
                <div class="pt-6">
                    <button type="submit" 
                           class="w-full flex items-center justify-center bg-primary-red text-light-text py-3 rounded-xl font-bold text-lg hover:bg-red-700 transition duration-300 shadow-lg shadow-red-500/50 cursor-pointer">
                           <i data-lucide="user-plus" class="w-6 h-6 mr-2"></i>
                           Registrarme
                    </button>
                </div>
            </form>
        </div>
    </main>

    <!-- Script de Lucide Icons y Validación de Cliente -->
    <script>
        // Función para mostrar mensajes de error en lugar de alert()
        function showMessage(message) {
            const errorBox = document.getElementById('password-error');
            errorBox.textContent = message;
            errorBox.classList.remove('hidden');
        }

        // Función de validación del formulario
        function validatePasswords() {
            const password = document.getElementById('contrase').value;
            const confirmPassword = document.getElementById('confirm_contrase').value;
            const errorBox = document.getElementById('password-error');
            
            // Ocultar el mensaje de error anterior
            errorBox.classList.add('hidden');

            if (password.length < 6) {
                showMessage("La contraseña debe tener al menos 6 caracteres.");
                return false;
            }

            if (password !== confirmPassword) {
                showMessage("Las contraseñas ingresadas no coinciden. Por favor, revísalas.");
                return false;
            }

            return true; // El formulario se enviará
        }
        
        // Inicializa los íconos de Lucide
        document.addEventListener('DOMContentLoaded', () => {
            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }
        });
    </script>
</body>
</html>