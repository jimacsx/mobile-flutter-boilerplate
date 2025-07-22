# Translation System Documentation

This Flutter app implements a comprehensive translation system following Clean Architecture and Domain-Driven Design (DDD) principles using Flutter Riverpod for state management.

## Architecture Overview

The translation system is organized into three main layers:

### 1. Domain Layer (`lib/domain/`)

- **Entities**: `Language` - represents a supported language
- **Repositories**: `TranslationRepository` - abstract interface for translation operations
- **Use Cases**: Translation-related business logic operations

### 2. Data Layer (`lib/data/`)

- **Data Sources**: `TranslationLocalDataSource` - handles local storage operations
- **Repository Implementation**: `TranslationRepositoryImpl` - concrete implementation of the repository

### 3. Presentation Layer (`lib/presentation/`)

- **Providers**: Riverpod providers for state management
- **Widgets**: Reusable translation widgets
- **Screens**: UI components that use the translation system

## Features

- ✅ Multi-language support (English, Spanish, Chinese)
- ✅ Persistent language selection using SharedPreferences
- ✅ Reactive UI updates when language changes
- ✅ Dynamic value interpolation in translations
- ✅ Clean Architecture and DDD principles
- ✅ Dependency injection with Riverpod
- ✅ Reusable translation widgets
- ✅ Type-safe translation keys

## Usage

### 1. Basic Translation

Use the `TranslatedText` widget for simple text translations:

```dart
const TranslatedText('welcome')
```

### 2. Dynamic Value Interpolation

Use the `values` parameter to interpolate dynamic content into translations:

```dart
// Simple dynamic value
TranslatedText(
  'hello_user',
  values: {'name': 'John'}
)

// Multiple dynamic values
TranslatedText(
  'items_count',
  values: {'count': 5, 'type': 'documents'}
)

// With different data types
TranslatedText(
  'user_info',
  values: {
    'name': 'Alice',
    'age': 25,
    'isActive': true
  }
)
```

### 3. Translated Buttons with Dynamic Values

Use `TranslatedElevatedButton` or `TranslatedTextButton` with dynamic values:

```dart
// Basic button
TranslatedElevatedButton(
  'save',
  onPressed: () {
    // Handle save action
  },
)

// Button with dynamic values
TranslatedElevatedButton(
  'save_item',
  values: {'item': 'document', 'count': 3},
  onPressed: () {
    // Handle save action
  },
)
```

### 4. Programmatic Translation (Widget Context)

Access translations programmatically using the provider:

```dart
final translation = ref.watch(translationProvider('welcome'));
```

### 5. Programmatic Translation (Non-Widget Context)

For cases where you need a translated string outside of a widget context (such as for `BottomNavigationBarItem` labels), use the `TranslatedString.of(context, key)` utility:

```dart
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

// Example: BottomNavigationBarItem with localized label
BottomNavigationBarItem(
  icon: const Icon(Icons.home_filled),
  label: TranslatedString.of(context, 'home.bottomNavigation.home'),
)
```

- This method retrieves the current translation for the given key using the nearest Riverpod provider scope.
- Supports value interpolation via the optional `values` parameter:

```dart
TranslatedString.of(context, 'hello_user', values: {'name': 'John'})
```

### 6. Language Selection

The language selection is handled automatically in the settings screen. When a user selects a new language:

1. The selection is saved to local storage
2. The UI automatically updates with new translations
3. All `TranslatedText` widgets react to the change

## Supported Languages

Currently supported languages:

- **English** (`en`) - English
- **Spanish** (`es`) - Español  
- **Chinese** (`zh`) - 中文

## Translation Keys

Common translation keys available:

| Key | English | Spanish | Chinese |
|-----|---------|---------|---------|
| `settings` | Settings | Configuración | 设置 |
| `select_language` | Select Language | Seleccionar Idioma | 选择语言 |
| `current_language` | Current language | Idioma actual | 当前语言 |
| `home` | Home | Inicio | 首页 |
| `profile` | Profile | Perfil | 个人资料 |
| `login` | Login | Iniciar Sesión | 登录 |
| `logout` | Logout | Cerrar Sesión | 登出 |
| `email` | Email | Correo Electrónico | 电子邮件 |
| `password` | Password | Contraseña | 密码 |
| `submit` | Submit | Enviar | 提交 |
| `cancel` | Cancel | Cancelar | 取消 |
| `save` | Save | Guardar | 保存 |
| `delete` | Delete | Eliminar | 删除 |
| `edit` | Edit | Editar | 编辑 |
| `search` | Search | Buscar | 搜索 |
| `loading` | Loading... | Cargando... | 加载中... |
| `error` | Error | Error | 错误 |
| `success` | Success | Éxito | 成功 |
| `welcome` | Welcome | Bienvenido | 欢迎 |
| `goodbye` | Goodbye | Adiós | 再见 |
| `home.bottomNavigation.home` | Home | Inicio | 首页 |
| `home.bottomNavigation.transfer` | Transfer | Transferir | 转账 |
| `home.bottomNavigation.pay` | Pay | Pago | 支付 |
| `home.bottomNavigation.help` | Help | Ayuda | 帮助 |

