// ignore_for_file: avoid_print

// import 'package:final_project/login.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:country_picker/country_picker.dart';

class RegisterFormScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final Map<String, dynamic> _authData = {
    'username': '',
    'password': '',
    'first_name': '',
    'last_name': '',
    'phone_number': '',
    'email': '',
  };

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode userNameFocus = FocusNode();
  FocusNode countryFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode rePasswordFocus = FocusNode();

  bool visible = true;

  String countryName = 'Select Country: ';

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  // void loginNav(BuildContext context) {
  void register(BuildContext context) {
    // if (passwordController.text == rePasswordController.text) {
    //   print(emailController.text);
    //   print(firstNameController.text);
    //   print(lastNameController.text);
    //   print(userNameController.text);
    //   print(mobileController.text);
    //   print(birthDateController.text);
    //   print(passwordController.text);
    //   print(rePasswordController.text);
    // } else {
    //   print('Passwords are not Identical!');
    // }
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/TotalCare.png',
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Email')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: true,
                      onEditingComplete: () {
                        firstNameFocus.requestFocus();
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Address Should not be Empty!';
                        } else if (!value.contains('@')) {
                          return 'Email Address must Contain @ Symbol!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _authData['email'] = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(MdiIcons.email),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Enter Your Email Account',
                        // focusedBorder: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('First Name')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      onEditingComplete: () => lastNameFocus.requestFocus(),
                      focusNode: firstNameFocus,
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        _authData['first_name'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name Cannot be Empty!';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Enter Your First Name',
                        // focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Last Name')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      onEditingComplete: () => userNameFocus.requestFocus(),
                      focusNode: lastNameFocus,
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        _authData['last_name'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last Name Cannot be Empty!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Enter Your Last Name',
                        // focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Username')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      focusNode: userNameFocus,
                      onEditingComplete: () => countryFocus.requestFocus(),
                      controller: userNameController,
                      onSaved: (value) {
                        _authData['username'] = value;
                      },
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username Should not be Empty!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_add_alt_1),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'What Should We Call You?',
                        // focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Country')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.lerp(
                          Alignment.bottomRight, Alignment.center, 2.1),
                      child: TextButton.icon(
                        focusNode: countryFocus,
                        label: Text(countryName),
                        onPressed: () => showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            country.flagEmoji;
                            mobileController.text = '+${country.phoneCode}';
                            countryName =
                                '${country.flagEmoji}  ${country.name}';
                            phoneFocus.requestFocus();
                            setState(() {});
                          },
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text('Phone Number'),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      onEditingComplete: () => passwordFocus.requestFocus(),
                      controller: mobileController,
                      focusNode: phoneFocus,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _authData['phone_number'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number Cannot be Empty!';
                        }
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Your Phone Number',
                        // focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    // Container(
                    //     alignment: Alignment.topLeft,
                    //     child: const Text('Birth Date')),
                    // SizedBox(
                    //   height: mediaQuery.height * 0.02,
                    // ),
                    // // IconButton(
                    // //     onPressed: () {
                    // //       showDatePicker(
                    // //           context: context,
                    // //           initialDate: DateTime.now(),
                    // //           firstDate: DateTime(1950),
                    // //           lastDate: DateTime.now());
                    // //     },
                    // //     icon: const Icon(Icons.date_range_outlined)),
                    // TextFormField(
                    // onEditingComplete: () => firstNameFocus.requestFocus(),
                    //   // controller: birthDateController,
                    //   keyboardType: TextInputType.datetime,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Birth Date Cannot be Empty!';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0)),
                    //     labelText: 'Enter Your Date of Birth',
                    //     // focusedBorder: OutlineInputBorder(),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: mediaQuery.height * 0.02,
                    // ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Password')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      onEditingComplete: () => rePasswordFocus.requestFocus(),
                      focusNode: passwordFocus,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Should not be Empty!';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 Characters!';
                        } else if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one Upper case letter!';
                        } else if (!value.contains(RegExp(r'[a-z]'))) {
                          return 'Password must contain at least one Lower case letter!';
                        } else if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
                          return 'Password must contain at least one Symbol!\n[!@#\\\$&*~]';
                        } else if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Password must contain at least one digit!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                      obscureText: visible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            visible = !visible;
                            setState(() {});
                          },
                          icon: visible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(MdiIcons.formTextboxPassword),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Enter Your Password',
                        //hintText: 'password',
                        // focusedBorder: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Confirm Your Password')),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextFormField(
                      focusNode: rePasswordFocus,
                      // controller: rePasswordController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Confirmation Field Cannot be Empty!';
                        } else if (value != passwordController.value.text) {
                          return 'Passwords must be Identical!';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            visible = !visible;
                            setState(() {});
                          },
                          icon: visible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(MdiIcons.formTextboxPassword),
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Confirm Your Password',
                        // focusedBorder: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          fixedSize: MaterialStateProperty.all(Size(
                              mediaQuery.width * 0.77,
                              mediaQuery.height * 0.08)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: () => register(context),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18, letterSpacing: 2),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: TextButton.icon(
                        label: const Text(
                          'Sign up using Facebook',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          MdiIcons.facebook,
                          size: 34,
                          color: Color(0xff3E529C),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.lerp(
                          Alignment.bottomRight, Alignment.bottomCenter, 1.11),
                      child: TextButton.icon(
                        label: const Text(
                          'Sign up using Google',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        icon: Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xffEC2D2F)),
                          child: const Icon(
                            MdiIcons.google,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () => {}, child: const Text('Login'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
