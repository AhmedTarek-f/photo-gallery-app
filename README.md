# Photo Gallery App 🏞️

A beautifully structured Flutter app that displays a grid of photos on the home screen with efficient caching and smooth pagination.

## Features ✨

- 📷 **Photo Grid View**  
  Displays photos in a responsive grid layout.

- 🔄 **Pagination Support**  
  Lazy loading of photos as the user scrolls.

- 💾 **Local Caching with Hive**  
  Offline-first experience using Hive to persist photo data locally.

- 🌐 **Cached Network Image**  
  Optimized image loading using `cached_network_image`.

- 🧼 **Clean Architecture**  
  Well-structured codebase following the principles of Clean Architecture.

- 📦 **Bloc/Cubit State Management**  
  Efficient and reactive state handling using Bloc & Cubit.

- 🧪 **Unit Testing**  
  Includes unit tests for use cases at the domain layer.

## 📱 Screenshots
<img src="https://github.com/user-attachments/assets/01423063-2959-4493-9034-90fda2488013" alt="Screenshot 1" width="300"/>
<img src="https://github.com/user-attachments/assets/1fcc6751-19ca-45ba-afe5-0d915bb055ee" alt="Screenshot 2" width="300"/>
<img src="https://github.com/user-attachments/assets/203c2c64-4979-4720-895a-604572e25818" alt="Screenshot 3" width="300"/>
<img src="https://github.com/user-attachments/assets/f019189e-c00f-4c15-94dd-db753d1176c3" alt="Screenshot 4" width="300"/>
<img src="https://github.com/user-attachments/assets/0db038a0-a2c9-41b5-8cd4-cdac747d36a5" alt="Screenshot 5" width="300"/>
<img src="https://github.com/user-attachments/assets/55f7507c-32fd-4f6e-b777-7f1dcae56d45" alt="Screenshot 6" width="300"/>
<img src="https://github.com/user-attachments/assets/984dfbf6-ef7a-4097-8a1b-aedfc6525a29" alt="Screenshot 7" width="300"/>

## 🧰 Tech Stack

- **Flutter**: `3.27.4 (Stable)`
- **Dart**
- **State Management**: Bloc / Cubit
- **API Communication**: Retrofit
- **Local Storage**: Hive
- **Image Caching**: Cached Network Image
- **Architecture**: Clean Architecture

## 📂 Project Structure

```bash
lib/
├── api/
│   └── client/          # Retrofit API client
│   └── models/          # Data models
│   └── responses/       # API responses
│   └── data_source_impl/ # API implementations
├── data/
│   └── data_source/     # Local/remote data sources
│   └── repositories/    # Repository implementations
├── domain/
│   └── entities/        # Domain entities
│   └── repositories/    # Repository contracts
│   └── usecases/        # Use cases with tests
├── presentation/
│   └── views/           # UI screens/widgets
│   └── view_models/     # Bloc/Cubit files

```

## 🛠️ Setup Instructions

- **1. Clone the repository**: git clone https://github.com/AhmedTarek-f/photo-gallery-app
- **2. Navigate into the project directory**: cd photo-gallery-app
- **3. Install dependencies**: flutter pub get
- **4. Run the app**: flutter run

## 📱 Build & Release

- **Build release APK**: flutter build apk --release
- **Build APK release**: flutter install --release

