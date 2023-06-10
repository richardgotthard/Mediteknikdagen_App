class CompanyModel {
  String path;
  String name;
  String location;
  String description;
  bool hasExjobb;
  bool hasSommarjobb;
  bool hasJobb;

  CompanyModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = '',
    this.hasExjobb = false,
    this.hasSommarjobb = false,
    this.hasJobb = false,
  });
}

final List<CompanyModel> companyItems = [
  CompanyModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'Gaia',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence',
      hasExjobb: true,
      hasSommarjobb: true,
      hasJobb: false),
  CompanyModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'SAAB',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence',
      hasExjobb: true,
      hasSommarjobb: true,
      hasJobb: true),
  CompanyModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'Viaplay',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence',
      hasExjobb: false,
      hasSommarjobb: false,
      hasJobb: true),
  CompanyModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'SVT',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence',
      hasExjobb: true,
      hasSommarjobb: false,
      hasJobb: false),
  CompanyModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'Ericsson',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence',
      hasExjobb: false,
      hasSommarjobb: false,
      hasJobb: false),
];
