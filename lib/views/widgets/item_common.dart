import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lib/model/account.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/resources/image_name.dart';
class AutoCompleteSearchMasterData extends StatefulWidget {
  final String hintText;
  final double? height;
  final void Function(Account value)? onChange;
  final List<Account> data;
  final Account? initValue;
  final bool clearData;

  const AutoCompleteSearchMasterData(
      {Key? key,
      this.hintText = "",
      this.height,
      this.onChange,
      required this.data,
      this.clearData = false,
      this.initValue})
      : super(key: key);

  @override
  _AutoCompleteSearchMasterDataState createState() =>
      _AutoCompleteSearchMasterDataState();
}

class _AutoCompleteSearchMasterDataState
    extends State<AutoCompleteSearchMasterData> {
  String _displayStringForOption(Account option) => option.fullName!;
  bool firstRun = true;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Account>(
        displayStringForOption: _displayStringForOption,
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return _searchWidget(
              context: context,
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              value: widget.initValue?.fullName,
              clearData: widget.clearData);
        },
        optionsViewBuilder: optionView,
        optionsBuilder: (TextEditingValue textEditingValue) {
          return widget.data.where((Account option) {
            return option.fullName!
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: widget.onChange);
  }

  Widget _searchWidget(
      {required BuildContext context,
      required TextEditingController controller,
      required FocusNode focusNode,
      String? value,
      bool clearData = false}) {
    if (firstRun && value != null) {
      controller.text = value;
    }
    if (clearData) {
      controller.text = "";
      focusNode.unfocus();
      clearData = false;
    }
    if (firstRun) firstRun = false;
    return SizedBox(
      height: widget.height ?? 56,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.green),
              borderRadius: BorderRadius.circular(4)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  Widget optionView(
      BuildContext context,
      void Function(Account value) onSelected,
      Iterable<Account> options) {
    return ColoredBox(
      color: AppColors.white,
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 200),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onSelected(options.elementAt(index));
                  },
                  child: SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            options.elementAt(index).fullName!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.gray2,
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}

class AutoCompleteSearchLocation extends StatefulWidget {
  final String hintText;
  final double? height;
  final void Function(Account value)? onChange;
  final List<Account> data;
  final String? initValue;

  const AutoCompleteSearchLocation(
      {Key? key,
      this.hintText = "",
      this.height,
      this.onChange,
      required this.data,
      this.initValue})
      : super(key: key);

  @override
  _AutoCompleteSearchLocationState createState() =>
      _AutoCompleteSearchLocationState();
}

class _AutoCompleteSearchLocationState
    extends State<AutoCompleteSearchLocation> {
  String _displayStringForOption(Account option) => option.fullName!;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Account>(
        displayStringForOption: _displayStringForOption,
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return _searchWidget(
              context: context,
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              value: widget.initValue);
        },
        optionsViewBuilder: optionView,
        optionsBuilder: (TextEditingValue textEditingValue) {
          return widget.data.where((Account option) {
            return option.fullName!
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          }).skip(10);
        },
        onSelected: widget.onChange);
  }

  Widget _searchWidget(
      {required BuildContext context,
      required TextEditingController controller,
      required FocusNode focusNode,
      String? value}) {
    return SizedBox(
      height: widget.height ?? 56,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        // onChanged: onChange,
        initialValue: value,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray4),
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  Widget optionView(
      BuildContext context,
      void Function(Account value) onSelected,
      Iterable<Account> options) {
    return ColoredBox(
      color: AppColors.white,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 200),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onSelected(options.elementAt(index));
              },
              child: SizedBox(
                height: 44,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        options.elementAt(index).fullName!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.gray4,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class SelectedWidget extends StatefulWidget {
  final String hintText;
  final double? height;
  final List<Account>? data;
  final void Function(Account value) onChange;
  final void Function(String value)? validator;

  const SelectedWidget(
      {Key? key,
      required this.hintText,
      this.height,
      this.data,
      required this.onChange,
      this.validator})
      : super(key: key);

  @override
  _SelectedWidgetState createState() => _SelectedWidgetState();
}

class _SelectedWidgetState extends State<SelectedWidget> {
  Account? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Account>(
      items: widget.data?.map<DropdownMenuItem<Account>>((Account model) {
        return DropdownMenuItem<Account>(
          value: model,
          child: Text(model.fullName ?? ""),
        );
      }).toList(),
      value: _dropdownValue,
      icon: const Icon(Icons.expand_less, size: 24,),
      hint: Text(widget.hintText),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (Account? newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
        widget.onChange(newValue!);
      },
    );
  }
}

void showWarning({required BuildContext context, String message = ''}) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
