import 'package:castboard_remote/view_models/SplashScreenViewModel.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  const SplashScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.onPullDownData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: LinearProgressIndicator(),
          ),
          SizedBox(height: 16),
          Text('Just a moment', style: Theme.of(context).textTheme.caption),
        ],
      ),
    ));
  }
}