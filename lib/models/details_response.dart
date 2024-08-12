/// **Clase DetailsModel**
///
/// Modelo de datos que representa los detalles de una categoría o elemento dentro de la aplicación.
///
/// **Propiedades:**
/// - [count]: Cantidad total de elementos o detalles.
/// - [data]: Lista de detalles individuales, cada uno representado por un objeto [DatumResponse].
/// - [image]: URL de la imagen asociada a los detalles.
/// - [key]: Clave única para identificar el conjunto de detalles.
/// - [modelData]: Datos adicionales del modelo, representados como una cadena de texto.
/// - [title]: Título del conjunto de detalles.
///
/// **Métodos:**
/// - [fromJson]: Crea una instancia de [DetailsModel] a partir de un mapa JSON.
/// - [toJson]: Convierte la instancia de [DetailsModel] a un mapa JSON.
///
class DetailsModel {
  final int count;
  final List<DatumResponse> data;
  final String image;
  final String key;
  final String modelData;
  final String title;

  DetailsModel({
    required this.count,
    required this.data,
    required this.image,
    required this.key,
    required this.modelData,
    required this.title,
  });

  /// **Constructor Factory fromJson**
  ///
  /// Crea una instancia de [DetailsModel] a partir de un mapa JSON.
  ///
  /// **Parámetros:**
  /// - [json]: Mapa que contiene los datos JSON para inicializar una instancia de [DetailsModel].
  ///
  /// **Retorna:**
  /// - Una instancia de [DetailsModel] con los datos proporcionados en el mapa JSON.
  ///
  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        count: json["count"] ?? 0,
        data: json["data"] != null
            ? List<DatumResponse>.from(json["data"].map((x) => DatumResponse.fromJson(x)))
            : [],
        image: json["image"] ?? '',
        key: json["key"] ?? '',
        modelData: json["model_data"] ?? '',
        title: json["title"] ?? '',
      );

  /// **Método toJson**
  ///
  /// Convierte la instancia de [DetailsModel] a un mapa JSON.
  ///
  /// **Retorna:**
  /// - Un mapa JSON que representa la instancia de [DetailsModel].
  ///
  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "image": image,
        "key": key,
        "model_data": modelData,
        "title": title,
      };
}

