import 'package:flutter_application_1/controal/data.dart';
import 'package:flutter_application_1/view/note-page.dart';

Data da = Data();
List<NotePage> search = [];

void addsearch(String se) {
  for (int i = 0; i < da.data.length; i++) {
    if (da.data[i].title.text == se) {
      search.add(da.data[i]);
    }
  }
}
