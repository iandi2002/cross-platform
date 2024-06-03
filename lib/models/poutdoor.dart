class POutdoor {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String description;
  bool isSelected;

  POutdoor({
    required this.plantId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.imageURL,
    required this.isFavorated,
    required this.description,
    required this.isSelected,
  });

  // List of Outdoor Plants data
  static List<POutdoor> polantList = [
    POutdoor(
      plantId: 0,
      price: 11,
      category: 'Outdoor',
      plantName: 'Philodendron',
      size: 'Medium',
      rating: 4.8,
      humidity: 56,
      temperature: '19 - 22',
      imageURL: 'assets/images/one.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    POutdoor(
      plantId: 2,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/two.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    POutdoor(
      plantId: 3,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/three.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    POutdoor(
      plantId: 4,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/four.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    POutdoor(
      plantId: 5,
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      size: 'Medium',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      imageURL: 'assets/images/five.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    POutdoor(
      plantId: 6,
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      size: 'Medium',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      imageURL: 'assets/images/six.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
  ];
}
