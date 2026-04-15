/// Conservation status levels following IUCN Red List categories.
enum ConservationStatus {
  leastConcern,
  nearThreatened,
  vulnerable,
  endangered,
  criticallyEndangered,
  extinctInWild,
  extinct,
}

/// Extension to provide display labels for conservation status values.
extension ConservationStatusLabel on ConservationStatus {
  String get label {
    switch (this) {
      case ConservationStatus.leastConcern:
        return 'Preocupacion Menor';
      case ConservationStatus.nearThreatened:
        return 'Casi Amenazada';
      case ConservationStatus.vulnerable:
        return 'Vulnerable';
      case ConservationStatus.endangered:
        return 'En Peligro';
      case ConservationStatus.criticallyEndangered:
        return 'En Peligro Critico';
      case ConservationStatus.extinctInWild:
        return 'Extinta en Estado Silvestre';
      case ConservationStatus.extinct:
        return 'Extinta';
    }
  }

  /// Short IUCN code (LC, NT, VU, EN, CR, EW, EX).
  String get code {
    switch (this) {
      case ConservationStatus.leastConcern:
        return 'LC';
      case ConservationStatus.nearThreatened:
        return 'NT';
      case ConservationStatus.vulnerable:
        return 'VU';
      case ConservationStatus.endangered:
        return 'EN';
      case ConservationStatus.criticallyEndangered:
        return 'CR';
      case ConservationStatus.extinctInWild:
        return 'EW';
      case ConservationStatus.extinct:
        return 'EX';
    }
  }
}

/// Subscription tier levels available for a species or project.
enum SubscriptionTier {
  freemium,
  amigo,
  hermano,
  heroe,
}

extension SubscriptionTierLabel on SubscriptionTier {
  String get label {
    switch (this) {
      case SubscriptionTier.freemium:
        return 'Freemium';
      case SubscriptionTier.amigo:
        return 'Amigo';
      case SubscriptionTier.hermano:
        return 'Hermano';
      case SubscriptionTier.heroe:
        return 'Heroe';
    }
  }
}

/// A species being conserved on the Fauma platform.
class Species {
  final String id;
  final String name;
  final String scientificName;
  final String imageUrl;
  final String description;
  final String institution;
  final ConservationStatus conservationStatus;
  final int subscriberCount;
  final List<SubscriptionTier> availableTiers;

  const Species({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.imageUrl,
    required this.description,
    required this.institution,
    required this.conservationStatus,
    required this.subscriberCount,
    required this.availableTiers,
  });

  Species copyWith({
    String? id,
    String? name,
    String? scientificName,
    String? imageUrl,
    String? description,
    String? institution,
    ConservationStatus? conservationStatus,
    int? subscriberCount,
    List<SubscriptionTier>? availableTiers,
  }) {
    return Species(
      id: id ?? this.id,
      name: name ?? this.name,
      scientificName: scientificName ?? this.scientificName,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      institution: institution ?? this.institution,
      conservationStatus: conservationStatus ?? this.conservationStatus,
      subscriberCount: subscriberCount ?? this.subscriberCount,
      availableTiers: availableTiers ?? this.availableTiers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'scientificName': scientificName,
      'imageUrl': imageUrl,
      'description': description,
      'institution': institution,
      'conservationStatus': conservationStatus.name,
      'subscriberCount': subscriberCount,
      'availableTiers': availableTiers.map((t) => t.name).toList(),
    };
  }

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      id: json['id'] as String,
      name: json['name'] as String,
      scientificName: json['scientificName'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      institution: json['institution'] as String,
      conservationStatus: ConservationStatus.values.byName(
        json['conservationStatus'] as String,
      ),
      subscriberCount: json['subscriberCount'] as int,
      availableTiers: (json['availableTiers'] as List<dynamic>)
          .map((t) => SubscriptionTier.values.byName(t as String))
          .toList(),
    );
  }
}
