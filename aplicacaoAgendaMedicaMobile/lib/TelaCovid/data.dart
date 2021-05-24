class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Como se Proteger ?', category: 'Segurança', imageUrl: 'assets/covid2.png'),
  new IntroItem(title: 'Como ajudar o proximo ?', category: 'Empatia', imageUrl: 'assets/covid2.png'),
  new IntroItem(title: 'Não fazer!', category: 'Saúde', imageUrl: 'assets/image_01.png'),
];