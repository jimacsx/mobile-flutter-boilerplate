# Sistema de Autenticación

## Usuarios de Prueba

El sistema incluye tres usuarios mock para pruebas de autenticación:

### 1. Juan Carlos Pérez García

- **Email:** <juan.perez@example.com>
- **Contraseña:** SecurePass123
- **Nombre Completo:** Juan Carlos Pérez García
- **Nombre Corto:** Juan Pérez
- **Teléfono:** +52 55 1234 5678 (Ciudad de México)
- **Número de Cuenta:** **** 1550

### 2. María González López

- **Email:** <maria.gonzalez@example.com>
- **Contraseña:** StrongPwd456
- **Nombre Completo:** María González López
- **Nombre Corto:** María González
- **Teléfono:** +52 81 9876 5432 (Monterrey)
- **Número de Cuenta:** **** 2347

### 3. Roberto Alejandro Rodríguez Martínez

- **Email:** <roberto.rodriguez@example.com>
- **Contraseña:** RobustPass789
- **Nombre Completo:** Roberto Alejandro Rodríguez Martínez
- **Nombre Corto:** Roberto Rodríguez
- **Teléfono:** +52 33 4567 8901 (Guadalajara)
- **Número de Cuenta:** **** 3891

## Flujo de Autenticación

1. **Pantalla de Email:** El usuario ingresa su email
2. **Validación de Email:** El sistema verifica si el email existe
3. **Pantalla de Contraseña:** Si el email es válido, se muestra la información del usuario
4. **Validación de Credenciales:** El usuario ingresa su contraseña
5. **Login Exitoso:** Si las credenciales son correctas, se redirige al home

## Requisitos de Contraseña

Las contraseñas deben cumplir con los siguientes requisitos:

- **Longitud mínima:** 6 caracteres
- **Al menos una letra mayúscula**
- **Al menos una letra minúscula**
- **Al menos un dígito O al menos un carácter especial**
- **No puede contener puntos (.) ni saltos de línea**

**Expresión regular:** `r'(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$'`

## Estructura de Nombres Mexicanos

La entidad User maneja nombres completos siguiendo la estructura tradicional mexicana:

### Campos de Nombre

- **firstName:** Primer nombre (requerido)
- **secondName:** Segundo nombre (opcional)
- **paternalLastName:** Apellido paterno (requerido)
- **maternalLastName:** Apellido materno (requerido)

### Getters Disponibles

- **fullName:** Nombre completo (Juan Carlos Pérez García)
- **shortName:** Nombre corto (Juan Pérez)
- **displayName:** Nombre para mostrar (Juan)
- **initials:** Iniciales (JP)
- **formalName:** Nombre formal (Pérez García Juan Carlos)

### Ejemplos de Uso

- **Nombre simple:** María González López
- **Nombre con segundo nombre:** Juan Carlos Pérez García
- **Nombre formal:** Pérez García Juan Carlos

## Formato de Números de Teléfono

Los números de teléfono siguen el formato estándar de México:

- **Código de país:** +52
- **Código de área:** 2 dígitos (ej: 55, 81, 33)
- **Número local:** 8 dígitos
- **Formato:** +52 XX XXXX XXXX

**Ejemplos de códigos de área:**

- **55:** Ciudad de México
- **81:** Monterrey
- **33:** Guadalajara
- **664:** Tijuana
- **998:** Cancún

## Arquitectura

El sistema sigue los principios de Clean Architecture y Domain-Driven Design:

- **Domain Layer:** Entidades, repositorios y casos de uso
- **Data Layer:** Implementación de repositorios y datasources
- **Presentation Layer:** Providers de estado y pantallas

## Tecnologías Utilizadas

- **Riverpod:** Para gestión de estado
- **Formz:** Para validación de formularios
- **Go Router:** Para navegación
