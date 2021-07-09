### Persian and gregorian time and date pickers in Flutter.
###### LIGHTWEIGHT - SIMPLE

---
<img src="https://github.com/gabrimatic/persian_datetimepickers/raw/master/example/time.png" width="320"/> <img src="https://github.com/gabrimatic/persian_datetimepickers/raw/master/example/date.png" width="320"/>

#### How to use it?

---
**1.  Add the package to pubspec.yaml dependency:**

```yaml
dependencies:
  persian_datetimepickers: ^1.0.1
```

**2. Import package:**

```dart
import 'package:persian_datetimepickers/persian_datetimepickers.dart';
```

**3. Call the pickers where ever you want:**

```dart
          onTap: () async {
		  // Time picker
            final time = await showPersianTimePicker(
              context: context,
            );

            setState(() {
              _pickedTime = time;
            });
			
			
			// Date picker
            final date = await showPersianDatePicker(
              context: context,
            );

            setState(() {
              _pickedDate = date;
            });
          },
		  
```