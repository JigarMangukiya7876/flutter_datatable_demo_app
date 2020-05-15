class User {
  String firstName;
  String lastName;
  // double age;
  double salary;
  User({
    this.firstName,
    this.lastName,
    // this.age,
    this.salary,
  });
  static List<User> getUsers() {
    return <User>[
      User(firstName: "Jigar", lastName: "Mangukiya", salary: 1000),
      User(firstName: "Pankil", lastName: "Bavishi", salary: 2000),
      User(firstName: "Ankur", lastName: "Kalkani", salary: 3000),
      User(firstName: "Prashant", lastName: "Savaliya", salary: 4000),
      User(firstName: "Mehul", lastName: "Nakum", salary: 5000),
      User(firstName: "DIvyesh", lastName: "MIyani", salary: 5000),
      User(firstName: "Ketan", lastName: "Sutariya", salary: 2000),
      User(firstName: "Jigar", lastName: "Mangukiya", salary: 1000),
      User(firstName: "Pankil", lastName: "Bavishi", salary: 2000),
      User(firstName: "Ankur", lastName: "Kalkani", salary: 3000),
      User(firstName: "Prashant", lastName: "Savaliya", salary: 4000),
      User(firstName: "Mehul", lastName: "Nakum", salary: 5000),
      User(firstName: "DIvyesh", lastName: "MIyani", salary: 5000),
      User(firstName: "Ketan", lastName: "Sutariya", salary: 2000),
    ];
  }
}
