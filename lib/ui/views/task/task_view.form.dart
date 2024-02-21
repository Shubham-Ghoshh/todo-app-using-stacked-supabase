// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';

final Map<String, TextEditingController> _TaskViewTextEditingControllers = {};

final Map<String, FocusNode> _TaskViewFocusNodes = {};

final Map<String, String? Function(String?)?> _TaskViewTextValidations = {
  NameValueKey: null,
  DescriptionValueKey: null,
};

mixin $TaskView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TaskViewTextEditingControllers.containsKey(key)) {
      return _TaskViewTextEditingControllers[key]!;
    }

    _TaskViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TaskViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TaskViewFocusNodes.containsKey(key)) {
      return _TaskViewFocusNodes[key]!;
    }
    _TaskViewFocusNodes[key] = FocusNode();
    return _TaskViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          DescriptionValueKey: descriptionController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _TaskViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TaskViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TaskViewTextEditingControllers.clear();
    _TaskViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_TaskViewTextEditingControllers.containsKey(NameValueKey)) {
      _TaskViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_TaskViewTextEditingControllers.containsKey(DescriptionValueKey)) {
      _TaskViewTextEditingControllers[DescriptionValueKey]?.text = value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    descriptionValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TaskViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TaskViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
