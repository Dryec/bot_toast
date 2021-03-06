import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  bool enableSlideOff = true;
  bool onlyOne = true;
  bool crossPage = true;
  int seconds = 2;
  double contentPadding = 2;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  BotToast.showNotification(
                      leading: (cancel) => SizedBox.fromSize(
                          size: const Size(40, 40),
                          child: IconButton(
                            icon: Icon(Icons.favorite, color: Colors.redAccent),
                            onPressed: cancel,
                          )),
                      title: (_) => Text('I love u'),
                      subtitle: (_) => Text("let's be together"),
                      trailing: (cancel) => IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: cancel,
                          ),
                      onTap: () {
                        BotToast.showText(text: 'Tap toast');
                      },
                      onLongPress: () {
                        BotToast.showText(text: 'Long press toast');
                      },
                      enableSlideOff: enableSlideOff,
                      crossPage: crossPage,
                      contentPadding: EdgeInsets.all(contentPadding),
                      onlyOne: onlyOne,
                      animationDuration:
                          Duration(milliseconds: animationMilliseconds),
                      animationReverseDuration:
                          Duration(milliseconds: animationReverseMilliseconds),
                      duration: Duration(seconds: seconds));
                },
                child: Text("notification"),
              ),
              SwitchListTile(
                value: enableSlideOff,
                onChanged: (value) {
                  setState(() {
                    enableSlideOff = value;
                  });
                },
                title: Text("enableSlideOff: "),
              ),
              SwitchListTile(
                value: onlyOne,
                onChanged: (value) {
                  setState(() {
                    onlyOne = value;
                  });
                },
                title: Text("onlyOne: "),
              ),
              SwitchListTile(
                value: crossPage,
                onChanged: (value) {
                  setState(() {
                    crossPage = value;
                  });
                },
                title: Text("crossPage: "),
              ),
              ListTile(
                title: Text("duration:   ${seconds}s"),
                trailing: CupertinoSlider(
                  min: 1,
                  max: 20,
                  value: seconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      seconds = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("animationDuration:   ${animationMilliseconds}ms"),
                trailing: CupertinoSlider(
                  min: 100,
                  max: 1000,
                  divisions: 18,
                  value: animationMilliseconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      animationMilliseconds = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                    "animationReverseDuration:   ${animationReverseMilliseconds}ms"),
                trailing: CupertinoSlider(
                  min: 100,
                  max: 1000,
                  divisions: 18,
                  value: animationReverseMilliseconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      animationReverseMilliseconds = value.toInt();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("contentPadding:   $contentPadding"),
                trailing: CupertinoSlider(
                  min: 1,
                  max: 30,
                  value: contentPadding,
                  onChanged: (double value) {
                    setState(() {
                      contentPadding = value;
                    });
                  },
                ),
              ),
              Divider(),
              Text("code"),
              Divider(),
              Text(
                _code,
                textAlign: TextAlign.start,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

String _code = """
BotToast.showNotification(
         leading: (_) => SizedBox.fromSize(
             size: const Size(40, 40),
             child: ClipOval(
                 child: Icon(
               Icons.favorite,
               color: Colors.redAccent,
             ))),
         title: (_) => Text('I love u'),
         subtitle: (_) => Text("let's be together"),
         trailing: (cancel) => IconButton(
               icon: Icon(Icons.cancel),
               onPressed: cancel,
             ),
         enableSlideOff: enableSlideOff,
         crossPage: crossPage,
         contentPadding: EdgeInsets.all(contentPadding),
         onlyOne: onlyOne,
         duration: Duration(seconds: seconds)
);
""";
