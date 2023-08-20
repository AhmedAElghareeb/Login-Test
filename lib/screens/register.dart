import 'package:flutter/material.dart';
import 'package:login_test/screens/home.dart';
import 'package:login_test/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "User Registration",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              const Center(
                child: Icon(
                  Icons.person_pin_outlined,
                  size: 100.0, color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Your Name Please..",
                  suffixIcon: const Icon(Icons.person, color: Colors.black,),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return "Value Must not be Empty..";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Your E-Mail Please..",
                  suffixIcon: const Icon(Icons.email, color: Colors.blue,),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return "Value Must not be Empty..";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Your Password Please..",
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                    onPressed: ()
                    {

                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return "Value Must not be Empty..";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: ()
                {
                  if (_formKey.currentState!.validate())
                  {
                    ScaffoldMessenger.of(
                        context).showSnackBar(
                      const SnackBar(
                        content: Text("Register Success"),
                      ),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Home(
                          name: nameController.text,
                        ),
                      ),
                      );
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an Account?"),
                  const SizedBox(width: 5.0,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      );
                    },
                    child: const Text("Login.."),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
