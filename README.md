### Persian and gregorian numeric time and date pickers in Flutter.
###### LIGHTWEIGHT - SIMPLE

---
<img src="https://github.com/gabrimatic/persian_datetimepickers/raw/master/example/time.png" width="320"/> <img src="https://github.com/gabrimatic/persian_datetimepickers/raw/master/example/date.png" width="320"/>

## How to use it?
**1.  Add the package to pubspec.yaml dependency:**

```yaml
dependencies:
  persian_datetimepickers: ^1.0.3
```

**2. Import package:**

```dart
import 'package:persian_datetimepickers/persian_datetimepickers.dart';
```

**3. Call the pickers where ever you want:**

```dart
          onTap: () async {
			// Time picker
            final TimeOfDay? time = await showPersianTimePicker(
              context: context,
            );

            setState(() {
              _pickedTime = time;
            });
			
			
			// Date picker
            final DateTime? date = await showPersianDatePicker(
              context: context,
            );

            setState(() {
              _pickedDate = date;
            });
          },
		  
```

## Developer
By [Hossein Yousefpour](https://gabrimatic.info "Hossein Yousefpour")

&copy; All rights reserved.

## Donate
* <a href="https://www.buymeacoffee.com/gabrimatic" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Book" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

OR

* ETH Address: **0xc2F103b11C5d7bE3Abe292EE549a3ba418655A0E**
