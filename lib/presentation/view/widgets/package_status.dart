import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/domain/entities/box.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/entities/models/package.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 100.0;

class PackageStatus extends StatelessWidget {
  const PackageStatus({
    Key? key,
    required this.package,
  }) : super(key: key);

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height - 500,
      decoration: const BoxDecoration(
          color: inputBgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: (package.isReceived == true && package.isReturned == true)
            ? _buildTwoDots(package)
            : (package.isReceived == true && package.isReturned == false)
                ? _buildOneDot(package)
                : _buildNotReceivedPackage(),
      ),
    );
  }

  Widget _buildTwoDots(PackageModel package) {
    final data = _TimelineStatus.values;

    final receivedDate = DateTime.parse(package.receivedDate);
    final returnedDate = DateTime.parse(package.returnedDate);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                '${receivedDate.day < 10 ? '0${receivedDate.day}' : receivedDate.day}/${receivedDate.month < 10 ? '0${receivedDate.month}' : receivedDate.month}/${receivedDate.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${receivedDate.hour < 10 ? '0${receivedDate.hour}' : receivedDate.hour}:${receivedDate.minute < 10 ? '0${receivedDate.minute}' : receivedDate.minute}',
                style: const TextStyle(
                    color: labelGrayPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                '${returnedDate.day < 10 ? '0${returnedDate.day}' : returnedDate.day}/${returnedDate.month < 10 ? '0${returnedDate.month}' : returnedDate.month}/${returnedDate.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${returnedDate.hour < 10 ? '0${returnedDate.hour}' : returnedDate.hour}:${returnedDate.minute < 10 ? '0${returnedDate.minute}' : returnedDate.minute}',
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
                      color: receivedPackagesColor,
                    );
                  case _TimelineStatus.returned:
                  default:
                    return const DotIndicator(
                      size: 20,
                      color: returnedPackagesColor,
                    );
                }
              },
              itemExtentBuilder: (_, __) => kTileHeight,
              itemCount: 2,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  UITexts.labelPackageReceivedConfirmation,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  UITexts.labelPackageReturnedConfirmation,
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

  Widget _buildOneDot(PackageModel package) {
    final data = _TimelineStatus.values;

    final receivedDate = DateTime.parse(package.receivedDate);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                '${receivedDate.day < 10 ? '0${receivedDate.day}' : receivedDate.day}/${receivedDate.month < 10 ? '0${receivedDate.month}' : receivedDate.month}/${receivedDate.year}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${receivedDate.hour < 10 ? '0${receivedDate.hour}' : receivedDate.hour}:${receivedDate.minute < 10 ? '0${receivedDate.minute}' : receivedDate.minute}',
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
                return const DashedLineConnector(
                  dash: 2,
                  gap: 1,
                  color: Colors.grey,
                  thickness: 0.6,
                );
              },
              indicatorBuilder: (_, index) {
                switch (data[index]) {
                  case _TimelineStatus.received:
                    return const DotIndicator(
                      size: 20,
                      color: receivedPackagesColor,
                    );
                  case _TimelineStatus.returned:
                  default:
                    return const OutlinedDotIndicator(
                      size: 20,
                      color: returnedPackagesColor,
                    );
                }
              },
              itemExtentBuilder: (_, __) => kTileHeight,
              itemCount: 2,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  UITexts.labelPackageReceivedConfirmation,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ))
      ],
    );
  }

  Widget _buildNotReceivedPackage() {
    final data = _TimelineStatus.values;

    return Column(
      children: [
        Text(
            UITexts.labelPackageNotReceivedConfirmation,
            style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        SizedBox(height: 10,),
        Expanded(
          flex: 1,
          child: FixedTimeline.tileBuilder(
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.after,
              connectorBuilder: (_, index, __) {
                return const DashedLineConnector(
                  dash: 2,
                  gap: 1,
                  color: Colors.grey,
                  thickness: 0.6,
                );
              },
              indicatorBuilder: (_, index) {
                switch (data[index]) {
                  case _TimelineStatus.received:
                    return const OutlinedDotIndicator(
                      size: 20,
                      color: receivedPackagesColor,
                    );
                  case _TimelineStatus.returned:
                  default:
                    return const OutlinedDotIndicator(
                      size: 20,
                      color: returnedPackagesColor,
                    );
                }
              },
              itemExtentBuilder: (_, __) => kTileHeight,
              itemCount: 2,
            ),
          ),
        ),
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
  returned,
}
