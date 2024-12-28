enum AuthProvider {
  github('Github'),
  google('Google');

  const AuthProvider(this.value);

  final String value;
}
