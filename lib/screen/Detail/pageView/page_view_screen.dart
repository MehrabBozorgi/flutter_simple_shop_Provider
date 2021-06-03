import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_project_with_provider/model/page_view.dart';
import 'package:small_project_with_provider/provider/PageViewProvider.dart';
import 'Active.dart';
import 'InActive.dart';

class PageViewScreen extends StatefulWidget {
  int idM;

  PageViewScreen(this.idM);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context, listen: false);
    provider.fetchData(widget.idM);

    return Consumer<PageViewProvider>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 180,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (position) {
                setState(
                  () {
                    tabIndex = position;
                  },
                );
              },
              itemCount: value.list.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(
                          value.list[index].img,
                        ),
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer(value.list),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  footer(List<PageViewModel> list) {
    List<Widget> sliderItem = [];

    for (int i = 0; i < list.length; i++) {
      i == tabIndex
          ? sliderItem.add(
              Active(),
            )
          : sliderItem.add(
              InActive(),
            );
    }
    return Positioned(
      bottom: 5,
      right: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        // height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black45,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliderItem,
        ),
      ),
    );
  }
}
