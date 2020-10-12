class User {
  final Uri host;
  final String username;
  final String password;

  const User(this.host, this.username, this.password);

  static const User noUserAvailable = User(null, '', '');
}
