class WebappEntity {
  final String? password;
  WebappEntity({
    this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebappEntity && other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}
