import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:banking_flutter_app/domain/entities/language.dart';

abstract class TranslationLocalDataSource {
  Future<void> setCurrentLanguage(Language language);
  Future<Language?> getCurrentLanguage();
  Future<Map<String, String>> getTranslations(String languageCode);
}

class TranslationLocalDataSourceImpl implements TranslationLocalDataSource {
  static const String _currentLanguageKey = 'current_language';

  @override
  Future<void> setCurrentLanguage(Language language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentLanguageKey, jsonEncode({
      'code': language.code,
      'name': language.name,
      'nativeName': language.nativeName,
    }));
  }

  @override
  Future<Language?> getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageJson = prefs.getString(_currentLanguageKey);
    
    if (languageJson == null) return null;
    
    final languageMap = jsonDecode(languageJson) as Map<String, dynamic>;
    return Language(
      code: languageMap['code'],
      name: languageMap['name'],
      nativeName: languageMap['nativeName'],
    );
  }

  @override
  Future<Map<String, String>> getTranslations(String languageCode) async {
    // In a real app, this would load from JSON files or assets
    // For now, we'll return hardcoded translations
    switch (languageCode) {
      case 'en':
        return {
          'settings': 'Settings',
          'select_language': 'Select Language',
          'current_language': 'Current language',
          'english': 'English',
          'spanish': 'Spanish',
          'chinese': 'Chinese',
          'home': 'Home',
          'profile': 'Profile',
          'login': 'Login',
          'logout': 'Logout',
          'email': 'Email',
          'password': 'Password',
          'submit': 'Submit',
          'cancel': 'Cancel',
          'save': 'Save',
          'delete': 'Delete',
          'edit': 'Edit',
          'search': 'Search',
          'loading': 'Loading...',
          'error': 'Error',
          'success': 'Success',
          'welcome': 'Welcome',
          'goodbye': 'Goodbye',
        };
      case 'es':
        return {
          'settings': 'Configuración',
          'select_language': 'Seleccionar Idioma',
          'current_language': 'Idioma actual',
          'english': 'Inglés',
          'spanish': 'Español',
          'chinese': 'Chino',
          'home': 'Inicio',
          'profile': 'Perfil',
          'login': 'Iniciar Sesión',
          'logout': 'Cerrar Sesión',
          'email': 'Correo Electrónico',
          'password': 'Contraseña',
          'submit': 'Enviar',
          'cancel': 'Cancelar',
          'save': 'Guardar',
          'delete': 'Eliminar',
          'edit': 'Editar',
          'search': 'Buscar',
          'loading': 'Cargando...',
          'error': 'Error',
          'success': 'Éxito',
          'welcome': 'Bienvenido',
          'goodbye': 'Adiós',
        };
      case 'zh':
        return {
          'settings': '设置',
          'select_language': '选择语言',
          'current_language': '当前语言',
          'english': '英语',
          'spanish': '西班牙语',
          'chinese': '中文',
          'home': '首页',
          'profile': '个人资料',
          'login': '登录',
          'logout': '登出',
          'email': '电子邮件',
          'password': '密码',
          'submit': '提交',
          'cancel': '取消',
          'save': '保存',
          'delete': '删除',
          'edit': '编辑',
          'search': '搜索',
          'loading': '加载中...',
          'error': '错误',
          'success': '成功',
          'welcome': '欢迎',
          'goodbye': '再见',
        };
      default:
        return {};
    }
  }
} 