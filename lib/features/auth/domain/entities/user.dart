class User {
  final String id;
  final String email;
  final String username;
  final String firstName;        // Primer nombre
  final String? secondName;      // Segundo nombre (opcional)
  final String paternalLastName; // Apellido paterno
  final String maternalLastName; // Apellido materno
  final DateTime createdAt;
  final bool isActive;
  final DateTime? lastLoginAt;
  final String phoneNumber;
  final String accountNumber;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.firstName,
    this.secondName,
    required this.paternalLastName,
    required this.maternalLastName,
    required this.createdAt,
    required this.isActive,
    this.lastLoginAt,
    required this.phoneNumber,
    required this.accountNumber,
  });

  /// Nombre completo: Primer Nombre + Segundo Nombre (si existe) + Apellido Paterno + Apellido Materno
  String get fullName {
    final names = [firstName];
    if (secondName != null && secondName!.isNotEmpty) {
      names.add(secondName!);
    }
    names.addAll([paternalLastName, maternalLastName]);
    return names.join(' ');
  }

  /// Nombre corto: Primer Nombre + Apellido Paterno
  String get shortName => '$firstName $paternalLastName';

  /// Nombre para mostrar: Primer Nombre
  String get displayName => firstName;

  /// Iniciales: Primera letra del primer nombre + Primera letra del apellido paterno
  String get initials {
    if (firstName.isNotEmpty && paternalLastName.isNotEmpty) {
      return '${firstName[0]}${paternalLastName[0]}'.toUpperCase();
    } else if (firstName.isNotEmpty) {
      return firstName[0].toUpperCase();
    }
    return '';
  }

  /// Nombre completo formal: Apellido Paterno + Apellido Materno + Nombre(s)
  String get formalName {
    final names = [firstName];
    if (secondName != null && secondName!.isNotEmpty) {
      names.add(secondName!);
    }
    return '$paternalLastName $maternalLastName ${names.join(' ')}';
  }

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? firstName,
    String? secondName,
    String? paternalLastName,
    String? maternalLastName,
    DateTime? createdAt,
    bool? isActive,
    DateTime? lastLoginAt,
    String? phoneNumber,
    String? accountNumber,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      paternalLastName: paternalLastName ?? this.paternalLastName,
      maternalLastName: maternalLastName ?? this.maternalLastName,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $fullName)';
  }
} 