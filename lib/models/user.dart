import 'subscription.dart';

/// A Fauma platform user.
class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  /// Gamification rank title displayed on the user's profile.
  final String rank;

  /// Cumulative amount donated across all subscriptions (in EUR).
  final double totalDonated;
  final List<Subscription> subscriptions;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.rank,
    required this.totalDonated,
    required this.subscriptions,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    String? rank,
    double? totalDonated,
    List<Subscription>? subscriptions,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      rank: rank ?? this.rank,
      totalDonated: totalDonated ?? this.totalDonated,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'rank': rank,
      'totalDonated': totalDonated,
      'subscriptions': subscriptions.map((s) => s.toJson()).toList(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
      rank: json['rank'] as String,
      totalDonated: (json['totalDonated'] as num).toDouble(),
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((s) => Subscription.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
}
