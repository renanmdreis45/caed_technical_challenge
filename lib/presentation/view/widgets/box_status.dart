import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/models/package.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 100.0;

class BoxStatus extends StatelessWidget {
  const BoxStatus({
    Key? key,
    required this.box,
  }) : super(key: key);

  final BoxModel box;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 500,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, bottom: 8, right: 8),
                  child: Text(
                    UITexts.packageLabelStatus,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Center(
                  child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height - 340,
                decoration: const BoxDecoration(
                    color: inputBgColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: _buildBoxStatus(box),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoxStatus(BoxModel box) {
    final data = _TimelineStatus.values;

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Text(
                '${box.dateReceived.day < 10 ? '0${box.dateReceived.day}' : box.dateReceived.day}/${box.dateReceived.month < 10 ? '0${box.dateReceived.month}' : box.dateReceived.month}/${box.dateReceived.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${box.dateReceived.hour < 10 ? '0${box.dateReceived.hour}' : box.dateReceived.hour}:${box.dateReceived.minute < 10 ? '0${box.dateReceived.minute}' : box.dateReceived.minute}',
                style: const TextStyle(
                    color: labelGrayPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                '${box.dateOpen.day < 10 ? '0${box.dateOpen.day}' : box.dateOpen.day}/${box.dateOpen.month < 10 ? '0${box.dateOpen.month}' : box.dateOpen.month}/${box.dateOpen.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${box.dateOpen.hour < 10 ? '0${box.dateOpen.hour}' : box.dateOpen.hour}:${box.dateOpen.minute < 10 ? '0${box.dateOpen.minute}' : box.dateOpen.minute}',
                style: const TextStyle(
                    color: labelGrayPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                '${box.dateRead.day < 10 ? '0${box.dateRead.day}' : box.dateRead.day}/${box.dateRead.month < 10 ? '0${box.dateRead.month}' : box.dateRead.month}/${box.dateRead.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${box.dateRead.hour < 10 ? '0${box.dateRead.hour}' : box.dateRead.hour}:${box.dateRead.minute < 10 ? '0${box.dateRead.minute}' : box.dateRead.minute}',
                style: const TextStyle(
                    color: labelGrayPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                '${box.dateReturned.day < 10 ? '0${box.dateReturned.day}' : box.dateReturned.day}/${box.dateReturned.month < 10 ? '0${box.dateReturned.month}' : box.dateReturned.month}/${box.dateReturned.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${box.dateReturned.hour < 10 ? '0${box.dateReturned.hour}' : box.dateReturned.hour}:${box.dateReturned.minute < 10 ? '0${box.dateReturned.minute}' : box.dateReturned.minute}',
                style: const TextStyle(
                    color: labelGrayPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: FixedTimeline.tileBuilder(
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.after,
              connectorBuilder: (_, index, __) {
                return const SolidLineConnector(
                  color: Colors.grey,
                  thickness: 0.6,
                );
              },
              indicatorBuilder: (_, index) {
                switch (data[index]) {
                  case _TimelineStatus.received:
                    return const DotIndicator(
                      size: 20,
                      color: lightGreenReceivedBoxStatus,
                    );
                  case _TimelineStatus.open:
                    return const DotIndicator(
                      size: 20,
                      color: receivedPackagesColor,
                    );
                  case _TimelineStatus.read:
                    return const DotIndicator(
                      size: 20,
                      color: returnedPackagesColor,
                    );
                  case _TimelineStatus.returned:
                  default:
                    return const DotIndicator(
                      size: 20,
                      color: darkGreenReturnedBoxStatus,
                    );
                }
              },
              itemExtentBuilder: (_, __) => kTileHeight,
              itemCount: 4,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  UITexts.labelBoxReceiveConfirmation,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 65,
                ),
                Text(
                  UITexts.labelBoxOpenConfirmation,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 65,
                ),
                Text(
                  UITexts.labelBoxReadConfirmation,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 65,
                ),
                Text(
                  UITexts.labelBoxReturnConfirmation,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ))
      ],
    );
  }
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
      ),
    );
  }
}

enum _TimelineStatus {
  received,
  open,
  read,
  returned,
}
