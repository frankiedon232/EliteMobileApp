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

/// Splash "touch": three pastel dots under the wordmark (mint, lavender, peach — the category tiles).
const _dotColors = ['#7FD9C4', '#8B7CF6', '#FFB595'];

/// A rendered PNG: canvas size, background, wordmark colour and width, optional round badge behind the
/// wordmark (colour), optional pastel dots.
typedef _Target = ({
  String name,
  int w,
  int h,
  String bg,
  String color,
  int wordmark,
  String? circle,
  bool dots,
});

const List<_Target> _targets = [
  // Launcher icon: brand navy (unchanged).
  (name: 'app_icon', w: 1024, h: 1024, bg: _navy, color: _white, wordmark: 720, circle: null, dots: false),
  (
    name: 'app_icon_foreground',
    w: 1024,
    h: 1024,
    bg: 'transparent',
    color: _white,
    wordmark: 560,
    circle: null,
    dots: false,
  ),
  // Splash (pre-Android-12 + iOS): wordmark in a round badge on the pastel canvas, light and dark.
  (
    name: 'splash_light',
    w: 720,
    h: 720,
    bg: 'transparent',
    color: _navy,
    wordmark: 330,
    circle: '#FFFFFF',
    dots: true,
  ),
  (
    name: 'splash_dark',
    w: 720,
    h: 720,
    bg: 'transparent',
    color: _white,
    wordmark: 330,
    circle: '#191A23',
    dots: true,
  ),
  // Android 12+: the system draws the round badge (icon_background_color); the image is its content.
  (
    name: 'splash_android12_light',
    w: 960,
    h: 960,
    bg: 'transparent',
    color: _navy,
    wordmark: 440,
    circle: null,
    dots: true,
  ),
  (
    name: 'splash_android12_dark',
    w: 960,
    h: 960,
    bg: 'transparent',
    color: _white,
    wordmark: 440,
    circle: null,
    dots: true,
  ),
];

Future<void> main() async {
  final root = File.fromUri(Platform.script).parent.parent.path;
  final sep = Platform.pathSeparator;
  final svgFile = File('$root${sep}assets${sep}brand${sep}elite_wordmark.svg');
  final svg = svgFile.readAsStringSync().replaceFirst('<svg ', '<svg style="width:100%;display:block" ');
  final browser = _findBrowser();
  final tmp = Directory.systemTemp.createTempSync('elite_brand');

  for (final t in _targets) {
    final (
      name: name,
      w: w,
      h: h,
      bg: bg,
      color: color,
      wordmark: wordmarkWidth,
      circle: circle,
      dots: dots,
    ) = t;
    final dot = (wordmarkWidth * 0.075).round();
    final dotsHtml = dots
        ? '<div style="display:flex;gap:${(dot * 0.8).round()}px;justify-content:center;margin-top:${dot * 2}px">'
              '${_dotColors.map((c) => '<i style="width:${dot}px;height:${dot}px;border-radius:50%;background:$c"></i>').join()}'
              '</div>'
        : '';
    final badge = circle == null
        ? ''
        : 'width:${(w * 0.88).round()}px;height:${(h * 0.88).round()}px;border-radius:50%;background:$circle;'
              'box-shadow:0 ${(w * 0.02).round()}px ${(w * 0.06).round()}px rgba(40,32,90,.12);';
    final html = File('${tmp.path}$sep$name.html')
      ..writeAsStringSync(
        '<!doctype html><html><head><style>html,body{margin:0;width:${w}px;height:${h}px;background:$bg;'
        'overflow:hidden}.c{width:${w}px;height:${h}px;display:flex;align-items:center;justify-content:center}'
        '.b{display:flex;flex-direction:column;align-items:center;justify-content:center;$badge}'
        '.w{width:${wordmarkWidth}px;color:$color}</style></head><body><div class="c"><div class="b">'
        '<div class="w">$svg</div>$dotsHtml</div></div></body></html>',
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
