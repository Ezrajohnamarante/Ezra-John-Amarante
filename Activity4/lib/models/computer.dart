class Computer {
  final String id;
  final String name;
  final String processor;
  final String ram;
  final String storage;
  final String gpu;
  final double price;
  final String image;

  Computer({
    required this.id,
    required this.name,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.gpu,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'processor': processor,
      'ram': ram,
      'storage': storage,
      'gpu': gpu,
      'price': price,
      'image': image,
    };
  }

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['id'],
      name: json['name'],
      processor: json['processor'],
      ram: json['ram'],
      storage: json['storage'],
      gpu: json['gpu'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
