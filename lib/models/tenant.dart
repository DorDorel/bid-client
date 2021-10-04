enum Status { activty, stopped, paused, not_completed }

class Tenant {
  // Status status = Status.not_completed;
  final String companyName;
  final String logoImageUrl;
  final String companyMail;
  final String companyPhone;
  final String companyAddress;
  final String companyWebsite;
  final int? usersLimit;

  Tenant(
      {required this.companyName,
      required this.companyMail,
      required this.logoImageUrl,
      required this.companyAddress,
      required this.companyPhone,
      required this.companyWebsite,
      this.usersLimit});

  Map<String, dynamic> toMap() => {
        //    'status': this.status,
        'companyName': this.companyName,
        'companyLogo': this.logoImageUrl,
        'companyMail': this.companyMail,
        'companyPhone': this.companyPhone,
        'companyAddress': this.companyAddress,
        'companyWebsite': this.companyWebsite,
        // 'adminUser': this.adminUser,
      };

  factory Tenant.fromMap(Map<String, dynamic> firestoreObj) {
    Tenant tenantObj = Tenant(
        companyName: firestoreObj['companyName'],
        logoImageUrl: firestoreObj['companyLogo'],
        companyMail: firestoreObj['companyMail'],
        companyPhone: firestoreObj['companyPhone'],
        companyAddress: firestoreObj['companyAddress'],
        companyWebsite: firestoreObj['companyWebsite']);

    return tenantObj;
  }
}
