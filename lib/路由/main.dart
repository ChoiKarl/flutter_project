import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'unknown_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        DetailPage.routeName: (context) => DetailPage()
      },
      onGenerateRoute: (settings){
        if (settings.name == SettingsPage.routeName) {
          return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return SettingsPage(settings.arguments ?? "");
            }
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) {
              return UnknownPage(settings.name);
            }
        );
      },
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(DetailPage.routeName, arguments: "详情页的参数");
                },
                child: Text("跳转到详情"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingsPage.routeName, arguments: "我是设置页").then((value){
                    print(value);
                  });
                },
                child: Text("跳转到设置"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ProfilePage("个人页");
                  })).then((value){
                    print("value is $value");
                  });
                },
                child: Text("跳转到个人"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("HAHAHA");
                },
                child: Text("跳转到其他"),
              )
            ],
          )
      ),
    );
  }
}
