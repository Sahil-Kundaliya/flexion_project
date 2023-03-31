import 'package:flexion_project/Screens/drawer_screen.dart';
import 'package:flexion_project/api_headler/api_headler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/logo_screen_widget.dart';

class LogoScreen extends StatefulWidget {
  LogoScreen({Key? key}) : super(key: key);
  static const routeName = "/logo_screen";

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic>? data;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getData() async {
    data = await Provider.of<ApiHeadler>(context).logoApiData();
    if (data != null) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  "Logo",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 40),
                child: GestureDetector(
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
                    child: Icon(Icons.menu)),
              ),
            ],
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      String title = data?[index].data?.title ?? '';
                      int malId = data?[index].data?.malId ?? 0;
                      String background = data?[index].data?.background ?? '';
                      String imageUrl =
                          data?[index].data?.images?.jpg?.imageUrl ?? '';
                      String url = data?[index].data?.url ?? '';
                      return LogoScreenWidget(
                        title: title,
                        imageUrl: imageUrl,
                        malId: malId,
                        background: background,
                        url: url,
                      );
                    },
                  ),
          )
        ],
      ),
      drawer: Drawer(child: DrawerScreen()),
    );
  }
}
