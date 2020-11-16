import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../app_bar.dart';

class HeroExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Hero Example",
            showGoBack: true,
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HeroPhotoViewWrapper(
                        imageProvider: AssetImage("assets/large-image.jpg"),
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Hero(
                    tag: "someTag",
                    child: Image.asset("assets/large-image.jpg", width: 150.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeroPhotoViewWrapper extends StatelessWidget {
  const HeroPhotoViewWrapper({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        loadingBuilder: loadingBuilder,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}