/// **Clase DatumResponse**
///
/// Modelo de datos que representa un detalle individual dentro de un conjunto de detalles.
///
/// **Propiedades:**
/// - [about]: Información adicional sobre el detalle.
/// - [archetype]: Lista de arquetipos asociados con el detalle.
/// - [avatar]: URL del avatar asociado con el detalle.
/// - [avatar200]: URL del avatar con resolución 200x200.
/// - [avatar400]: URL del avatar con resolución 400x400.
/// - [behance]: URL del perfil de Behance asociado con el detalle.
/// - [benefitsInCompanies]: Beneficios en empresas asociados con el detalle.
/// - [career]: Carrera o experiencia profesional asociada.
/// - [city]: Ciudad del detalle.
/// - [compatibility]: Compatibilidad del detalle con otros elementos.
/// - [compatibilityReason]: Razón de la compatibilidad.
/// - [connected]: Información sobre conexiones.
/// - [country]: País del detalle.
/// - [createdAt]: Fecha de creación del detalle.
/// - [desiredRole]: Rol deseado.
/// - [dreamBrands]: Marcas de sueños asociadas.
/// - [dreamRoles]: Roles de sueños asociados.
/// - [dreamTeam]: Equipo de sueños asociado.
/// - [email]: Correo electrónico asociado.
/// - [facebook]: URL del perfil de Facebook.
/// - [github]: URL del perfil de GitHub.
/// - [hobbies]: Lista de pasatiempos.
/// - [id]: Identificador único del detalle.
/// - [instagram]: URL del perfil de Instagram.
/// - [interestAreas]: Lista de áreas de interés, representadas por objetos [InterestAreaResponse].
/// - [knowledge]: Lista de conocimientos.
/// - [knowledges]: Conocimientos adicionales.
/// - [languages]: Lista de idiomas.
/// - [linkedin]: URL del perfil de LinkedIn.
/// - [matchesCount]: Cantidad de coincidencias.
/// - [myLanguages]: Idiomas del usuario.
/// - [name]: Nombre del detalle.
/// - [opencallObjective]: Objetivo de la convocatoria abierta.
/// - [pinterest]: URL del perfil de Pinterest.
/// - [position]: Posición asociada.
/// - [preferWork]: Preferencias de trabajo.
/// - [profileCompleted]: Porcentaje de perfil completado.
/// - [programsForProductivity]: Programas para productividad.
/// - [resumeDescription]: Descripción del currículum.
/// - [resumeDownload]: Indica si el currículum se puede descargar.
/// - [resumeId]: Identificador del currículum.
/// - [resumeImage]: Imagen del currículum.
/// - [reviewCount]: Cantidad de reseñas.
/// - [reviewGeneralUser]: Reseña general del usuario.
/// - [save]: Indica si el detalle está guardado.
/// - [sharedCount]: Cantidad de veces compartido.
/// - [skills]: Lista de habilidades.
/// - [slug]: Slug o identificador amigable del detalle.
/// - [sponsored]: Indica si el detalle es patrocinado.
/// - [tiktok]: URL del perfil de TikTok.
/// - [tools]: Lista de herramientas asociadas.
/// - [twitter]: URL del perfil de Twitter.
/// - [typeAudience]: Tipo de audiencia.
/// - [video]: URL del video asociado.
/// - [videoUrl]: URL del video adicional.
/// - [wantToBe]: Lo que el detalle quiere ser.
/// - [wantToWork]: Lo que el detalle quiere trabajar.
/// - [workMethodologies]: Metodologías de trabajo.
///
/// **Métodos:**
/// - [fromJson]: Crea una instancia de [DatumResponse] a partir de un mapa JSON.
/// - [toJson]: Convierte la instancia de [DatumResponse] a un mapa JSON.
///
class DatumResponse {
    final String about;
    final List<dynamic> archetype;
    final String avatar;
    final String avatar200;
    final String avatar400;
    final String behance;
    final String benefitsInCompanies;
    final String career;
    final String city;
    final dynamic compatibility;
    final dynamic compatibilityReason;
    final String connected;
    final String country;
    final String createdAt;
    final String desiredRole;
    final List<String> dreamBrands;
    final List<dynamic> dreamRoles;
    final List<dynamic> dreamTeam;
    final String email;
    final String facebook;
    final String github;
    final List<String> hobbies;
    final int id;
    final String instagram;
    final List<InterestAreaResponse> interestAreas;
    final List<String> knowledge;
    final String knowledges;
    final List<String> languages;
    final String linkedin;
    final int matchesCount;
    final String myLanguages;
    final String name;
    final List<dynamic> opencallObjective;
    final String pinterest;
    final String position;
    final String preferWork;
    final int profileCompleted;
    final String programsForProductivity;
    final String resumeDescription;
    final bool resumeDownload;
    final int resumeId;
    final String resumeImage;
    final int reviewCount;
    final int reviewGeneralUser;
    final bool save;
    final int sharedCount;
    final List<String> skills;
    final String slug;
    final bool sponsored;
    final String tiktok;
    final List<String> tools;
    final String twitter;
    final String typeAudience;
    final String video;
    final String videoUrl;
    final String wantToBe;
    final String wantToWork;
    final String workMethodologies;

    DatumResponse({
        required this.about,
        required this.archetype,
        required this.avatar,
        required this.avatar200,
        required this.avatar400,
        required this.behance,
        required this.benefitsInCompanies,
        required this.career,
        required this.city,
        required this.compatibility,
        required this.compatibilityReason,
        required this.connected,
        required this.country,
        required this.createdAt,
        required this.desiredRole,
        required this.dreamBrands,
        required this.dreamRoles,
        required this.dreamTeam,
        required this.email,
        required this.facebook,
        required this.github,
        required this.hobbies,
        required this.id,
        required this.instagram,
        required this.interestAreas,
        required this.knowledge,
        required this.knowledges,
        required this.languages,
        required this.linkedin,
        required this.matchesCount,
        required this.myLanguages,
        required this.name,
        required this.opencallObjective,
        required this.pinterest,
        required this.position,
        required this.preferWork,
        required this.profileCompleted,
        required this.programsForProductivity,
        required this.resumeDescription,
        required this.resumeDownload,
        required this.resumeId,
        required this.resumeImage,
        required this.reviewCount,
        required this.reviewGeneralUser,
        required this.save,
        required this.sharedCount,
        required this.skills,
        required this.slug,
        required this.sponsored,
        required this.tiktok,
        required this.tools,
        required this.twitter,
        required this.typeAudience,
        required this.video,
        required this.videoUrl,
        required this.wantToBe,
        required this.wantToWork,
        required this.workMethodologies,
    });

