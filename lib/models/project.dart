/// A single phase within a conservation project.
class ProjectPhase {
  final String id;
  final String name;
  final String description;
  final int orderIndex;

  const ProjectPhase({
    required this.id,
    required this.name,
    required this.description,
    required this.orderIndex,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'orderIndex': orderIndex,
    };
  }

  factory ProjectPhase.fromJson(Map<String, dynamic> json) {
    return ProjectPhase(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      orderIndex: json['orderIndex'] as int,
    );
  }
}

/// A team member working on a conservation project.
class TeamMember {
  final String id;
  final String name;
  final String role;
  final String avatarUrl;

  const TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.avatarUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'avatarUrl': avatarUrl,
    };
  }

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }
}

/// A conservation project on the Fauma platform.
class Project {
  final String id;
  final String name;
  final String speciesName;
  final String imageUrl;
  final String description;

  /// Duration of the project in months.
  final int durationMonths;
  final List<ProjectPhase> phases;
  final List<TeamMember> teamMembers;
  final int subscriberCount;

  const Project({
    required this.id,
    required this.name,
    required this.speciesName,
    required this.imageUrl,
    required this.description,
    required this.durationMonths,
    required this.phases,
    required this.teamMembers,
    required this.subscriberCount,
  });

  Project copyWith({
    String? id,
    String? name,
    String? speciesName,
    String? imageUrl,
    String? description,
    int? durationMonths,
    List<ProjectPhase>? phases,
    List<TeamMember>? teamMembers,
    int? subscriberCount,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      speciesName: speciesName ?? this.speciesName,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      durationMonths: durationMonths ?? this.durationMonths,
      phases: phases ?? this.phases,
      teamMembers: teamMembers ?? this.teamMembers,
      subscriberCount: subscriberCount ?? this.subscriberCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'speciesName': speciesName,
      'imageUrl': imageUrl,
      'description': description,
      'durationMonths': durationMonths,
      'phases': phases.map((p) => p.toJson()).toList(),
      'teamMembers': teamMembers.map((m) => m.toJson()).toList(),
      'subscriberCount': subscriberCount,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      name: json['name'] as String,
      speciesName: json['speciesName'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      durationMonths: json['durationMonths'] as int,
      phases: (json['phases'] as List<dynamic>)
          .map((p) => ProjectPhase.fromJson(p as Map<String, dynamic>))
          .toList(),
      teamMembers: (json['teamMembers'] as List<dynamic>)
          .map((m) => TeamMember.fromJson(m as Map<String, dynamic>))
          .toList(),
      subscriberCount: json['subscriberCount'] as int,
    );
  }
}
