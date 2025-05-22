// // ignore_for_file: use_build_context_synchronously
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:perdiy/data/datasource/local_datasource.dart';
// import 'package:perdiy/data/models/login/request/login_request_model.dart';
// import 'package:perdiy/presentation/page/auth/register_page.dart';
// import 'package:perdiy/presentation/page/home_page.dart';
// import 'package:perdiy/presentation/widgets/custome_textfield.dart';
// import '../../../bloc/login/login_bloc.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   final LocalDataSource _localDataSource = LocalDataSource();

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedCredentials();
//   }

//   Future<void> _loadSavedCredentials() async {
//     String? savedEmail = await _localDataSource.getEmail();
//     String? savedPassword = await _localDataSource.getPassword();
//     if (savedEmail != null && savedPassword != null) {
//       setState(() {
//         _emailController.text = savedEmail;
//         _passwordController.text = savedPassword;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomTextField(
//               controller: _emailController,
//               label: 'Email',
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),
//             CustomTextField(
//               controller: _passwordController,
//               label: 'Password',
//               obscureText: !_isPasswordVisible,
//               onToggleVisibility: () {
//                 setState(() {
//                   _isPasswordVisible = !_isPasswordVisible;
//                 });
//               },
//             ),
//             const SizedBox(height: 24),
//             BlocConsumer<LoginBloc, LoginState>(
//               listener: (context, state) async {
//                 state.maybeWhen(
//                   erorr: (message) {
//                     // print(message);
//                   },
//                   loaded: (model) async {
//                     await _localDataSource.saveToken(model.token);
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const HomePage(),
//                       ),
//                       (route) => false,
//                     );
//                   },
//                   orElse: () {},
//                 );
//               },
//               builder: (context, state) {
//                 return state.maybeWhen(
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   orElse: () {
//                     return Column(
//                       children: [
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               final email = _emailController.text.trim();
//                               final password = _passwordController.text.trim();

//                               context.read<LoginBloc>().add(
//                                     LoginEvent.login(
//                                       LoginRequestModel(
//                                         email: email,
//                                         password: password,
//                                       ),
//                                     ),
//                                   );
//                             },
//                             child: const Text('Login'),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const RegisterPage(),
//                               ),
//                             );
//                           },
//                           child: const Text('Belum punya akun? Daftar di sini'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
