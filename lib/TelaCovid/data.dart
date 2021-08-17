class IntroItem {
  IntroItem({
    this.title,
    
    this.imageUrl,
  });

  final String title;
  
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Como se Proteger ?', imageUrl: 'assets/covid2.png'),
  new IntroItem(title: 'Como ajudar o proximo ?', imageUrl: 'assets/covid2.png'),
  new IntroItem(title: 'Se cuide !', imageUrl: 'assets/covid.png'),
];