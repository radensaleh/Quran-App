## Quran App
![GitHub stars](https://img.shields.io/github/stars/radensaleh/Quran-App?style=social)
![GitHub forks](https://img.shields.io/github/forks/radensaleh/Quran-App?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/radensaleh/Quran-App?style=social)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/radensaleh/Quran-App/blob/master/LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/radensaleh/Quran-App)

## Features
*  Show All Surah
*  Last Read Surah
*  Detail Surah & Verses
*  Bookmark Verses
*  Play Audio Verses
*  Dark Theme Mode

## Banner Design
<pre>
<img src="assets/banner/quran_app_dark_theme.png">

<img src="assets/banner/quran_app_light_theme.png">
</pre>

## Quick start
This is a normal flutter app. You should follow the instructions in the [official documentation](https://flutter.io/docs/get-started/install).
This project uses **BLoC** (business logic component) to separate the business logic with UI itself.
It's recommended to do self-study about it before jumping into the project [here](https://bloclibrary.dev/).
And also on this project uses **Modularization** approach to separate each feature ([domains](https://github.com/radensaleh/Quran-App/tree/master/domains/quran), [features](https://github.com/radensaleh/Quran-App/tree/master/features), [resources](https://github.com/radensaleh/Quran-App/tree/master/resources/resources), [shared_libraries](https://github.com/radensaleh/Quran-App/tree/master/shared_libraries) modules).

## Modularization Structure 🔥

    # Root Project
    .
    ├── domains                # Name of directory
    |   ├── domain A           # Domains module with a data and domains layer inside it.
    |   ├── domain B
    |   └── domain etc
    |
    ├── features               # Name of directory
    |   ├── feature A          # Feature module with a presentation/ui/feature layer inside it.
    |   ├── feature B
    |   └── feature etc
    |
    ├── lib                    # Name of module (default from Flutter)
    |
    └── resources              # Name of directory
    |       └── resources      # Handle resources like style, fonts, constant value, etc.
    |
    └── shared_libraries       # Name of directory
        ├── common             # Handle common utility class.
        ├── core               # Core module.
        └── dependencies       # Handle dependency version updates.

### Resources 🔥

* [Sample Demo](https://drive.google.com/file/d/1zna9SXSzV0aXApUT6pwGHJBZ8FWbSGyN/view?usp=share_link)
* [API Source](https://github.com/gadingnst/quran-api)
* [Design Reference](https://www.figma.com/community/file/966921639679380402)

## Built With 🛠
* [Modularization](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a) - Separate functionality into independent, interchangeable modules.
* [Clean Architecture](https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0) - The blueprint for a modular system, which strictly follows the design principle called separation of concerns.
* [Dependency Injection (get_it)](https://pub.dev/packages/get_it) - Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.
* [BLoC Pattern](https://bloclibrary.dev/) - Business logic component to separate the business logic with UI.
* [SQLite](https://pub.dev/packages/sqflite) - Local Database
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator.
* [Dio](https://github.com/flutterchina/dio/) - A type-safe HTTP client.
* [Shared Preferences](https://pub.dev/packages/shared_preferences) - Cache implementation approach.
* [Provider](https://pub.dev/packages/provider) - A wrapper around InheritedWidget to make them easier to use and more reusable.
* [Flash](https://pub.dev/packages/flash) - A highly customizable, powerful and easy-to-use alerting library.
* [Just Audio](https://pub.dev/packages/just_audio) - A feature-rich audio player for Flutter.
* Handle State - (Loading, No Data, Has Data, Error)

## Author

* **Raden Saleh**

Don't forget to follow me, fork and give me a ⭐


## License

```
MIT License

Copyright (c) 2022 Raden Saleh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```