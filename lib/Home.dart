import 'package:actividades_complementarias/AuthManager.dart';
import 'package:flutter/material.dart';
import 'package:actividades_complementarias/AuthManager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:actividades_complementarias/pantallas/usuario.dart';
import 'package:actividades_complementarias/pantallas/configuracion.dart';
import 'package:actividades_complementarias/pantallas/contador.dart';
import 'package:actividades_complementarias/pantallas/inforQR.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AuthManager handler;
  int _seleccionDrawerItem = 0;

  @override
  void initState(){
    super.initState();
    handler = AuthManager.getInstance(context);
  }

  //Metodo para cambiar de pantalla dentro de nuestro drawer
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return Usuario(title: '',);
      case 1: return Contador();
      case 2: return InfoQR();
      case 3: return Configuracion();
    }
  }

  //Seleccion dentro de nuestro Drawer
  _onSelectItem(int pos){
    Navigator.of(context).pop();
    setState(() {
      _seleccionDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GoogleSignInAccount? currentUser = handler.getCurrentUser();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(currentUser?.displayName ?? ' '),
              accountEmail: Text(currentUser?.email ?? ' '),
              currentAccountPicture: CircleAvatar(
                child: Image.network(
                  currentUser?.photoUrl ?? ' '
                ),
              ),
            ),
            ListTile(
              title: Text('Usuario'),
              leading: Icon(Icons.account_circle),
              onTap: (){
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Mis Horas'),
              leading: Icon(Icons.assignment_turned_in),
              onTap: (){
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('QR'),
              leading: Icon(Icons.qr_code),
              onTap: (){
                _onSelectItem(2);
              },
            ),
            Divider(),
            ListTile(
              title:  Text('Configuración'),
              leading: Icon(Icons.settings),
              onTap: (){
                _onSelectItem(3);
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Puedes utilizar showDialog para confirmar el cierre de sesión
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Cerrar Sesión'),
                      content: Text('¿Estás seguro de que deseas cerrar sesión?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            heroTag: 'googleSignOutButton';
                            handler.signOut();
                          },
                          child: Text('Cerrar Sesión'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            /*
            ListTile(
              title:  Text('Log out'),
              leading: Icon(Icons.logout),
              onTap: (){
                heroTag: 'googleSignOutButton';
                handler.signOut();
              },
            ),*/
          ],
        ),
        /*Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.network("https://lh3.googleusercontent.com/pw/ADCreHewwHneXmFqyneV48fZxVKddM5yAufob-SoRBg4_DYhEjjw7QqjFm3Am_A5Y-83PBMEp7cNqceOb-xVN1DPGrw7F6_lcuQDjEyLgpAh0gTU6CWCEyB1rFmE1gHbfTcsIYhYKyIxljh_fGbaJDP1C7dVgOiL_Rp6dYocXL6zNdZOqSlrfgsjS_E0WQ3JKFoqJFR3NeN82gXcs5O-bkTMU-y_vPF5HgCHLZRd7RoluiXSzNMzDlBoKZ2ItYN1sLkM2R9o98IcUBuhvh0-_iAvj3Q5eU8VfUiWskp8ROPsw7nmECtYetzONcfzEh75LykHbhOXC7qMFypXJdCCsexnbOUxiulvtg0_RuCKALAHa8U1I6DzFFlKrt3jYVueA0LGr8nmHKbvL7mYMnOdB1v_mG2SOxrohzwE7wU7V_Meo8hFBks_yexXQCl4DWDMHefZjwA9r3_NgfViaO4oeLVewbUmDgREE27MdYXpJ9EXYcIu2b_ogPUla9KFsVt5g08PaBLfI0L4Kdmhy1VFiSxYMviZhnXObWPIHM9yp-7e3U2ccc0Y-NgXgBLNPEEfiaZAlYLUTuDNKvVxgDqqHaQgPDYch2rHtOkScprjm7u2olCieP3UHxXLvyhZ3w3YaL6MK_LIVw7VGPFUsc7yaHHxufrG0dRKWL4V5sy97r9PlAN1_hLVjtnlFPFMtW5HKSfewPlZtmsSsM3RY5XMNshS9wh9FRWqoS6dH2Syy2mcrroNf1IBNvVrljmeFnIoqkhmTdF8v_y5AaqLEs9EGezXM7GvvPYf3ZCoYM8LJk3N_xqrSaVAbXPcg6ZnSeCu-Jj2yf-S06PDS1Zik4b-SwR-MDMI9ho2YISZWdWMX-Iv16MANu-Rhn96IpqFcct7P7Ag0vqDyiVgCTy2A13bxeyN4vEWvGRMsao--i9ulNjbW0mb3FrfbUtzfp6IJ5whLs8_3wPY2UaG6d5rVh0wOl2vcZ1aKtgJCE8tfCM0L0v-dnXCsMhxaDfCFyYB0TAi_uZ76K5Xc1oWBCaBYKOhlFoZZ8KzV4c3CBRyy8gpi8PiSxaffNrpfmV8V5TZIz46mKhQo6ur2J5o-C5laQ=w90-h98-s-no-gm?authuser=0"),
              ),
              const Text("Cruz Erick", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Text("Usuario"),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Text("Horas Completadas"),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Text("QR"),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Text("Cerrar Sesión"),
              )
            ],
          ),
        ),*/
      ),
      appBar: AppBar(
        title: const Text("FES Aragon ICO"),
        //backgroundColor: Colors.lightBlueAccent,
      ),
      body: _getDrawerItemWidget(_seleccionDrawerItem),
    );
  }
}