    /// **Constructor Factory fromJson**
    ///
    /// Crea una instancia de [DatumResponse] a partir de un mapa JSON.
    ///
    /// **Parámetros:**
    /// - [json]: Mapa que contiene los datos JSON para inicializar una instancia de [DatumResponse].
    ///
    /// **Retorna:**
    /// - Una instancia de [DatumResponse] con los datos proporcionados en el mapa JSON.
    ///
    factory DatumResponse.fromJson(Map<String, dynamic> json) => DatumResponse(
        about: json["about"] ?? '',
        archetype: json["archetype"] != null
            ? List<dynamic>.from(json["archetype"].map((x) => x))
            : [],
        avatar: json["avatar"] ?? '',
        avatar200: json["avatar_200"] ?? '',
        avatar400: json["avatar_400"] ?? '',
        behance: json["behance"] ?? '',
        benefitsInCompanies: json["benefits_in_companies"] ?? '',
        career: json["career"] ?? '',
        city: json["city"] ?? '',
        compatibility: json["compatibility"],
        compatibilityReason: json["compatibility_reason"],
        connected: json["connected"] ?? '',
        country: json["country"] ?? '',
        createdAt: json["created_at"] ?? '',
        desiredRole: json["desired_role"] ?? '',
        dreamBrands: json["dream_brands"] != null
            ? List<String>.from(json["dream_brands"].map((x) => x))
            : [],
        dreamRoles: json["dream_roles"] != null
            ? List<dynamic>.from(json["dream_roles"].map((x) => x))
            : [],
        dreamTeam: json["dream_team"] != null
            ? List<dynamic>.from(json["dream_team"].map((x) => x))
            : [],
        email: json["email"] ?? '',
        facebook: json["facebook"] ?? '',
        github: json["github"] ?? '',
        hobbies: json["hobbies"] != null
            ? List<String>.from(json["hobbies"].map((x) => x))
            : [],
        id: json["id"] ?? 0,
        instagram: json["instagram"] ?? '',
        interestAreas: json["interest_areas"] != null
            ? List<InterestAreaResponse>.from(json["interest_areas"].map((x) => InterestAreaResponse.fromJson(x)))
            : [],
        knowledge: json["knowledge"] != null
            ? List<String>.from(json["knowledge"].map((x) => x))
            : [],
        knowledges: json["knowledges"] ?? '',
        languages: json["languages"] != null
            ? List<String>.from(json["languages"].map((x) => x))
            : [],
        linkedin: json["linkedin"] ?? '',
        matchesCount: json["matches_count"] ?? 0,
        myLanguages: json["my_languages"] ?? '',
        name: json["name"] ?? '',
        opencallObjective: json["opencall_objective"] != null
            ? List<dynamic>.from(json["opencall_objective"].map((x) => x))
            : [],
        pinterest: json["pinterest"] ?? '',
        position: json["position"] ?? '',
        preferWork: json["prefer_work"] ?? '',
        profileCompleted: json["profile_completed"] ?? 0,
        programsForProductivity: json["programs_for_productivity"] ?? '',
        resumeDescription: json["resume_description"] ?? '',
        resumeDownload: json["resume_download"] ?? false,
        resumeId: json["resume_id"] ?? 0,
        resumeImage: json["resume_image"] ?? '',
        reviewCount: json["review_count"] ?? 0,
        reviewGeneralUser: json["review_general_user"] ?? 0,
        save: json["save"] ?? false,
        sharedCount: json["shared_count"] ?? 0,
        skills: json["skills"] != null
            ? List<String>.from(json["skills"].map((x) => x))
            : [],
        slug: json["slug"] ?? '',
        sponsored: json["sponsored"] ?? false,
        tiktok: json["tiktok"] ?? '',
        tools: json["tools"] != null
            ? List<String>.from(json["tools"].map((x) => x))
            : [],
        twitter: json["twitter"] ?? '',
        typeAudience: json["type_audience"] ?? '',
        video: json["video"] ?? '',
        videoUrl: json["video_url"] ?? '',
        wantToBe: json["want_to_be"] ?? '',
        wantToWork: json["want_to_work"] ?? '',
        workMethodologies: json["work_methodologies"] ?? '',
      );

