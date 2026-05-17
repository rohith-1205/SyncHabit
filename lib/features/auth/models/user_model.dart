class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final bool isGuest;
  final bool isPro;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.isGuest = false,
    this.isPro = false,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    bool? isGuest,
    bool? isPro,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      isGuest: isGuest ?? this.isGuest,
      isPro: isPro ?? this.isPro,
    );
  }
}
