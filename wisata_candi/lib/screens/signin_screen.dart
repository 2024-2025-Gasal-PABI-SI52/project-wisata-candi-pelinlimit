import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SigninScreen extends StatefulWidget{


  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  //TODO: 1. deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang appbar
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      // TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                //TODO: 4. atur mainAxis dan crossAxis
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO: 5. pasang textformfield nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan nama pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
            
                  //TODO: 6. pasang textformfield kata sandi
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }, 
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off
                          :Icons.visibility,
                        ),),
                    ),
                    obscureText: _obscurePassword,
                  ),  
            
                  //TODO: 7. pasang elevated button sign in
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text('Sign In'),
                  ),
            
                  //TODO: 8. pasang textbutton utk sign up
                  const SizedBox(height: 10,),
                  // TextButton(
                  //   onPressed: (){}, 
                  //   child: Text('Belum punya akun? Daftar disini.'),
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun?',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Daftar disini',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = (){},
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          ),
        ),
      ),
    );
  }
}