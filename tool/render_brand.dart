// Renders the PNG brand assets (launcher icon, splash) from assets/brand/elite_wordmark.svg using headless
// Microsoft Edge (or Chrome), so they stay crisp at every density.
//
//   dart run tool/render_brand.dart
//   dart run flutter_launcher_icons && dart run flutter_native_splash:create
//
// Browser: env var BROWSER_PATH, else the default Edge/Chrome install paths on Windows/macOS.
import 'dart:io';

const _navy = '#011F53';
const _white = '#FFFFFF';

/// name, canvas width, canvas height, background, wordmark colour, wordmark width.
const _targets = <(String, int, int, String, String, int)>[
  ('app_icon', 1024, 1024, _navy, _white, 720), // iOS + legacy Android icon (full bleed)
  ('app_icon_foreground', 1024, 1024, 'transparent', _white, 560), // Android adaptive foreground
  ('splash_logo', 800, 360, 'transparent', _white, 720), // pre-Android-12 / iOS splash
  ('splash_android12', 960, 960, 'transparent', _white, 560), // Android 12+ splash icon
];

Future<void> main() async {
  final root = File.fromUri(Platform.script).parent.parent.path;
  final sep = Platform.pathSeparator;
  final svgFile = File('$root${sep}assets${sep}brand${sep}elite_wordmark.svg');
  final svg = svgFile.readAsStringSync().replaceFirst('<svg ', '<svg style="width:100%;display:block" ');
  final browser = _findBrowser();
  final tmp = Directory.systemTemp.createTempSync('elite_brand');

  for (final (name, w, h, bg, color, wordmarkWidth) in _targets) {
    final html = File('${tmp.path}$sep$name.html')
      ..writeAsStringSync(
        '<!doctype html><html><head><style>html,body{margin:0;width:${w}px;height:${h}px;background:$bg;'
        'overflow:hidden}.c{width:${w}px;height:${h}px;display:flex;align-items:center;justify-content:center;'
        'color:$color}.w{width:${wordmarkWidth}px}</style></head><body><div class="c"><div class="w">$svg'
        '</div></div></body></html>',
      );
    final out = '$root${sep}assets${sep}brand$sep$name.png';
    final result = await Process.run(browser, [
      '--headless=new',
      '--disable-gpu',
      '--hide-scrollbars',
      '--force-device-scale-factor=1',
      '--default-background-color=00000000',
      '--window-size=$w,$h',
      '--screenshot=$out',
      html.uri.toString(),
    ]);
    if (!File(out).existsSync()) {
      stderr.writeln('Failed to render $name: ${result.stderr}');
      exit(1);
    }
    stdout.writeln('  rendered assets/brand/$name.png (${w}x$h)');
  }
  tmp.deleteSync(recursive: true);
}

String _findBrowser() {
  final candidates = [
    Platform.environment['BROWSER_PATH'],
    r'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe',
    r'C:\Program Files\Microsoft\Edge\Application\msedge.exe',
    r'C:\Program Files\Google\Chrome\Application\chrome.exe',
    '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    '/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge',
  ];
  for (final c in candidates) {
    if (c != null && c.isNotEmpty && File(c).existsSync()) return c;
  }
  stderr.writeln('No Edge/Chrome found. Set \$env:BROWSER_PATH.');
  exit(2);
}
