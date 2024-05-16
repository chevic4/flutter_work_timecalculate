import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/url_link_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CalcHtmlScreen extends StatefulWidget {
  const CalcHtmlScreen({super.key});

  @override
  State<CalcHtmlScreen> createState() => _CalcHtmlScreenState();
}

class _CalcHtmlScreenState extends State<CalcHtmlScreen> {
  late WebViewXController webviewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: const Text('калькулятор времени')),
      body: Center(
        child: FutureBuilder<String>(
          future: LocalLoader().loadLocal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  WebViewX(
                    initialContent: snapshot.requireData,
                    initialSourceType: SourceType.html,
                    height: 420,
                    width: MediaQuery.of(context).size.width - 10,
                    onWebViewCreated: (controller) =>
                        webviewController = controller,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinkedStringWidget(
                      dataText: 'перейти на сайт \nallcalc.ru',
                      onTap: () async {
                        launchUrl(Uri.parse('https:/allcalc.ru'));
                      },
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinkedStringWidget(
                        dataText: 'воспользоваться оригиналом \nкалькулятора',
                        onTap: () async {
                          launchUrl(Uri.parse(
                              'https://allcalc.ru/node/358https://allcalc.ru/node/358'));
                        },
                        fontSize: 16),
                  ),
                  Spacer(),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class LocalLoader {
  Future<String> loadLocal() async {
    return await rootBundle.loadString('assets/calc_html/index.html');
  }
}
