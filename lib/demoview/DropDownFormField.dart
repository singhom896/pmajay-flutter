library dropdown_formfield;

import 'package:flutter/material.dart';

import '../utills/CustomColor.dart';

class DropDownFormField extends FormField<dynamic>
{
  final bool onTabClick;
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;
  final BuildContext context;

  DropDownFormField({
    required this.onTabClick,
    required FormFieldSetter<dynamic> onSaved,
    required FormFieldValidator<dynamic> validator,
    AutovalidateMode autovalidate = AutovalidateMode.disabled,
    this.titleText = 'Title',
    this.hintText = 'Select one option',
    this.required = false,
    this.errorText = 'Please select one option',
    this.value,
    required this.dataSource,
    required this.textField,
    required this.valueField,
    required this.onChanged,
    this.filled = true,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0),
    required this.context,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return  Container(
              height: 65,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.green ?? Theme.of(context).dividerColor,
                    width: 1.0,

                  ),
                ),
              ),


              child: DropdownButtonHideUnderline(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      decoration: BoxDecoration(
                        color: CustomColor.drop_down_bg,
                        border: Border.all(color: CustomColor.drawer_bg, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),

                      ),
                      constraints: BoxConstraints(),
                      child: DropdownButton<dynamic>(
                        onTap: ()
                        {


                        },
                        isExpanded: true,
                        hint: Text(
                          hintText,
                          style: TextStyle(color: CustomColor.black_dark),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(item[textField],
                                overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        color: Colors.white,
                        child: RichText(
                          text: TextSpan(
                            text: titleText,
                            style: TextStyle(color: Colors.black),
                            /*defining default style is optional */
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
}
