import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

final _FormKey = GlobalKey<FormState>();

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: _FormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Name";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Product Name"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Price";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Product Price"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Code";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Product Code"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Quantity";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Quantity"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Total price";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Total Price"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Import product Image";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Product Image"),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_FormKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Update"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
