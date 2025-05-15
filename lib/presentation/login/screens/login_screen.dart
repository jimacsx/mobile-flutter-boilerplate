import 'package:banking_flutter_app/presentation/core/shared_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomField(
                decoration: InputDecoration(
                  labelText: 'Custom field',
                  hintText: 'test',
                  helperText: '',
                ),
                validator: (value) {
                  if(value!.isEmpty) return 'This field is required';
                  return '';
                }
              ),
              SizedBox(height: 20),
              EmailField(
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 20),
              //Password field
              PasswordField(
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    debugPrint("Registered with Username: $_email, Password: $_password");
                  }
                },
                child: Text('TEST'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
