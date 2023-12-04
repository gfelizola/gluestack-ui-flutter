import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Value groupValue = Value.one;
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  GSSizes selectedSizeOption = GSSizes.$md;
  bool isDisabled = false;
  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  bool isReadOnly = false;
  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  bool isInvalid = false;
  void updateIsInvalid(bool value) {
    setState(() {
      isInvalid = value;
    });
  }

  bool isRequired = false;
  void updateIsRequired(bool value) {
    setState(() {
      isRequired = value;
    });
  }

  static const sp = SizedBox(height: 4);
  static const sp2 = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    var code = '''GSButton(
                action: GSActions.primary,
                variant: GSVariants.solid,
                size: GSSize.\$md,
                isDisabled: false,
                isFocusVisible: false,
                onPressed: () {},
                child: const Row(
                  children: [
                    GSButtonText(text: "Add"),
                    GSButtonIcon(icon: Icons.add)
                  ],
                ),
              )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Control"),
      ),
      body: BaseLayout(
        code: code,
        component: GSFormControl(
          key: _formKey,
          isRequired: isRequired,
          isInvalid: isInvalid,
          isReadOnly: isReadOnly,
          isDisabled: isDisabled,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GSFormLabelText('Username'),
                sp,
                GSInput(
                  initialValue: "GlueStacky",
                  hintText: 'Enter your username here... | Ex. John Doe',
                ),
                sp2,
                GSFormLabelText('Password'),
                sp,
                GSInput(
                  style: GSStyle(height: 80),
                  obscureText: true,
                  hintText: 'Enter you password here...',
                  validator: (input) {
                    if (input != null && (input as String).length < 8) {
                      return "Password must have atleast 8 characters!";
                    }
                    return null;
                  },
                ),
                sp2,
                //TEXTAREA---------------------
                GSFormLabelText('Bio'),
                sp,
                GSTextArea(
                  size: GSSizes.$md,
                  hintText: "Enter a bio describing yourself here....",
                ),
                GSFormHelperText('Ex. Hey guys, I am ___ and I love doing ___'),

                sp2,
                //CHECKBOX------------------------
                GSFormLabelText('Choose your hobbies'),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon(),
                  ),
                  value: "Singing",
                  onChanged: (value) {},
                  label: const GSCheckBoxLabel(text: "Singing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon(),
                  ),
                  value: "Dancing",
                  onChanged: (value) {},
                  label: const GSCheckBoxLabel(text: "Dancing"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon(),
                  ),
                  value: "Sports",
                  onChanged: (value) {},
                  label: const GSCheckBoxLabel(text: "Sports"),
                ),
                sp,
                GSCheckBox(
                  icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon(),
                  ),
                  value: "Driving",
                  onChanged: (value) {},
                  label: const GSCheckBoxLabel(text: "Driving"),
                ),
                sp2,
                //RADIO---------------------------
                GSFormLabelText('Choose a group', isRequired: false),
                sp,
                GSRadio<Value>(
                  value: Value.one,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon: const GSRadioIcon<Value>(),
                  label: const GSRadioText<Value>(text: 'Capitalist'),
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp,
                GSRadio<Value>(
                  value: Value.four,
                  groupValue: groupValue,
                  onChanged: (p0) {
                    setState(() {
                      groupValue = p0!;
                    });
                  },
                  icon: const GSRadioIcon<Value>(),
                  label: const GSRadioText<Value>(text: 'Communist'),
                  style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2)),
                ),
                sp2,
                sp2,
                GSButton(
                    action: GSActions.positive,
                    variant: GSVariants.outline,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      _formKey.currentState?.validate();
                    }),
              ],
            ),
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isInvalid",
              value: isInvalid,
              onToggle: updateIsInvalid,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReadOnly",
              value: isReadOnly,
              onToggle: updateIsReadOnly,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isRequired",
              value: isRequired,
              onToggle: updateIsRequired,
            ),
          ],
        ),
      ),
    );
  }
}
