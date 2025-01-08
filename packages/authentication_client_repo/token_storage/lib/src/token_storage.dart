abstract class TokenStorage {
  /// Returns the current token.
  Future<String?> readToken();

  /// Saves the current token.
  Future<void> saveToken(String token);

  /// Clears the current token.
  Future<void> clearToken();
}

class InMemoryTokenStorage implements TokenStorage {
  String? _token;

  @override
  Future<String?> readToken() async => _token;

  @override
  Future<void> saveToken(String token) async => _token = token;

  @override
  Future<void> clearToken() async => _token = null;
}
