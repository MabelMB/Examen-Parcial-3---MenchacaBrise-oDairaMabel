import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/auth/services/auth_services.dart';
import 'package:flutter_application_3/features/auth/widgets/custom_text_file.dart';
import 'package:flutter_application_3/features/screens/home_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  final TextEditingController _usernameController = TextEditingController(text: "emilys");
  final TextEditingController _passwordController = TextEditingController(text: "emilyspass");

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _iniciarSesion() async{
    setState(() {
      _isLoading = true;
    });

  bool sucess = await _authService.login(_usernameController.text, _passwordController.text);

  if(!mounted) return; //si el componente no está montado

  setState(() {
    _isLoading = false;
  });

  if(sucess){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Inicio de sesión exitoso"))
    );
    //navegación hacia homescreen
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => HomeScreen())
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al iniciar sesión"),
          backgroundColor: Colors.red)
        );
  }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('FitTrack Pro',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            CustomTextFile(controller: _usernameController, label: "Usuario"),
            SizedBox(height: 16),
            CustomTextFile(controller: _passwordController, label: "Contraseña"),
            SizedBox(height: 32),
            _isLoading ?
            Center(child: CircularProgressIndicator()) :
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            
              ),
              onPressed: _iniciarSesion,
              child: Text("Iniciar sesión", style: TextStyle(fontSize: 18)),
            )
          ],
        )
        
      ))
    );
  }

}