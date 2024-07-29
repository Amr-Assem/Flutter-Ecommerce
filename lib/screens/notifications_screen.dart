import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proj_amr_ecommerce/widgets/appbar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var responseList;

  void getData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/albums');
      if (response.statusCode == 200) {
        setState(() {
          responseList = response.data as List;
        });
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppbarWidget(),
            Text(
              "Notifications",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(height: 16),
            responseList == null
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: double.infinity, height: 300),
                      Text("Loading Data ..."),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(responseList[index]["title"]),
                          ),
                        );
                      },
                      itemCount: responseList.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
