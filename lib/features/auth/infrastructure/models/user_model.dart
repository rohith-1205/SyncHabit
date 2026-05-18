import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.displayName,
    super.photoUrl,
    super.isGuest = false,
    super.isPro = false,
    required super.createdAt,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      isGuest: entity.isGuest,
      isPro: entity.isPro,
      createdAt: entity.createdAt,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserModel(
      id: doc.id,
      email: data['email'] as String? ?? '',
      displayName: data['username'] as String? ?? data['displayName'] as String? ?? '',
      photoUrl: data['photoUrl'] as String?,
      isGuest: data['isGuest'] as bool? ?? false,
      isPro: data['isPro'] as bool? ?? false,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'email': email,
      'username': displayName,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'isGuest': isGuest,
      'isPro': isPro,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    bool? isGuest,
    bool? isPro,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      isGuest: isGuest ?? this.isGuest,
      isPro: isPro ?? this.isPro,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
