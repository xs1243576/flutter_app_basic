
extension StringExtension on String {
  //为String类扩展首字母大写方法
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}


