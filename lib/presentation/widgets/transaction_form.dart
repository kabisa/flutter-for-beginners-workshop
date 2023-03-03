import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction_validators.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int? kudos;
    String? receivers;
    String? message;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
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
              onSaved: (value) => kudos = int.tryParse(value!),
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
                onSaved: (value) => receivers = value,
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
                onSaved: (value) => message = value,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  _formKey.currentState!.save();

                  Navigator.of(context).pop(
                    Transaction(
                      kudos: kudos!,
                      fromName: 'Me',
                      toName: receivers!,
                      note: message!,
                      createdAt: DateTime.now(),
                    ),
                  );
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
