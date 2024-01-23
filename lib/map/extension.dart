import 'dart:convert';

typedef Json = Map<String, dynamic>;

extension JsonSugar on Json {
  T get<T>(String key) {
    try {
      return this[key]! as T;
    } catch (_) {
      throw Exception('Either they key ($key) does not exist or it does not has the type $T');
    }
  }

  bool has(String key) => this[key] != null;

  void set(String key, dynamic element) => this[key] = element;

  String pretty() {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }

  void removeNullFields() {
    final keys = <String>[];
    for (final entry in entries) {
      if (entry.value == null) {
        keys.add(entry.key);
      }
    }
    for (final key in keys) {
      remove(key);
    }
  }
}
