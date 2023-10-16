import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traker_app/config/traker_colors.dart';
import 'package:traker_app/config/traker_style.dart';
import 'package:traker_app/initial_page.dart';
import 'package:traker_app/views/config/provider/config_provider.dart';
import 'package:traker_app/views/home/page/home_page.dart';
import 'package:traker_app/widgets_utils/button_general.dart';
import 'package:traker_app/widgets_utils/textfield_general.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key,
    this.isFirst = false
  }) : super(key: key);
  final bool isFirst;

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: Consumer<ConfigProvider>(
        builder: (context, provider, child){
          return SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textTitle(title: 'Teléfono'),
                  SizedBox(height: sizeH * 0.02,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1,),
                    child: TextFieldGeneral(
                      textEditingController: provider.controller,
                    ),
                  ),
                  SizedBox(height: sizeH * 0.02,),
                  textTitle(title: 'Contraseña'),
                  SizedBox(height: sizeH * 0.02,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1,),
                    child: TextFieldGeneral(
                      textEditingController: provider.controllerPass,
                    ),
                  ),
                  SizedBox(height: sizeH * 0.02,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                    child: ButtonGeneral(
                      titlePadding: EdgeInsets.all(sizeH * 0.02),
                      title: 'Guardar',
                      backgroundColor: TrakerColors.primary,
                      textStyle: TrakerStyles().stylePrimary(
                        size: sizeH * 0.025,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        provider.save();
                        if(widget.isFirst){
                          Navigator.pushReplacement(context,MaterialPageRoute<void>(
                              builder: (context) => const HomePage()
                          ),);
                        }else{
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }

  Widget textTitle({required String title}){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
      child: Text(title),
    );
  }
}
