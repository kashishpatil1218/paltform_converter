class ContactModal {
  int? id, number;
  String? name, bio, email;

  ContactModal({
    required this.name,
    required this.id,
    required this.bio,
    required this.email,
    required this.number,
  });

  factory ContactModal.fromMap(Map m1) {
    return ContactModal(
      name: m1['name'],
      id: m1['id'],
      bio: m1['bio'],
      email: m1['email'],
      number: m1['number'],
    );
  }

  static Map<String, Object?> toMap(ContactModal modal) {
    return {
      'id': modal.id,
      'name': modal.name,
      'bio': modal.bio,
      'email': modal.email,
      'number': modal.number,
    };
  }
}
