import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, type }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

    String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == EmailError.empty) return "Campo Requerido";
    if(displayError == EmailError.type) return "Formato de Email incorrecto";
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
   if (value.isEmpty) return EmailError.empty;
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if(!emailRegExp.hasMatch(value)) return EmailError.type;
    return null;
  }
}