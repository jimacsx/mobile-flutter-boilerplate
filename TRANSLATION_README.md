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

### 2. Translated Buttons

Use `TranslatedElevatedButton` or `TranslatedTextButton` for buttons:

```dart
TranslatedElevatedButton(
  'save',
  onPressed: () {
    // Handle save action
  },
)
```

### 3. Programmatic Translation

Access translations programmatically using the provider:

```dart
final translation = ref.watch(translationProvider('welcome'));
```

### 4. Language Selection

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

## Adding New Translations

### 1. Add Translation Keys

Add new keys to the `getTranslations` method in `TranslationLocalDataSourceImpl`:

```dart
case 'en':
  return {
    // ... existing translations
    'new_key': 'New Translation',
  };
case 'es':
  return {
    // ... existing translations
    'new_key': 'Nueva Traducción',
  };
case 'zh':
  return {
    // ... existing translations
    'new_key': '新翻译',
  };
```

### 2. Use in UI

Use the new translation key in your widgets:

```dart
const TranslatedText('new_key')
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

## Testing

The translation system can be tested by:

1. Running the app
2. Navigating to Settings
3. Changing the language
4. Observing UI updates throughout the app

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