    /// **Método toJson**
    ///
    /// Convierte la instancia de [DatumResponse] a un mapa JSON.
    ///
    /// **Retorna:**
    /// - Un mapa JSON que representa la instancia de [DatumResponse].
    ///
    Map<String, dynamic> toJson() => {
        "about": about,
        "archetype": List<dynamic>.from(archetype.map((x) => x)),
        "avatar": avatar,
        "avatar_200": avatar200,
        "avatar_400": avatar400,
        "behance": behance,
        "benefits_in_companies": benefitsInCompanies,
        "career": career,
        "city": city,
        "compatibility": compatibility,
        "compatibility_reason": compatibilityReason,
        "connected": connected,
        "country": country,
        "created_at": createdAt,
        "desired_role": desiredRole,
        "dream_brands": List<dynamic>.from(dreamBrands.map((x) => x)),
        "dream_roles": List<dynamic>.from(dreamRoles.map((x) => x)),
        "dream_team": List<dynamic>.from(dreamTeam.map((x) => x)),
        "email": email,
        "facebook": facebook,
        "github": github,
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
        "id": id,
        "instagram": instagram,
        "interest_areas": List<dynamic>.from(interestAreas.map((x) => x.toJson())),
        "knowledge": List<dynamic>.from(knowledge.map((x) => x)),
        "knowledges": knowledges,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "linkedin": linkedin,
        "matches_count": matchesCount,
        "my_languages": myLanguages,
        "name": name,
        "opencall_objective": List<dynamic>.from(opencallObjective.map((x) => x)),
        "pinterest": pinterest,
        "position": position,
        "prefer_work": preferWork,
        "profile_completed": profileCompleted,
        "programs_for_productivity": programsForProductivity,
        "resume_description": resumeDescription,
        "resume_download": resumeDownload,
        "resume_id": resumeId,
        "resume_image": resumeImage,
        "review_count": reviewCount,
        "review_general_user": reviewGeneralUser,
        "save": save,
        "shared_count": sharedCount,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "slug": slug,
        "sponsored": sponsored,
        "tiktok": tiktok,
        "tools": List<dynamic>.from(tools.map((x) => x)),
        "twitter": twitter,
        "type_audience": typeAudience,
        "video": video,
        "video_url": videoUrl,
        "want_to_be": wantToBe,
        "want_to_work": wantToWork,
        "work_methodologies": workMethodologies,
    };
}

/// **Clase InterestAreaResponse**
///
/// Modelo de datos que representa un área de interés dentro de un detalle.
///
/// **Propiedades:**
/// - [key]: Clave única que identifica el área de interés.
/// - [label]: Etiqueta o nombre del área de interés.
///
/// **Métodos:**
/// - [fromJson]: Crea una instancia de [InterestAreaResponse] a partir de un mapa JSON.
/// - [toJson]: Convierte la instancia de [InterestAreaResponse] a un mapa JSON.
///
class InterestAreaResponse {
    final int key;
    final String label;

    InterestAreaResponse({
        required this.key,
        required this.label,
    });

    /// **Constructor Factory fromJson**
    ///
    /// Crea una instancia de [InterestAreaResponse] a partir de un mapa JSON.
    ///
    /// **Parámetros:**
    /// - [json]: Mapa que contiene los datos JSON para inicializar una instancia de [InterestAreaResponse].
    ///
    /// **Retorna:**
    /// - Una instancia de [InterestAreaResponse] con los datos proporcionados en el mapa JSON.
    ///
    factory InterestAreaResponse.fromJson(Map<String, dynamic> json) => InterestAreaResponse(
        key: json["key"] ?? 0,
        label: json["label"] ?? '',
    );

    /// **Método toJson**
    ///
    /// Convierte la instancia de [InterestAreaResponse] a un mapa JSON.
    ///
    /// **Retorna:**
    /// - Un mapa JSON que representa la instancia de [InterestAreaResponse].
    ///
    Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
    };
}
