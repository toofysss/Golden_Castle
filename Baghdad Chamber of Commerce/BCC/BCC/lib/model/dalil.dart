class Company {
  String? nameA;
  String? nameE;
  String? arTitle;
  String? title;
  String? activityA;
  String? activityE;
  String? location;
  String? address;
  String? website;
  String? description;
  String? phone;
  bool isTitle;
  bool isTName;
  bool isTActive;
  bool isTLocation;
  bool isTAddress;
  bool isTPhone;
  bool isTWebSite;
bool isTdescription;
  Company({
    required this.nameA,
    required this.nameE,
    required this.arTitle,
    required this.title,
    required this.activityA,
    required this.activityE,
    required this.location,
    required this.address,
    required this.phone,
    required this.description,
    required this.website,
    required this.isTActive,
    required this.isTAddress,
    required this.isTitle,
    required this.isTLocation,
    required this.isTName,
    required this.isTPhone,
    required this.isTWebSite,
    required this.isTdescription
  });

  factory Company.fromJson(
      Map<String, dynamic> json,
      bool isTitle,
      bool isTName,
      bool isTActive,
      bool isTLocation,
      bool isTAddress,
      bool isTPhone,
      bool isTWebSite,
      bool isTdescription
      ) {
    return Company(
      nameA: json['nameA'],
      nameE: json['nameE'],
      arTitle: json['arTitle'],
      title: json['title'],
      activityA: json['activityA'],
      activityE: json['activityE'],
      location: json['dalilTajer']['location'],
      address: json['dalilTajer']['address'],
      phone: json['dalilTajer']['phone'],
      website: json['dalilTajer']['webSite'],
      description: json['dalilTajer']['description'],
      isTitle: isTitle,
      isTName: isTName,
      isTActive: isTActive,
      isTLocation: isTLocation,
      isTAddress: isTAddress,
      isTPhone: isTPhone,
      isTWebSite: isTWebSite, isTdescription:  isTdescription,
    );
  }
}
