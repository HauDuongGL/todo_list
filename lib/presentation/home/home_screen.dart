import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'HOME SCREEN',
      showBackButton: false,
      body: Container(),
      bottomNavigationBar: Column(),
    );
  }
}
