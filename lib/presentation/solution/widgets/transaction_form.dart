import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction_validators.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  int? kudos;
  String? receivers;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                key: const ValueKey('kudos-text-field'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  icon: Icon(Icons.attach_money),
                  hintText: 'Amount of kudos',
                ),
                validator: TransactionValidators.greaterThan(0),
                onChanged: (value) => setState(
                  () => kudos = int.tryParse(value),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  key: const ValueKey('receivers-text-field'),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.people),
                    hintText: 'Receivers',
                  ),
                  validator: TransactionValidators.required,
                  onChanged: (value) => setState(() => receivers = value),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  key: const ValueKey('message-text-field'),
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Message',
                  ),
                  validator: TransactionValidators.required,
                  onChanged: (value) => setState(() => message = value),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () => _onSubmitPressed(
                    context,
                    kudos: kudos,
                    receivers: receivers,
                    message: message,
                  ),
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitPressed(
    BuildContext context, {
    required int? kudos,
    required String? receivers,
    required String? message,
  }) {
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) return;

    Navigator.of(context).pop(
      Transaction(
        kudos: kudos!,
        fromName: 'Me',
        toName: receivers!,
        note: message!,
        createdAt: DateTime.now(),
      ),
    );
  }
}
