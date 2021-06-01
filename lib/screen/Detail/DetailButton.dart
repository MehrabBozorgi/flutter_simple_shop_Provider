import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:small_project_with_provider/model/app.dart';

class DetailButton extends StatefulWidget {
  AppModel appModel;

  DetailButton({required this.appModel});

  @override
  _DetailButtonState createState() => _DetailButtonState();
}

class _DetailButtonState extends State<DetailButton> {
  String downloadMessage = 'Downloading...';

  bool _isDownloading = false;
  double _percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 100,
          height: 45,
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Theme.of(context).primaryColor,
            elevation: 5,
          ),
          icon: Icon(Icons.download_rounded),
          label: Text('Download'),
          onPressed: () async {
            setState(() {
              _isDownloading = !_isDownloading;
            });

            String urlPath = 'https://cafebazaar.ir/download/bazaar.apk';
            var dir = await getExternalStorageDirectory();

            Dio dio = Dio();
            dio.download(urlPath, '${dir!.path}/sample.apk',
                onReceiveProgress: (actualByte, totalByte) {
              var percentage = actualByte / totalByte * 100;
              print('object');
              if (percentage < 100) {
                _percentage = percentage / 100;
                setState(() {
                  downloadMessage = 'Downloading... ${percentage.floor()} %';
                });
              } else {
                downloadMessage = 'Download  Successfully';
              }
            });
          },
        ),
      ),
    );
  }
}
