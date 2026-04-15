import '../models/species.dart';
import '../models/project.dart';
import '../models/subscription.dart';
import '../models/user.dart';
import '../models/content.dart';

// ---------------------------------------------------------------------------
// Species
// ---------------------------------------------------------------------------

final mockSpecies = <Species>[
  const Species(
    id: 'sp-001',
    name: 'Tortuga Boba',
    scientificName: 'Caretta caretta',
    imageUrl: 'https://picsum.photos/seed/caretta/800/600',
    description:
        'La tortuga boba es una especie de tortuga marina que habita en los '
        'oceanos Atlantico, Pacifico e Indico. Es la especie de tortuga marina '
        'de caparazon duro mas grande del mundo. Anida en playas arenosas de '
        'regiones templadas y subtropicales, y esta amenazada por la pesca '
        'incidental, la contaminacion y la perdida de habitat de anidacion.',
    institution: 'Fundacion Oceanografic de Valencia',
    conservationStatus: ConservationStatus.vulnerable,
    subscriberCount: 1247,
    availableTiers: [
      SubscriptionTier.freemium,
      SubscriptionTier.amigo,
      SubscriptionTier.hermano,
      SubscriptionTier.heroe,
    ],
  ),
  const Species(
    id: 'sp-002',
    name: 'Pinguino Papua',
    scientificName: 'Pygoscelis papua',
    imageUrl: 'https://picsum.photos/seed/pinguino/800/600',
    description:
        'El pinguino papua o pinguino juanito es reconocible por la franja '
        'blanca que cruza la parte superior de su cabeza. Es el tercer pinguino '
        'mas grande del mundo y el mas rapido bajo el agua, alcanzando '
        'velocidades de hasta 36 km/h. Habita en las islas subantarticas y la '
        'peninsula Antartica.',
    institution: 'Zoo Aquarium de Madrid',
    conservationStatus: ConservationStatus.leastConcern,
    subscriberCount: 893,
    availableTiers: [
      SubscriptionTier.freemium,
      SubscriptionTier.amigo,
      SubscriptionTier.hermano,
      SubscriptionTier.heroe,
    ],
  ),
];

// ---------------------------------------------------------------------------
// Project
// ---------------------------------------------------------------------------

final mockProjects = <Project>[
  Project(
    id: 'proj-001',
    name: 'Proyecto Huevos Pintarroja',
    speciesName: 'Scyliorhinus canicula',
    imageUrl: 'https://picsum.photos/seed/pintarroja/800/600',
    description:
        'Proyecto de investigacion y conservacion centrado en la reproduccion '
        'en cautividad de la pintarroja (Scyliorhinus canicula). Durante 6 '
        'meses monitoreamos el desarrollo embrionario, las condiciones '
        'ambientales y la tasa de eclosion para mejorar los protocolos de cria '
        'y contribuir a la conservacion de elasmobranquios en el Mediterraneo.',
    durationMonths: 6,
    phases: const [
      ProjectPhase(
        id: 'phase-001',
        name: 'Recoleccion y catalogacion',
        description:
            'Recoleccion de huevos de pintarroja, catalogacion individual y '
            'registro de medidas biometricas iniciales.',
        orderIndex: 0,
      ),
      ProjectPhase(
        id: 'phase-002',
        name: 'Incubacion controlada',
        description:
            'Mantenimiento de los huevos en tanques con temperatura, salinidad '
            'y oxigenacion controladas. Monitorizacion semanal del desarrollo '
            'embrionario mediante ovoscopia.',
        orderIndex: 1,
      ),
      ProjectPhase(
        id: 'phase-003',
        name: 'Eclosion y primeros cuidados',
        description:
            'Seguimiento del proceso de eclosion, registro de tasas de exito '
            'y cuidado de las crias durante las primeras semanas de vida.',
        orderIndex: 2,
      ),
      ProjectPhase(
        id: 'phase-004',
        name: 'Analisis y publicacion',
        description:
            'Analisis estadistico de los datos recogidos, elaboracion del '
            'informe final y publicacion de resultados para la comunidad '
            'cientifica y los suscriptores.',
        orderIndex: 3,
      ),
    ],
    teamMembers: const [
      TeamMember(
        id: 'tm-001',
        name: 'Dra. Elena Navarro',
        role: 'Investigadora principal',
        avatarUrl: 'https://picsum.photos/seed/elena/200/200',
      ),
      TeamMember(
        id: 'tm-002',
        name: 'Carlos Ruiz',
        role: 'Biologo marino',
        avatarUrl: 'https://picsum.photos/seed/carlos/200/200',
      ),
      TeamMember(
        id: 'tm-003',
        name: 'Laura Gomez',
        role: 'Veterinaria acuatica',
        avatarUrl: 'https://picsum.photos/seed/laura/200/200',
      ),
    ],
    subscriberCount: 412,
  ),
];

// ---------------------------------------------------------------------------
// Subscriptions
// ---------------------------------------------------------------------------

final mockSubscriptions = <Subscription>[
  Subscription(
    id: 'sub-001',
    userId: 'user-001',
    type: SubscriptionType.species,
    targetId: 'sp-001', // Tortuga Caretta caretta
    level: SubscriptionTier.heroe,
    startDate: DateTime(2025, 11, 1),
    endDate: null,
    active: true,
  ),
  Subscription(
    id: 'sub-002',
    userId: 'user-001',
    type: SubscriptionType.project,
    targetId: 'proj-001', // Proyecto Huevos Pintarroja
    level: SubscriptionTier.hermano,
    startDate: DateTime(2026, 1, 15),
    endDate: DateTime(2026, 7, 15),
    active: true,
  ),
];

// ---------------------------------------------------------------------------
// User
// ---------------------------------------------------------------------------

