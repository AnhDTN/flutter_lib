import 'package:flutter/material.dart';
import 'package:flutter_lib/model/language.dart';
import 'package:flutter_lib/providers/app_provider.dart';
import 'package:flutter_lib/views/page/list_page.dart';
import 'package:flutter_lib/views/widgets/float_menu_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<AppProvider>(
                  builder: (context, state, child )
                  => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dark mode"),
                      Switch(value: state.isDarkTheme, onChanged: (value) {
                        context.read<AppProvider>().onChangeTheme(value);
                      }, ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Consumer<AppProvider>(
                    builder: (context, state, child )
                    => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadioListTile<LanguageApp>(
                          title: const Text('En'),
                          value: LanguageApp.en,
                          groupValue: state.languageApp,
                          onChanged: (LanguageApp? value) {
                            setState(() {
                              context.read<AppProvider>().onChangeLanguage(value!);
                            });
                          },
                        ),
                        RadioListTile<LanguageApp>(
                          title: const Text('Vi'),
                          value: LanguageApp.vi,
                          groupValue: state.languageApp,
                          onChanged: (LanguageApp? value) {
                            setState(() {
                              context.read<AppProvider>().onChangeLanguage(value!);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 32), child: Text(AppLocalizations.of(context)!.helloWorld),),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: 160,
                    height: 40,
                    child: OutlinedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListPage()));
                    }, child: const Text("Go to Jobs")),
                  ),
                )
              ],
            ),
          ),
      floatingActionButton: const FloatMenuView(),
    );
  }
}
