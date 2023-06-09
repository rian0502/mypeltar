import 'package:flutter/material.dart';
import 'package:mypeltar/components/maintenance_tile.dart';
import 'package:mypeltar/models/maintenance.dart';

import '../services/maintenance_service.dart';

class MaintenanceAll extends StatelessWidget {
  String? token;
  MaintenanceAll({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MaintenanceService.getAll(token!, 1),
      builder: (context, AsyncSnapshot<List<Maintenance>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: MaintenanceTile(
                  namaAset: snapshot.data![index].asset!.lokasi!.unit,
                  merkAset: snapshot.data![index].asset!.namaAsset,
                  lokasi: snapshot.data![index].asset!.codeAsset,
                ),
              );
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
