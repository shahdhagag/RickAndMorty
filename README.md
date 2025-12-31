
---

# Cubit/Clean_Arch Practice – Rick & Morty App

A **Rick & Morty Flutter app** that displays characters from the official API. Users can **browse characters, search by name**, and view detailed character information. Built with **Cubit (BLoC), clean architecture**, and modern Flutter best practices.

---

## 📌 Features

* Fetch characters from the **Rick & Morty API**
* **Search characters** by name
* View **character details**
* Handles **offline mode** with `flutter_offline`
* **Skeleton loading** with `skeletonizer`
* Built using **Clean Architecture + Cubit**
* Fully responsive and user-friendly UI

---

## 🖼 Screenshots

<table> <tr> <td align="center"><b>Splash Screen</b><br> <img width="200" src="https://user-images.githubusercontent.com/phone-frame.png" style="position: relative;"> <br><img width="180" src="https://github.com/user-attachments/assets/ac0da173-d986-4ec1-9154-c887ad52420a" style="position: absolute; top:20px; left:10px;"></td> <td align="center"><b>Character List Page</b><br> <img width="200" src="https://user-images.githubusercontent.com/phone-frame.png"> <br><img width="180" src="https://github.com/user-attachments/assets/3901e94f-536b-48d5-a762-ca5cce521414"></td> </tr> <tr> <td align="center"><b>Character Details Page</b><br> <img width="200" src="https://user-images.githubusercontent.com/phone-frame.png"> <br><img width="180" src="https://github.com/user-attachments/assets/26f3dab5-b02c-4587-9fc2-f9d911d504b9"></td> <td align="center"><b>Search Page</b><br> <img width="200" src="https://user-images.githubusercontent.com/phone-frame.png"> <br><img width="180" src="https://github.com/user-attachments/assets/0a762333-5315-436a-80dd-e90009af36cb"></td> </tr> </table>





<table>
  <tr>
    <td><b>Splash Screen</b><br><img width="300" src="https://github.com/user-attachments/assets/ac0da173-d986-4ec1-9154-c887ad52420a" /></td>
    <td><b>Character List Page</b><br><img width="300" src="https://github.com/user-attachments/assets/3901e94f-536b-48d5-a762-ca5cce521414" /></td>
  </tr>
  <tr>
    <td><b>Character Details Page</b><br><img width="300" src="https://github.com/user-attachments/assets/26f3dab5-b02c-4587-9fc2-f9d911d504b9" /></td>
    <td><b>Search Page</b><br><img width="300" src="https://github.com/user-attachments/assets/0a762333-5315-436a-80dd-e90009af36cb" /></td>
  </tr>
</table>

---

## ⚙️ Packages Used

* [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) – State management with Cubit/BLoC
* [`flutter_offline`](https://pub.dev/packages/flutter_offline) – Detect offline/online status
* [`dio`](https://pub.dev/packages/dio) – HTTP requests
* [`logger`](https://pub.dev/packages/logger) – Logging
* [`pretty_dio_logger`](https://pub.dev/packages/pretty_dio_logger) – Dio logging
* [`json_annotation`](https://pub.dev/packages/json_annotation) – JSON serialization
* [`json_serializable`](https://pub.dev/packages/json_serializable) – Code generation for models
* [`freezed`](https://pub.dev/packages/freezed) – Immutable classes & union types
* [`freezed_annotation`](https://pub.dev/packages/freezed_annotation) – Annotations for Freezed
* [`equatable`](https://pub.dev/packages/equatable) – Value equality for models
* [`skeletonizer`](https://pub.dev/packages/skeletonizer) – Loading skeleton UI

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── api_services.dart
│   └── app_routes.dart
├── features/
│   └── characters/
│       ├── data/
│       │   ├── models/
│       │   └── datasources/
│       ├── domain/
│       │   └── repositories/
│       ├── presentation/
│       │   ├── cubit/
│       │   └── widgets/
│       └── pages/
└── main.dart
```

---

## 🛠 Clean Architecture

* **Data Layer**: Handles API calls & models
* **Domain Layer**: Contains repositories & business logic
* **Presentation Layer**: UI pages, widgets, and Cubit for state management

---

## 🌐 API

* Base URL: `https://rickandmortyapi.com/api/`
* Endpoints used:

  * `character` – Fetch characters
  * `character?page=X` – Pagination support
  * `character?name=XXX` – Search support

---
