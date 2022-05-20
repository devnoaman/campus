import 'package:campus/data/save.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = FutureProvider((ref) async {
  return getFullName();
});
