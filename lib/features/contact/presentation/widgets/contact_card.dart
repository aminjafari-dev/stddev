import 'package:flutter/material.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/config/image_path.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';

import '../../domain/entities/contact_entity.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.data, required this.onTap});
  final ContactEntity data;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: GeneralConfig.hor_10,
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                    borderRadius: GeneralConfig.radius_50,
                    child: data.picture == null || data.picture!.isEmpty
                        ? Image.asset(ImagePath.std)
                        : FadeInImage(
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            placeholder: AssetImage(ImagePath.loading),
                            image: NetworkImage(
                              data.picture!.first,
                            ),
                          )
                    ),
              ),
              STDSizedBox.width_8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(data.firstName ?? ""),
                  Text(data.phone ?? ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
