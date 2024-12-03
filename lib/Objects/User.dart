
class User {
  int id;
  String email;
  String password;
  String firstName;
  String LastName;
  String Address;

  User({required this.id ,required this.firstName, required this.LastName, required this.email, required this.Address, required this.password});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
        firstName: json['firstName'],
        LastName: json['lastName'],
        email: json['email'],
        Address: json['address'],
        password: json['password'],
    );


  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'firstName':firstName,
    'lastName':LastName,
    'email':email,
    'address': Address,
    'password': password,
  };

}
