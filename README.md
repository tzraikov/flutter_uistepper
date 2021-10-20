## Flutter UIStepper widget

A widget for incrementing or decrementing a value by using +/- buttons. This is a Flutter implementation of the [UIStepper](https://developer.apple.com/documentation/uikit/uistepper) control found in Apple iOS UIKit.

![Image 1](https://github.com/tzraikov/flutter_uistepper/raw/main/screenshots/1.png "Image 1")

## Usage

First import it in your Dart code:

```dart
import 'package:uistepper/uistepper.dart';
```

Instantinate it in your **build** method and use a **double** property to store its value:

```dart
double stepperValue = 1;
//...
UIStepper(
    value: stepperValue, 
    onChanged: (value) { setState(() => stepperValue = value); }
);
```

Specify minimum and maximum values by using the corresponding **minimumValue** and **maximumValue** properties. The increment/decrement step is determined by the **stepValue** property, The **wraps** property indicates whether to wrap the current value to its minumum or maximum values when using **stepValue** different than **1**:

```dart
UIStepper(
    value: stepperValue, 
    minumumValue: 1,
    maximumValue: 100,
    stepValue: 5,
    wraps: true,
    onChanged: (value) { setState(() => stepperValue = value); }
);
```

You can customize various attributes, for example the **tintColor** property sets +/- button color and the **showLabel** property determines whether to show or not the label:

```dart
UIStepper(
    value: stepperValue, 
    tintColor: Colors.red,
    showLabel: false,
    onChanged: (value) { setState(() => stepperValue = value); }
);
```
