import 'package:flutter/foundation.dart';

class PageViewHolder extends ChangeNotifier {
  double page;

  PageViewHolder({required this.page});

  void setPage(double v) {
    page = v;
    notifyListeners();
  }
}
