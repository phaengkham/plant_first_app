class Plant {
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
  final String decription;
  bool isSelected;

  Plant({
    required this.plantId,
    required this.price,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.category,
    required this.imageURL,
    required this.decription,
    required this.isFavorated,
    required this.plantName,
    required this.isSelected,
  });
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 22,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Indoor',
        plantName: 'Philodendron',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-one.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 1,
        price: 23,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Outdoor',
        plantName: 'Beach Daisy',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-two.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 2,
        price: 25,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-four.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 3,
        price: 26,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Indoor',
        plantName: 'Meadow Sage',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-five.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 4,
        price: 21,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Indoor',
        plantName: 'Plumbago',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-six.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 5,
        price: 27,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Outdoor',
        plantName: 'Tritonia',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-seven.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription'),
    Plant(
        plantId: 6,
        price: 28,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        category: 'Indoor',
        plantName: 'Tritonia',
        isFavorated: false,
        isSelected: false,
        imageURL: 'assets/images/plant-eight.png',
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.decription')
  ];
  static List<Plant> getFavoritedPlant() {
    List<Plant> _tralvelList = Plant.plantList;
    return _tralvelList
        .where((element) => element.isFavorated == true)
        .toList();
  }

  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlant = Plant.plantList;
    return _selectedPlant
        .where((element) => element.isSelected == true)
        .toList();
  }
}
