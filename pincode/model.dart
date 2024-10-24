class Post {
  final String circle_name;
  final String region_name;
  final String division_name;
  final String office_name;
  final String pincode;
  final String office_type;
  final String delivery;
  final String district;
  final String state;

  const Post({
    required this.circle_name,
    required this.region_name,
    required this.division_name,
    required this.office_name,
    required this.pincode,
    required this.office_type,
    required this.delivery,
    required this.district,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'circle_name': circle_name,
      'region_name': region_name,
      'division_name': division_name,
      'office_name': office_name,
      'pincode': pincode,
      'office_type': office_type,
      'delivery': delivery,
      'district': district,
      'state': state,
    };
  }
}