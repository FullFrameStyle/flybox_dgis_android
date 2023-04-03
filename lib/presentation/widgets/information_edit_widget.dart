import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/constants/values.dart';

class InformationEditWidget extends StatefulWidget {
  final String name;
  final String value;
  final bool infomationValue;
  final bool last;
  final Function()? onTap;
  final Widget? rightWidget;

  const InformationEditWidget({
    super.key,
    required this.name,
    required this.value,
    this.last = false,
    this.rightWidget,
    this.infomationValue = false,
    this.onTap,
  });

  @override
  State<InformationEditWidget> createState() => _InformationEditWidgetState();
}

class _InformationEditWidgetState extends State<InformationEditWidget> {
  bool isEditable = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ??
          () => showDialog(
                context: context,
                builder: (context) => WillPopScope(
                  onWillPop: () async {
                    Navigator.of(context).pop();
                    return false;
                  },
                  child: AlertDialog(
                    elevation: 0,
                    title: Text(widget.name),
                    content: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(16),
                        labelText: widget.name,
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => context.pop(),
                          child: const Text('Назад')),
                      FilledButton(
                          onPressed: () {}, child: const Text('Сохранить'))
                    ],
                  ),
                ),
              ),
      child: Container(
        decoration: BoxDecoration(
          border: !widget.last
              ? Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                  ),
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: h3,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      widget.value,
                      style: TextStyle(
                        fontSize: h3,
                        color: widget.infomationValue
                            ? Theme.of(context).colorScheme.secondary
                            : null,
                      ),
                    )
                  ],
                ),
              ),
              widget.rightWidget ?? const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
