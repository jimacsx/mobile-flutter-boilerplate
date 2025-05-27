import 'package:banking_flutter_app/presentation/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// IMMUTABLE color list
final colorListProvider = Provider((ref) => colorList);

// a single boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//  a single int
final selectedColorProvider = StateProvider<int>((ref) => 0);
