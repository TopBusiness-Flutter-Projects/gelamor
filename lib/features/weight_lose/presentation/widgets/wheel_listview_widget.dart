import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class WheelListviewWidget extends StatefulWidget {
  WheelListviewWidget(
      {Key? key, required this.titleText, required this.indexCount})
      : super(key: key);
  final String titleText;
  final int indexCount;

  @override
  State<WheelListviewWidget> createState() => _WheelListviewWidgetState();
}

class _WheelListviewWidgetState extends State<WheelListviewWidget> {
  double itemWidth = 60.0;

  int selected = 0;

  FixedExtentScrollController _scrollController = FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.titleText,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$selected' + '${widget.indexCount <= 100 ? "" : "Kg"}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 500,
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: ListWheelScrollView(
                    magnification: 2.0,
                    onSelectedItemChanged: (x) {
                      setState(() {
                        selected = x ;
                      });
                      print(selected);
                    },
                    controller: _scrollController,
                    children: List.generate(
                      widget.indexCount,
                      (x) => RotatedBox(
                        quarterTurns: 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: x == selected ? 60 : 50,
                          height: x == selected ? 60 : 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: x == selected
                                ? AppColors.gray
                                : AppColors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${x}',
                          ),
                        ),
                      ),
                    ),
                    itemExtent: itemWidth,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
