# Aplicación Flutter: Sistema de Autenticación con Interfaz Profesional

## Descripción General
Este proyecto es una aplicación móvil basada en Flutter que implementa un sistema de autenticación con una interfaz visualmente atractiva y profesional. La aplicación incluye las siguientes características:

- Pantalla de bienvenida (Splash Screen) con animación del logo.
- Pantalla de inicio de sesión con campos de email y contraseña.
- Pantalla de registro para nuevos usuarios.
- Pantalla de recuperación de contraseña.
- Pantalla de confirmación para verificar acciones como el registro o la recuperación de contraseña.

La app sigue principios de diseño modernos e integra un backend desarrollado en Laravel, asegurando un flujo de autenticación seguro y eficiente.

---

## Funcionalidades

### 1. **Pantalla de Bienvenida (Splash Screen)**
- Muestra un logo animado con transiciones suaves.
- Redirige a los usuarios a la pantalla correspondiente según la validación de sesión.

### 2. **Pantalla de Inicio de Sesión**
- Incluye campos de entrada para email y contraseña.
- Valida la entrada del usuario (por ejemplo, formato de email, campos no vacíos).
- Muestra opciones para navegar a las pantallas de registro o recuperación de contraseña.

### 3. **Pantalla de Registro**
- Campos de entrada para la información del usuario (por ejemplo, email, contraseña).
- Enlace "Sign up" con estilo subrayado para mejorar la experiencia del usuario.
- Uso dinámico de temas de texto para títulos y subtítulos.

### 4. **Pantalla de Recuperación de Contraseña**
- Título: "Recuperar Contraseña".
- Subtítulo: "Ingresa tu dirección de correo electrónico abajo y te enviaremos un enlace para restablecer tu contraseña.".
- Diseñada para guiar a los usuarios de manera intuitiva en el proceso de recuperación.

### 5. **Pantalla de Confirmación**
- Se muestra después del registro o la recuperación de contraseña.

---

## Cómo Ejecutar

### Requisitos Previos
- Flutter instalado ([Guía de Instalación](https://docs.flutter.dev/get-started/install)).
- Un editor de código como VS Code o Android Studio.
- Un dispositivo físico o emulador para pruebas.

### Pasos
1. Clonar este repositorio:
   ```bash
   git clone <repository-url>
   ```
2. Navegar al directorio del proyecto:
   ```bash
   cd <project-folder>
   ```
3. Instalar dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

---

## Configuración

### Integración con el Backend
Esta aplicación está diseñada para integrarse con un backend en Laravel para la autenticación de usuarios. Asegúrate de que los endpoints de la API para inicio de sesión, registro y recuperación de contraseña estén configurados correctamente en el proyecto.

### Recursos
Todas las imágenes y los íconos se encuentran en la carpeta `assets/`. Asegúrate de que estén referenciados correctamente en el archivo `pubspec.yaml`.

---

## Mejoras Futuras
- Añadir soporte multilenguaje.
- Implementar autenticación biométrica.
- Mejorar el manejo de errores y los mecanismos de retroalimentación al usuario.

