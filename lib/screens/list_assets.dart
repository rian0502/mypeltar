import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mypeltar/components/asset_tile.dart';
import 'package:mypeltar/services/assets_services.dart';
import '../models/assets.dart';

class ListAssets extends StatelessWidget {
  String? token;
  ListAssets({Key? key,  this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AssetsServices.getAll(token!, '1'),
      builder: (BuildContext context, AsyncSnapshot<Assets> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.asset!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context.pushNamed('/detail-asset',
                      extra: snapshot.data!.asset![index].id.toString());
                },
                child: Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: AssetTile(
                      namaAset: snapshot.data!.asset![index].namaAsset,
                      merkAset: snapshot.data!.asset![index].merk,
                      lokasi: snapshot.data!.asset![index].lokasi!.unit,
                    )),
              );
            },
          );
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
