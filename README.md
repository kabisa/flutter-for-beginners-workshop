# Flutter for beginners workshop

In this repository you will find both the exercise and (a possible) solution. For this workshop you will mainly work on files in the [presentation](lib/presentation/) folder. In here you will find both a [solution](lib/presentation//solution/) and an [exercise](lib/presentation/exercise/) folder.

You will start in the exercise folder but you are free to take a peek at the solution files as well.

## Getting Started

```
git clone https://github.com/kabisa/flutter-for-beginners-workshop.git
cd flutter-for-beginners-workshop/
```

### Exercise 1: Transaction card

The first User Story on our backlog is the following:

> As a user, I want to see a Kudo transaction, so that I display Kudos given and received

The designer sent you a mockup:

![Kudo Transaction](/assets/transaction_card.png)

Together with the team, you discussed, that you'll need the following Flutter widgets:

* [Card](https://api.flutter.dev/flutter/material/Card-class.html)
* [Circle Avatar](https://api.flutter.dev/flutter/material/CircleAvatar-class.html),
* [NetworkImage](https://api.flutter.dev/flutter/painting/NetworkImage-class.html)
* [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
* [Container](https://api.flutter.dev/flutter/widgets/Container-class.html),
* [Row](https://api.flutter.dev/flutter/widgets/Row-class.html),
* [Column](https://api.flutter.dev/flutter/widgets/Column-class.html),
* [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html),

You can implement the transaction card widget in [lib/presentation/exercise/widgets/transaction_card.dart](lib/presentation/exercise/widgets/transaction_card.dart).

<details>
  <summary>Solution</summary>

  * [Transaction Card](lib/presentation/solution/widgets/transaction_card.dart)
</details>

---

### Exercise 2: Transaction Feed

Next on the backlog is the following story:

> As a user, I want to see a Kudo transaction feed, so that I see a list of Kudos given.

The whole thing should look like this:

![Kudo Transactions Feed](/assets/transaction_feed.png "Kudo Transactions Feed")

To ship this feature, you will only need this Flutter widget:

* [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)

The [Transactions](lib/domain/transaction.dart) class contains some mock data you can use:

```dart
Transaction.dummyTransactions
```

* You can start implementing the ListView in [/lib/presentation/exercise/widgets/transaction_list.dart](/lib/presentation/exercise/widgets/transaction_list.dart).
* To show the widget, make sure you add it in [/lib/presentation/exercise/home_screen.dart](/lib/presentation/exercise/home_screen.dart).

<details>
  <summary>Solution</summary>

  * [Transaction List](/lib/presentation/solution/widgets/transaction_list.dart)
</details>
<br/>
<details>
  <summary>If you're feeling adventurous</summary>

Have a look at [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html) or [ListView.separated](https://api.flutter.dev/flutter/widgets/ListView/ListView.separated.html).
</details>

---
### Exercise 3: Transaction Form

Great, we can nicely display Kudo transactions!

Now let's make sure we can send Kudos as well:

> As a user I want to send Kudo's to someone, to let them know my appreciation

The mockups show what we need to build:

![Floating Action Button](/assets/floating_action_button.png "Floating Action Button")
![Kudo Form](/assets/transaction_form.png "Transaction Form")
![Kudo Form Keyboard](/assets/transaction_form_keyboard.png "Transaction Form Keyboard")

Based on the mockup we will need the following Flutter widgets:

* [Form](https://api.flutter.dev/flutter/widgets/Form-class.html)
* [FormValidators](https://api.flutter.dev/flutter/widgets/FormFieldValidator.html)
* [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html)
* [TextInputFormatter](https://api.flutter.dev/flutter/services/TextInputFormatter-class.html)
* [InputDecoration](https://api.flutter.dev/flutter/material/InputDecoration-class.html)

For the field validations we've already some form field validators in [/lib/domain/transaction_validators.dart](/lib/domain/transaction_validators.dart)

You can start implementing the Kudo Form in [/lib/presentation/exercise/widgets/transaction_form.dart](/lib/presentation/exercise/widgets/transaction_form.dart).

<div style="background-color: #e7f8ff; color: #000; padding: 1em; margin-bottom: 1em;">ℹ️ <strong>Note:</strong> You don't have to implement _storing_ the new Transaction yet. If the form can be validated and submitting the form closes the page, you're done!</div>

<details>
  <summary>Solution</summary>

  * [Transaction Form](/lib/presentation/solution/widgets/transaction_form.dart)
</details>

---

### Exercise 4: Storing new transactions (in memory) and displaying them

To get the flow complete we need to implement one last requirement

> As a user, I want to save new transactions on submit and display them in the transaction feed

By now, your home screen should already have the ability to show a list of kudo transactions and a way to open the transaction form. Now it is time to save your newly created transactions in memory.

Refactor your widget from a [StatelessWidget] to a [StatefulWidget]. It is
time to start working with local state!

We haven't discussed navigation yet. To return data from the [showModalBottomSheet]
callback add the following to the callback when you submit your form to close the modal and return the transaction.
```dart
Navigator.of(context).pop(/*return your transaction here*/);
```

---

### Stretch exercises

Congratulations on making it this far! We've made a couple of additional exercises available for you.

#### Testing

Start learning to write widget tests for your application!

Have a look at the [docs](https://docs.flutter.dev/cookbook/testing/widget/introduction) or check out the example tests in the [test](/test/) folder.

#### Animations

Get started with [implicit animations](https://docs.flutter.dev/development/ui/animations/implicit-animations) or [hero animations](https://docs.flutter.dev/development/ui/animations/hero-animations)!

#### Global state management

Replace your current local state implementation with a state management solution like [provider](https://pub.dev/packages/provider). Add the dependency to your `pubspec.yaml` and get started!