final mockUser = User(
  id: 'user-001',
  name: 'Maria Garcia',
  email: 'maria.garcia@example.com',
  avatarUrl: 'https://picsum.photos/seed/maria/200/200',
  rank: 'Heroina de la Conservacion',
  totalDonated: 385.00,
  subscriptions: mockSubscriptions,
);

// ---------------------------------------------------------------------------
// Content (drip-fed items across types and levels)
// ---------------------------------------------------------------------------

final mockContent = <Content>[
  // -- Freemium content (visible to everyone) --------------------------------
  Content(
    id: 'cnt-001',
    type: ContentType.photo,
    title: 'Primer plano de una tortuga boba',
    body:
        'Fotografia tomada durante una inmersion nocturna en la costa de '
        'Valencia. La tortuga boba se acercaba a la playa para anidar.',
    mediaUrl: 'https://picsum.photos/seed/cnt001/800/600',
    calendarDate: null,
    dripDay: 1,
    minLevel: SubscriptionTier.freemium,
  ),
  Content(
    id: 'cnt-002',
    type: ContentType.infographic,
    title: 'Ciclo de vida de la Caretta caretta',
    body:
        'Infografia que muestra las etapas del ciclo de vida de la tortuga '
        'boba, desde la puesta de huevos hasta la madurez reproductiva.',
    mediaUrl: 'https://picsum.photos/seed/cnt002/800/1200',
    calendarDate: null,
    dripDay: 3,
    minLevel: SubscriptionTier.freemium,
  ),

  // -- Amigo content ---------------------------------------------------------
  Content(
    id: 'cnt-003',
    type: ContentType.video,
    title: 'Eclosion en directo',
    body:
        'Video en time-lapse de la eclosion de un nido de tortuga boba en la '
        'playa de El Saler. 47 crias alcanzaron el mar con exito.',
    mediaUrl: 'https://picsum.photos/seed/cnt003/800/600',
    calendarDate: null,
    dripDay: 5,
    minLevel: SubscriptionTier.amigo,
  ),
  Content(
    id: 'cnt-004',
    type: ContentType.photo,
    title: 'Pinguinos papa alimentando a sus crias',
    body:
        'Momento captado en la colonia de cria: un adulto regurgita alimento '
        'para su polluelo de apenas dos semanas de vida.',
    mediaUrl: 'https://picsum.photos/seed/cnt004/800/600',
    calendarDate: null,
    dripDay: 7,
    minLevel: SubscriptionTier.amigo,
  ),

  // -- Hermano content -------------------------------------------------------
  Content(
    id: 'cnt-005',
    type: ContentType.video,
    title: 'Detras de camaras: marcaje satelital',
    body:
        'Acompana al equipo durante la colocacion de un transmisor satelital '
        'en el caparazon de una tortuga adulta para rastrear su migracion.',
    mediaUrl: 'https://picsum.photos/seed/cnt005/800/600',
    calendarDate: null,
    dripDay: 10,
    minLevel: SubscriptionTier.hermano,
  ),
  Content(
    id: 'cnt-006',
    type: ContentType.infographic,
    title: 'Rutas migratorias del Mediterraneo',
    body:
        'Mapa interactivo con las rutas de migracion de las tortugas bobas '
        'rastreadas durante la temporada 2025. Datos recopilados por '
        'la Fundacion Oceanografic.',
    mediaUrl: 'https://picsum.photos/seed/cnt006/800/1200',
    calendarDate: null,
    dripDay: 14,
    minLevel: SubscriptionTier.hermano,
  ),
  Content(
    id: 'cnt-007',
    type: ContentType.photo,
    title: 'Ovoscopia de huevos de pintarroja',
    body:
        'Imagen de ovoscopia que muestra el desarrollo embrionario de un '
        'huevo de pintarroja en la semana 8. Se aprecia el saco vitelino '
        'y el embrion en movimiento.',
    mediaUrl: 'https://picsum.photos/seed/cnt007/800/600',
    calendarDate: null,
    dripDay: 18,
    minLevel: SubscriptionTier.hermano,
  ),

  // -- Heroe content ---------------------------------------------------------
  Content(
    id: 'cnt-008',
    type: ContentType.video,
    title: 'Entrevista exclusiva: Dra. Elena Navarro',
    body:
        'La investigadora principal del Proyecto Huevos Pintarroja comparte '
        'los primeros resultados y explica como las aportaciones de los '
        'suscriptores heroe han hecho posible ampliar el estudio.',
    mediaUrl: 'https://picsum.photos/seed/cnt008/800/600',
    calendarDate: DateTime(2026, 5, 23), // Dia Mundial de las Tortugas
    dripDay: 21,
    minLevel: SubscriptionTier.heroe,
  ),
  Content(
    id: 'cnt-009',
    type: ContentType.photo,
    title: 'Certificado de apadrinamiento',
    body:
        'Tu certificado personalizado de apadrinamiento de la tortuga boba '
        'con identificador CC-2026-042. Incluye foto, datos biometricos '
        'y coordenadas del ultimo avistamiento.',
    mediaUrl: 'https://picsum.photos/seed/cnt009/800/600',
    calendarDate: null,
    dripDay: 25,
    minLevel: SubscriptionTier.heroe,
  ),
  Content(
    id: 'cnt-010',
    type: ContentType.infographic,
    title: 'Impacto de tu contribucion 2026',
    body:
        'Resumen visual de como las aportaciones de los heroes han financiado '
        'equipamiento, horas de investigacion y acciones de conservacion '
        'directa durante el primer trimestre de 2026.',
    mediaUrl: 'https://picsum.photos/seed/cnt010/800/1200',
    calendarDate: null,
    dripDay: 30,
    minLevel: SubscriptionTier.heroe,
  ),
];
