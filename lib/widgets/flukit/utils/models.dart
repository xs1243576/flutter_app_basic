import 'package:flukit/flukit.dart';
import '../package_src/lib/src/drag_sort_view.dart';

class ImageBean extends DragBean {
  ImageBean({
    this.originPath,
    this.middlePath,
    this.thumbPath,
    this.originalWidth,
    this.originalHeight,
  });

  /// origin picture file path.
  String originPath;

  /// middle picture file path.
  String middlePath;

  /// thumb picture file path.
  /// It is recommended to use a thumbnail picture，because the original picture is too large,
  /// it may cause repeated loading and cause flashing.
  String thumbPath;

  /// original image width.
  int originalWidth;

  /// original image height.
  int originalHeight;
}
