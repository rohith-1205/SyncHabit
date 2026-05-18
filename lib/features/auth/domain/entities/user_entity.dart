class UserEntity {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final bool isGuest;
  final bool isPro;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.isGuest = false,
    this.isPro = false,
    required this.createdAt,
  });
}
