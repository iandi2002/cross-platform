class perm {
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

  perm({
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
  static List<perm> pmlantList = [
    perm(
      plantId: 0,
      price: 11,
      category: 'Outdoor',
      plantName: 'Philodendron',
      size: 'Medium',
      rating: 4.8,
      humidity: 56,
      temperature: '19 - 22',
      imageURL: 'assets/images/onep.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    perm(
      plantId: 2,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/twop.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    perm(
      plantId: 3,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/threep.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    perm(
      plantId: 4,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/fourp.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    perm(
      plantId: 5,
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      size: 'Medium',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      imageURL: 'assets/images/fivep.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
    perm(
      plantId: 6,
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      size: 'Medium',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      imageURL: 'assets/images/sixp.jpg',
      isFavorated: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      isSelected: false,
    ),
  ];
}
