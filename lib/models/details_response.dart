
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

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "image": image,
        "key": key,
        "model_data": modelData,
        "title": title,
      };
}
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

class InterestAreaResponse {
    final int key;
    final String label;

    InterestAreaResponse({
        required this.key,
        required this.label,
    });

    factory InterestAreaResponse.fromJson(Map<String, dynamic> json) => InterestAreaResponse(
        key: json["key"]??'',
        label: json["label"]??'',
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
    };
}
