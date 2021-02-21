import '../export/export.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with LoginValidation {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _obscureText = false;
  bool _progressBarActive = false;
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  final FocusNode _loginFocus = FocusNode();
  final FocusNode _pswdFocusss = FocusNode();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: _loginpage(context),
      ),
    );
  }

  List<Widget> _loginpage(BuildContext context) {
    Container container = Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formkey,
        child: ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 65.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Image.asset(
                      'images/loginpagelogo.jpg',
                      scale: 2.0,
                    ),
                  ),
                ),
                usernamefield(),
                SizedBox(
                  height: 20,
                ),
                passwordfield(),
                SizedBox(
                  height: 20,
                ),
                submitbutton(),
              ],
            ),
          ],
        ),
      ),
    );

    var loadingcircle = new List<Widget>();
    loadingcircle.add(container);

    if (_progressBarActive) {
      var modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.3,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );
      loadingcircle.add(modal);
    }

    return loadingcircle;
  }

  Widget usernamefield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        fontStyle: FontStyle.normal,
        color: Colors.black,
      ),
      textInputAction: TextInputAction.next,
      focusNode: _loginFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _loginFocus, _pswdFocusss);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25),
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          filled: true,
          hintText: 'Username',
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14.0)),
      validator: emailvalidation,
      onSaved: (String value) {
        username.text = value;
      },
    );
  }

  Widget passwordfield() {
    return TextFormField(
      obscureText: !_obscureText,
      maxLength: 50,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      focusNode: _pswdFocusss,
      onFieldSubmitted: (term) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25),
          counterText: '',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff00acd6),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          filled: true,
          hintText: 'Password',
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14.0)),
      validator: passwordvalidation,
      onSaved: (String value) {
        password.text = value;
      },
    );
  }

  Widget submitbutton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Color(0xfff99d1c),
          ),
        ),
        onPressed: () {
          setState(() {
            if (_formkey.currentState.validate()) {
              FocusScope.of(context).requestFocus(FocusNode());
              _formkey.currentState.save();
              if (Loginrepo.instance.loginusername == username.text &&
                  Loginrepo.instance.loginpassword == password.text) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => new Dashboard()),
                  (Route<dynamic> route) => false,
                );
              } else {
                _showerrorSnackbar("Invalid Username or Password");
              }
            }
          });
        },
        color: Color(0xff00acd6),
        textColor: Colors.white,
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  void _showerrorSnackbar(String message) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(getErrorSnackBar(message));
  }
}
