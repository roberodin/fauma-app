import 'species.dart';

/// The media type of a content item.
enum ContentType {
  photo,
  video,
  infographic,
}

extension ContentTypeLabel on ContentType {
  String get label {
    switch (this) {
      case ContentType.photo:
        return 'Foto';
      case ContentType.video:
        return 'Video';
      case ContentType.infographic:
        return 'Infografia';
    }
  }
}

/// A piece of drip-fed content that unlocks based on subscription level and day.
class Content {
  final String id;
  final ContentType type;
  final String title;
  final String body;
  final String mediaUrl;

  /// Calendar date this content is scheduled for (e.g. World Turtle Day).
  final DateTime? calendarDate;

  /// Day number in the drip sequence (1-based).
  final int dripDay;

  /// Minimum subscription tier required to view this content.
  final SubscriptionTier minLevel;

  const Content({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.mediaUrl,
    this.calendarDate,
    required this.dripDay,
    required this.minLevel,
  });

  Content copyWith({
    String? id,
    ContentType? type,
    String? title,
    String? body,
    String? mediaUrl,
    DateTime? calendarDate,
    int? dripDay,
    SubscriptionTier? minLevel,
  }) {
    return Content(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      calendarDate: calendarDate ?? this.calendarDate,
      dripDay: dripDay ?? this.dripDay,
      minLevel: minLevel ?? this.minLevel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'title': title,
      'body': body,
      'mediaUrl': mediaUrl,
      'calendarDate': calendarDate?.toIso8601String(),
      'dripDay': dripDay,
      'minLevel': minLevel.name,
    };
  }

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'] as String,
      type: ContentType.values.byName(json['type'] as String),
      title: json['title'] as String,
      body: json['body'] as String,
      mediaUrl: json['mediaUrl'] as String,
      calendarDate: json['calendarDate'] != null
          ? DateTime.parse(json['calendarDate'] as String)
          : null,
      dripDay: json['dripDay'] as int,
      minLevel: SubscriptionTier.values.byName(json['minLevel'] as String),
    );
  }
}
