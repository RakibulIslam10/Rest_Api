import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restapi/AddScreen.dart';
import 'package:restapi/Edit_Screen.dart';
import 'package:restapi/ModelClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Productkey> ProductList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crud App"),
      ),
      body: ProductList.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ProductList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(ProductList[index].productName ?? "Unknown"),
                subtitle: Wrap(
                  children: [
                    Text(ProductList[index].totalPrice ?? ""),
                    SizedBox(width: 8),
                    Text(ProductList[index].productCode ?? "Unknown"),
                    SizedBox(width: 8),
                    SizedBox(width: 8),
                    Text(ProductList[index].qty ?? "Unknown"),
                    SizedBox(width: 8),
                    Text(ProductList[index].unitPrice ?? "Unknown"),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage:
                  NetworkImage(ProductList[index].img ?? ""),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "Edit") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProduct(),
                        ),
                      );
                    } else {
                      MyDialogBOx();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "Edit",
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: "Delete",
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 5),
                          Text("Delete"),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
        onRefresh: () => GetJsonFormApi(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProduct(),
            ),
          );
        },
        label: const Text("Add"),
      ),
    );
  }

  @override
  void initState() {
    GetJsonFormApi();
    super.initState();
    setState(() {});
  }

  void MyDialogBOx() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you Sure?"),
        content: const Text("Do you want to delete"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> GetJsonFormApi() async {
    ProductList.clear();
//Convert Url to Uri
    Uri MyUri = Uri.parse(
        "https://crud.teamrabbil.com/api/v1/ReadProduct");

    //Call Api
    Response response = await get(MyUri);
    print(response);
    print(response.body);
    print(response.statusCode);

    //Show Response
    if (response.statusCode == 200) {
      var DecodeResponse = jsonDecode(response.body);
      if (DecodeResponse["status"] == "success") {
        var list = DecodeResponse["data"];
        for (var apiItems in list) {
          setState(() {
            Productkey MyApiList = Productkey.fromJson(apiItems);
            ProductList.add(MyApiList);
          });
        }
      }
    }
  }
}
