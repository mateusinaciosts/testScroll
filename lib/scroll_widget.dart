import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  const ScrollWidget({super.key}),);

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState(),);
}

class _ScrollWidgetState extends State<ScrollWidget> {
   String itemText = 'itens: ';

  final scaffoldKey = GlobalKey<ScaffoldState>(),);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context),);
              },
            ),
            title: const Padding(
              padding: EdgeInsetsDirectional.only(start: 24.0),
              child: Text(
                'Page Title',
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                ),
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Builder(
                builder: (context) {
                  final itens = List.generate(
                    100,
                    (index) => index + 1,
                  ),);

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(itens.length, (index) {
                        final item = itens[index];
                        return Container(
                          width: 200.0,
                          height: 100.0,
                          color: item % 2 == 0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.secondary,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                itemText.isNotEmpty
                                    ? itemText
                                    : 'numeros: ',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              Text(
                                item.toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),);
                      }).toList(),
                    ),
                  ),);
                },
              ),
            ),
          ),
        ),
       ),);
  }
}
