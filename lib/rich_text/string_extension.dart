import 'package:flutter/material.dart';
class MFRichTextPart {
  int start;
  int end;
  String value;
  bool match = false; // 命中正则

  MFRichTextPart({this.start = 0, this.end = 0, this.value = "", this.match = false});

  @override
  String toString() {
    return "start:${this.start}, end:${this.end}, value:${this.value}";
  }
}


const _NormalRegulation = r'#_\$.+?#_\$';
extension RichTextPart on String {
  List<MFRichTextPart> get classicsStyleRichTextPartList {
    return richTextPartList(_NormalRegulation);
  }

  List<MFRichTextPart> richTextPartList(String regulation) {
    assert(regulation != null);

    if (this.isEmpty) {
      return [];
    }

    if (regulation.isEmpty) {
      return [MFRichTextPart(start: 0, end: this.length, value: this)];
    }

    List<RegExpMatch> regList = RegExp(regulation).allMatches(this).toList();
    if (regList.isEmpty) {
      return [MFRichTextPart(start: 0, end: this.length, value: this)];
    }

    List<MFRichTextPart> modelList = [];
    for (var i = 0; i < regList.length; i++) {
      RegExpMatch item = regList[i];
      modelList.add(MFRichTextPart(
          start: item.start, end: item.end, value: item.group(0), match: true));
    }

    for (int i = 0; i < regList.length; i++) {
      RegExpMatch item = regList[i];
      int start = 0;
      int end = 0;
      if (i == 0) {
        if (item.start != 0) {
          start = 0;
          end = item.start;
        } else {
          continue;
        }
      } else {
        start = regList[i - 1].end;
        end = item.start;
      }
      String value = this.substring(start, end);
      MFRichTextPart model =
      MFRichTextPart(start: start, end: end, value: value);
      modelList.add(model);
    }

    modelList.sort((e1, e2) {
      return e1.start.compareTo(e2.start);
    });

    if (modelList.last.end < this.length) {
      modelList.add(MFRichTextPart(
          start: modelList.last.end,
          end: this.length,
          value: this.substring(modelList.last.end, this.length)));
    }

    return modelList;
  }
}

extension MFRichText on String {
  List<TextSpan> classicsStyleTextSpanList(TextStyle normalStyle, {TextStyle specialStyle}) {
    assert(normalStyle != null);
    List<TextSpan> spans = [];
    List<MFRichTextPart> parts = this.classicsStyleRichTextPartList;
    for (MFRichTextPart part in parts) {
      if (part.match) {
        spans.add(TextSpan(
          text: part.value.replaceAll(r'#_$', ''),
          style: specialStyle ?? normalStyle.copyWith(color: Color(0xFFFF4891)),
        ));
      } else {
        spans.add(TextSpan(text: part.value, style: normalStyle));
      }
    }
    return spans;
  }
}