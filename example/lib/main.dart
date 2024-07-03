import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return child!;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XAppBar2(
        title: widget.title,
        color: context.scheme.primary,
        leadingAsset: 'assets/icons/arrow_left_ios.svg',
      ),
      body: Padding(
        padding: EdgeInsets.all(XDimens.sPadding.h),
        child: Column(
          children: [
            const XTextField(title: 'عنوان'),
            XDropDown(
              items: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
              isRtl: false,
              title: 'انتخاب کنید',
              value: selected.toString(),
              onChanged: (selected) => setState(() {
                if (selected != null) this.selected = selected;
              }),
            ),
          ],
        ),
      ).center(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: XAppBar(title: 'Second Screen'), body: Center(child: XText('Second Screen')));
  }
}
