import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ChangeNotifierProvider(
        create: (_) => GoodsListProvider(),
        child: Selector<GoodsListProvider, GoodsListProvider>(
          shouldRebuild: (pre, next) => false,
          selector: (context, provider) => provider,
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.total,
              itemBuilder: (context, index) {
                return Selector<GoodsListProvider, Goods>(
                  selector: (context, provider) => provider.goodsList[index],
                    shouldRebuild:(pre, next) {
                    return pre != next;
                  },
                  builder: (context, data, child) {
                    print(('index ${index + 1} rebuild'));
                    return ListTile(
                      title: Text(data.goodsName),
                      trailing: GestureDetector(
                        onTap: () => provider.collect(index),
                        child: Icon(
                            data.isCollection ? Icons.star : Icons.star_border),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Goods {

  String goodsName = "";
  bool isCollection = false;

  Goods(this.goodsName, this.isCollection);

  @override
  String toString() {
    return "goodsName: $goodsName, isCollection: $isCollection";
  }
}

class GoodsListProvider extends ChangeNotifier {
  final List<Goods> _goodsList =
  List.generate(20, (index) => Goods("index is $index", false));

  List<Goods> get goodsList => _goodsList;
  int get total => _goodsList.length;

  void collect(int index) {
    var good = _goodsList[index];
    _goodsList[index] = Goods(good.goodsName, !good.isCollection);
    notifyListeners();
  }
}