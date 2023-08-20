import 'package:flutter/material.dart';
import 'package:login_test/screens/home.dart';
import 'package:login_test/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
                  "User Login",
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Login Success"),
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
                  "Login",
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
                  const Text("Don't Have an Account?"),
                  const SizedBox(width: 5.0,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                      );
                    },
                    child: const Text("Register.."),
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
