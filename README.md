# Simple Note App 
I built this app with the sole purpose of learning how to do the declarative approach in building UI using the Flutter framework, while also incorporating recommended libraries. The note app offers simple features such as adding, updating, and deleting notes, but I also included a priority feature to help you identify which notes are most important. The app also follows a clean architecture, with separate UI and data layers.

<table>
  <tr>
     <td>Preview</td>
  </tr>
  <tr>
    <td><img src="https://github.com/gusentanan/snote-app/assets/68723002/38bcf74d-101e-46ef-aa90-3f525f784144" width=270 ></td>
  </tr>
 </table>


## Project Environment
```
Flutter version 3.7.11 • Upstream repository https://github.com/flutter/flutter.git
Framework revision f72efea43c (2 months ago), 2023-04-11 11:57:21 -0700
Engine revision 1a65d409c7 • Dart version 2.19.6
```

## Architecture 
The architecture of this app is following the
[Clean Architecture](https://medium.com/@paulallies/clean-architecture-flutter-app-45e535539981) which strictly emphasizes a clear separation of concerns through distinct architectural layers: Presentation/UI layer, Domain layer, and Data layer. This separation facilitates writing tests without dependencies on external frameworks or UI components.

## Tech Stack
| Dependencies          | Description                                                                                            |
|---------------------  |------------------------------------------------------------------------------------------------------- |
|`BloC`                 | make it easier to manage and update the state of an app in response to user interaction or other events|
|`sqflite`              | for local database processing.                                                                         |
|`dartz`                | null safety management.                                                                                |
|`equatable`            | simplify the process of implementing equality checks between objects.                                  |
|`get_it`               | for managing dependencies accross the app                                                              |
| `flutter_smart_dialog`| To make it easier to create custom dialog boxes and toast messages.                                    |

## How to run
Clone this repository and make sure flutter is installed on your machine
- In the project directory get the project dependencies using below command.
  
  ```sh
   flutter pub get
  ```
- Run the project using:
  
  ```sh
   flutter run
  ```

## Hope you found this useful. ⭐ 

