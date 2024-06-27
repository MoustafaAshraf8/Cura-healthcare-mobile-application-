import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
      SecondaryHeaderContainer(
        child: Column(
          children: [
            //Header AppBar
            SizedBox(
              height: 5,
            ),
            TAppBar(
              showBackArrow: true,
              title: Text("Notifications",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              actions: [
                Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                  size: 27,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: 600,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(index),
                startActionPane: ActionPane(
                  extentRatio: .3,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.access_time,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  dismissible: DismissiblePane(
                    onDismissed: () {},
                  ),
                  extentRatio: .3,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.delete,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[700]!,
                    )
                  ],
                ),
                child: listViewItem(index),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 0);
            },
            itemCount: 2),
      ),
    ])));
  }

  Widget listViewItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixicon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [message(index), dateAtime(index)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixicon() {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 11, 67, 113),
      ),
      child: const Icon(
        Icons.notifications,
        size: 25,
        color: Color.fromARGB(255, 255, 195, 106),
      ),
    );
  }

  Widget message(int index) {
    double textsize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: 'Message  ',
            style: TextStyle(
                fontSize: textsize,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: 'A7la Mesa 3la A7la Regala',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
            ]),
      ),
    );
  }

  Widget dateAtime(int index) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3-05-2024',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                '4:16 AM',
                style: TextStyle(
                  fontSize: 10,
                ),
              )
            ]));
  }
}
