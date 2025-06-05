import 'package:flutter/material.dart';

class QuicklyAppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool showBack;
  final String? title;

  const QuicklyAppScaffold({
    required this.body,
    this.appBar,
    this.showBack = false,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            leading: showBack
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.deepPurple),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: title != null
                ? Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  )
                : const SizedBox(),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  'assets/images/logo_qi.png',
                  height: 32,
                ),
              ),
            ],
          ),
      body: SafeArea(child: body),
    );
  }
}
