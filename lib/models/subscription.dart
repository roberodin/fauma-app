import 'species.dart';

/// Whether a subscription is for a species or a project.
enum SubscriptionType {
  species,
  project,
}

extension SubscriptionTypeLabel on SubscriptionType {
  String get label {
    switch (this) {
      case SubscriptionType.species:
        return 'Especie';
      case SubscriptionType.project:
        return 'Proyecto';
    }
  }
}

/// A user's subscription to a species or project at a given tier level.
class Subscription {
  final String id;
  final String userId;
  final SubscriptionType type;

  /// The id of the species or project this subscription targets.
  final String targetId;
  final SubscriptionTier level;
  final DateTime startDate;
  final DateTime? endDate;
  final bool active;

  const Subscription({
    required this.id,
    required this.userId,
    required this.type,
    required this.targetId,
    required this.level,
    required this.startDate,
    this.endDate,
    required this.active,
  });

  Subscription copyWith({
    String? id,
    String? userId,
    SubscriptionType? type,
    String? targetId,
    SubscriptionTier? level,
    DateTime? startDate,
    DateTime? endDate,
    bool? active,
  }) {
    return Subscription(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      targetId: targetId ?? this.targetId,
      level: level ?? this.level,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type.name,
      'targetId': targetId,
      'level': level.name,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'active': active,
    };
  }

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: SubscriptionType.values.byName(json['type'] as String),
      targetId: json['targetId'] as String,
      level: SubscriptionTier.values.byName(json['level'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      active: json['active'] as bool,
    );
  }
}
