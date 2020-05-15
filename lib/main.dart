import 'package:flutter/material.dart';
import 'package:flutterdatatables/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DataTableDemo(),
    );
  }
}

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Data Table Flutter Demo";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }

  onSortFirstNameColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSortLastNameColum(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      if (ascending) {
        users.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        users.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    }
  }

  onSortSalaryColum(int columnIndex, bool ascending) {
    if (columnIndex == 2) {
      if (ascending) {
        users.sort((a, b) => a.salary.compareTo(b.salary));
      } else {
        users.sort((a, b) => b.salary.compareTo(a.salary));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        dividerThickness: 2,
        // showCheckboxColumn: true,
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
            label: Text(
              "FIRST",
            ),
            numeric: false,
            tooltip: "This is First Name",
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSortFirstNameColum(columnIndex, ascending);
            },
          ),
          DataColumn(
            label: Text(
              "LAST",
              textAlign: TextAlign.center,
            ),
            numeric: false,
            tooltip: "This is Last Name",
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSortLastNameColum(columnIndex, ascending);
            },
          ),
          DataColumn(
            label: Text("SALARY"),
            numeric: false,
            tooltip: "This is Salary",
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSortSalaryColum(columnIndex, ascending);
            },
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                  selected: selectedUsers.contains(user),
                  onSelectChanged: (b) {
                    print("Onselect");
                    onSelectedRow(b, user);
                  },
                  cells: [
                    DataCell(
                      Center(child: Text(user.firstName)),
                    ),
                    DataCell(
                      Center(child: Text(user.lastName)),
                    ),
                    DataCell(
                      Center(child: Text(user.salary.toString())),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 4, left: 4),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              child: dataBody(),
            ),
            Center(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: OutlineButton(
                      child: Text('SELECTED ${selectedUsers.length}'),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: OutlineButton(
                      child: Text('DELETE SELECTED'),
                      onPressed: selectedUsers.isEmpty
                          ? null
                          : () {
                              deleteSelected();
                            },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
