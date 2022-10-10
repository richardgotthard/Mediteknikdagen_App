class MountModel {
  String path;
  String name;
  String location;
  String description;

  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = '',
  });
}

final List<MountModel> mountItems = [
  MountModel(
      path:
          'https://cdn.vox-cdn.com/thumbor/gik_kIQDNURCShltSJwxHsUGnkU=/0x0:4368x2912/1820x1213/filters:focal(1816x1190:2514x1888):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/71254281/86183858.0.jpg',
      name: 'Life at Facebook',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'Register for attendence'),
  MountModel(
      path: 'https://pbs.twimg.com/media/DCXPb0lW0AA6__s?format=jpg&name=large',
      name: 'Värd-Kick Off with Gaia ',
      description:
          'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian island of Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanese combined words; Meru means mountain and awu or abu means ash.',
      location: 'Click for more information'),
  MountModel(
      path:
          'https://res.cloudinary.com/dkkd45ayz/image/upload/f_auto,q_auto,dpr_auto/w_8688,h_4887,c_fill,g_auto/w_2048,h_1152,c_scale/episerver/39b2b64a-7290-4c7b-9029-22048489ea91/20200826-en-3752389-1.jpg',
      name: 'SAAB ',
      description:
          'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian island of Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanese combined words; Meru means mountain and awu or abu means ash.',
      location: 'Register for attendence'),
  MountModel(
      path:
          'https://images.anandtech.com/doci/15323/IMG_20200106_110510_575px.jpg',
      name: 'Qualcomm: Future of AI',
      description:
          'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes which form the Campanian volcanic arc.',
      location: 'Register for attendence'),
  MountModel(
      path: 'https://i.ytimg.com/vi/gY68gp98F18/maxresdefault.jpg',
      name: 'Search to become a Host!',
      description:
          'Popocatépetl is an active stratovolcano located in the states of Puebla, Morelos, and Mexico in central Mexico. It lies in the eastern half of the Trans-Mexican volcanic belt. At 5,426 m it is the second highest peak in Mexico, after Citlaltépetl at 5,636 m.',
      location: 'Click for more information')
];
