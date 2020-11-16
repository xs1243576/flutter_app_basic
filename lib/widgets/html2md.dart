import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html2md/html2md.dart' as html2md;

///
/// des:
///

class Html2mdApp extends StatefulWidget {
  @override
  _Html2mdState createState() => new _Html2mdState();
}

class _Html2mdState extends State<Html2mdApp> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    String html = '''<h1>HTML2MD Demo</h1>

<p>This demonstrates <a href="https://github.com/jarontai/html2md">html2md</a> – an HTML to Markdown converter in Dart.</p>

<h2>Usage</h2>

<pre><code class="language-dart">import 'package:html2md/html2md.dart' as html2md;
void main() {
  print(html2md.convert('&lt;h1&gt;Hello world&lt;/h1&gt;'));
}</code></pre>

<hr />

<p>It aims to be <a href="http://commonmark.org/">CommonMark</a> compliant, and includes options to style the output. These options include:</p>

<ul>
  <li>headingStyle (setext or atx)</li>
  <li>horizontalRule (*, -, or _)</li>
  <li>bullet (*, -, or +)</li>
  <li>codeBlockStyle (indented or fenced)</li>
  <li>fence (` or ~)</li>
  <li>emDelimiter (_ or *)</li>
  <li>strongDelimiter (** or __)</li>
  <li>linkStyle (inlined or referenced)</li>
  <li>linkReferenceStyle (full, collapsed, or shortcut)</li>
</ul>''';
//    print(html2md.convert(html));

    String _markdownData = html2md.convert(html);

    return new MaterialApp(
      title: "Html2md Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Html2md Demo'),
        ),
        body: SafeArea(
          child: Markdown(
            controller: controller,
            selectable: true,
            data: _markdownData,
//            imageDirectory: 'https://raw.githubusercontent.com',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () => controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeOut),
        ),
      ),
    );
  }
}

