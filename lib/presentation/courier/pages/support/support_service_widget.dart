import 'package:flutter/material.dart';
import 'package:flybox/data/constants/values.dart';

class SupportServiceWidget extends StatelessWidget {
  const SupportServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Служба поддержки",
          style: TextStyle(
            fontSize: pageTitle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          const Divider(
            height: 0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50, maxHeight: 70),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 4,
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: Transform.rotate(
                      angle: 0.785,
                      child: const Icon(
                        Icons.attach_file_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      hintText: 'Сообщение',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: defaultPadding / 2,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 4,
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
