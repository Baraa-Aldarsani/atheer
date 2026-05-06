class TafsirEdition {
  final String id;
  final String name;

  const TafsirEdition({required this.id, required this.name});

  static const muyassar = TafsirEdition(
    id: 'ar.muyassar',
    name: 'التفسير الميسر',
  );

  static const jalalayn = TafsirEdition(
    id: 'ar.jalalayn',
    name: 'تفسير الجلالين',
  );

  static const qurtubi = TafsirEdition(
    id: 'ar.qurtubi',
    name: 'تفسير القرطبي',
  );

  static const baghawi = TafsirEdition(
    id: 'ar.baghawi',
    name: 'تفسير البغوي',
  );

  static const waseet = TafsirEdition(
    id: 'ar.waseet',
    name: 'التفسير الوسيط',
  );

  static const miqbas = TafsirEdition(
    id: 'ar.miqbas',
    name: 'تنوير المقباس',
  );

  static const List<TafsirEdition> all = [muyassar, jalalayn, qurtubi, baghawi, waseet, miqbas];
}
