import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mypeltar/components/maintenance_tile.dart';
import 'package:mypeltar/models/maintenance.dart';

import '../services/maintenance_service.dart';

class MaintenanceAll extends StatelessWidget {
  String? token;
  MaintenanceAll({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MaintenanceService.getAll(token!),
      builder: (context, AsyncSnapshot<List<Maintenance>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: GestureDetector(
                      onTap: () {
                        context.push('/maintenance/detail',
                            extra: snapshot.data![index].id);
                      },
                      child: MaintenanceTile(
                        namaAset: snapshot.data![index].asset!.lokasi!.unit,
                        merkAset: snapshot.data![index].asset!.namaAsset,
                        lokasi: snapshot.data![index].asset!.codeAsset,
                      )));
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
