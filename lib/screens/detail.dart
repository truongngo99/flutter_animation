import 'dart:convert';
import 'package:animation/model/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String id;

  const Detail({Key? key, required this.id}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  final _select = ValueNotifier(false);
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<RelativeRect> _relativeRect;
  late RelativeRect _value;
  final jump = ValueNotifier(false);

  double onEnd = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1), value: 24);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );
    _relativeRect = RelativeRectTween(
            begin: RelativeRect.fromLTRB(250, 250, 0, 0),
            end: RelativeRect.fromLTRB(0, 0, 5, 5))
        .animate(animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('trips')
                .doc(widget.id)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              Trips trips =
                  Trips.fromJson(snapshot.data!.data() as Map<String, dynamic>);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 430,
                    child: Hero(
                      tag: 'dash-${trips.image}',
                      child: Image.network(
                        '${trips.image}',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('${trips.name}'),
                                Text(
                                    '${trips.nights} night stay for only \$${((trips.price * trips.nights) - 100).toStringAsFixed(3)}'),
                              ],
                            ),
                          ],
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: jump,
                          builder: (context, value, child) =>
                              AnimatedPositioned(
                            right: 0,
                            bottom: value ? 30 : 0,
                            curve: Curves.bounceIn,
                            duration: Duration(milliseconds: 500),
                            // top: 0,
                            onEnd: () {
                              if (value) {
                                jump.value = false;
                              }
                            },
                            child: ValueListenableBuilder<bool>(
                              valueListenable: _select,
                              builder: (context, _selectValue, _) => InkWell(
                                onTap: () {
                                  _select.value = !_selectValue;
                                  jump.value = true;
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color:
                                      _selectValue ? Colors.red : Colors.grey,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   title: Text(trips.name),
                  //   subtitle: Text('${trips.price} night stay for only \$400'),
                  //   trailing: Stack(
                  //     children: [
                  //       PositionedTransition(
                  //         rect: _relativeRect,
                  //         child: Icon(
                  //           Icons.favorite,
                  //           // color: _select ? Colors.red : Colors.grey,
                  //           size: 24,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     animationController.forward(from: 0.1);
                  //     // animationController = AnimationController(
                  //     //     vsync: this, duration: Duration(seconds: 1))
                  //     //   ..forward();
                  //     // animation = CurvedAnimation(
                  //     //     parent: animationController, curve: Curves.fastOutSlowIn);
                  //     // setState(() {
                  //     //   _select = !_select;
                  //     // });
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      trips.description,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