## Dynamic Value Interpolation

The translation system supports dynamic value interpolation using placeholders in the format `{key}`. This allows you to include dynamic content like names, numbers, or other variables in your translations.

### Interpolation Examples

**Translation strings with placeholders:**

```dart
// English
'hello_user': 'Hello {name}!',
'items_count': 'You have {count} {type}',
'user_info': 'User {name} is {age} years old and is {status}',

// Spanish
'hello_user': '¡Hola {name}!',
'items_count': 'Tienes {count} {type}',
'user_info': 'El usuario {name} tiene {age} años y está {status}',

// Chinese
'hello_user': '你好 {name}！',
'items_count': '你有 {count} 个 {type}',
'user_info': '用户 {name} 今年 {age} 岁，状态为 {status}',
```

**Usage in widgets:**

```dart
// Simple interpolation
TranslatedText(
  'hello_user',
  values: {'name': 'John'}
)

// Multiple values
TranslatedText(
  'items_count',
  values: {'count': 5, 'type': 'documents'}
)

// Complex interpolation
TranslatedText(
  'user_info',
  values: {
    'name': 'Alice',
    'age': 25,
    'status': 'active'
  }
)
```

### Supported Data Types

The interpolation system supports all basic Dart data types:

- **Strings**: `'name': 'John'`
- **Numbers**: `'count': 5`, `'price': 19.99`
- **Booleans**: `'isActive': true`
- **Any object**: Will be converted to string using `toString()`

## Adding New Translations

### 1. Add Translation Keys

Add new keys to the `getTranslations` method in `TranslationLocalDataSourceImpl`:

```dart
case 'en':
  return {
    // ... existing translations
    'new_key': 'New Translation',
    'greeting_with_name': 'Hello {name}!', // With interpolation
  };
case 'es':
  return {
    // ... existing translations
    'new_key': 'Nueva Traducción',
    'greeting_with_name': '¡Hola {name}!', // With interpolation
  };
case 'zh':
  return {
    // ... existing translations
    'new_key': '新翻译',
    'greeting_with_name': '你好 {name}！', // With interpolation
  };
```

### 2. Use in UI

Use the new translation key in your widgets:

```dart
// Basic translation
const TranslatedText('new_key')

// With dynamic values
TranslatedText(
  'greeting_with_name',
  values: {'name': 'John'}
)
```

## Adding New Languages

### 1. Update Language Entity

Add the new language to the `getSupportedLanguages` method in `TranslationRepositoryImpl`:

```dart
return [
  const Language(code: 'en', name: 'English', nativeName: 'English'),
  const Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
  const Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
  const Language(code: 'fr', name: 'French', nativeName: 'Français'), // New language
];
```

### 2. Add Translations

Add translations for the new language in `TranslationLocalDataSourceImpl`:

```dart
case 'fr':
  return {
    'settings': 'Paramètres',
    'select_language': 'Sélectionner la langue',
    // ... add all translations
  };
```

## Best Practices

1. **Use descriptive keys**: Use clear, descriptive translation keys
2. **Consistent naming**: Follow a consistent naming convention for keys
3. **Fallback handling**: The system returns the key if translation is not found
4. **Type safety**: Use the `TranslatedText` widgets for type safety
5. **Performance**: Translations are cached and only reloaded when language changes
6. **Interpolation patterns**: Use consistent placeholder names across languages
7. **Dynamic values**: Keep interpolation simple and avoid complex logic in translation strings
8. **Backward compatibility**: Always provide fallback values for dynamic content

## Testing

The translation system can be tested by:

1. Running the app
2. Navigating to Settings
3. Changing the language
4. Observing UI updates throughout the app
5. Testing dynamic value interpolation with different data types
6. Verifying that interpolation works correctly across all supported languages

## Dependencies

- `flutter_riverpod`: State management
- `shared_preferences`: Local storage for language persistence
- `intl`: Internationalization utilities (already included in Flutter)

## File Structure

```markdown
lib/
├── domain/
│   ├── entities/
│   │   └── language.dart
│   ├── repositories/
│   │   └── translation_repository.dart
│   └── usecases/
│       └── translation_usecases.dart
├── data/
│   ├── datasources/
│   │   └── local/
│   │       └── translation_local_datasource.dart
│   └── repositories/
│       └── translation_repository_impl.dart
└── presentation/
    ├── providers/
    │   └── translation/
    │       └── translation_provider.dart
    ├── shared_widgets/
    │   └── translated_text.dart
    └── screens/
        ├── settings/
        │   └── settings_screen.dart
        └── translation_demo/
            └── translation_demo_screen.dart
```
