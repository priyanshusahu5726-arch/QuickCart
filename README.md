# 🛒 QuickCart

A modern grocery shopping application built with **SwiftUI** following **MVVM architecture**, **Repository Pattern**, and **async/await** networking.

This project was built as part of my iOS development journey to learn modern application architecture, clean code principles, and professional software engineering practices by building a real-world application from scratch.

---

## 📱 Project Overview

QuickCart is a SwiftUI-based grocery shopping application that allows users to browse products, search items, filter by category, sort products, view product details, manage a shopping cart, and persist cart data across app launches.

The application fetches product data from a REST API using URLSession and Swift Concurrency (async/await). The codebase follows MVVM architecture, Repository Pattern, and Protocol-Oriented Programming to promote modularity, separation of concerns, and maintainability.
---

## ✨ Features

- Browse grocery products from a REST API
- View detailed product information
- Search products by name
- Filter products by category
- Sort products by name and price
- Add products to cart
- Increase and decrease cart quantity
- Remove items from cart
- Persist cart data using UserDefaults
- Pull to Refresh support
- Loading and error states
- Reusable SwiftUI components
- Dependency Injection using Repository Pattern
---

## 🏗️ Architecture

QuickCart follows the **MVVM (Model–View–ViewModel)** architecture combined with the **Repository Pattern** to separate UI, business logic, and data access.

```
SwiftUI Views
      │
      ▼
HomeViewModel
      │
      ▼
ProductRepositoryProtocol
      │
      ▼
ProductRepository
      │
      ▼
NetworkService
      │
      ▼
REST API (DummyJSON)
```

### Architecture Highlights

- MVVM for separation of UI and business logic
- Repository Pattern for data abstraction
- Protocol-Oriented Programming for loose coupling
- Dependency Injection for improved testability
- DTO to Domain Model mapping
- Generic networking with async/await
- Observable state management using the Observation framework
---

## 📂 Project Structure

```
QuickCart
│
├── App
├── Views
├── ViewModels
├── Components
├── Models
├── Services
├── Repositories
├── Protocols
├── Manager
├── Helpers
├── Resources
└── Extensions
```

The project is organized using a feature-oriented structure to keep responsibilities separated and improve maintainability as the application grows.
---

## 🛠 Technologies

- Swift
- SwiftUI
- Observation Framework
- MVVM Architecture
- Repository Pattern
- Protocol-Oriented Programming
- Dependency Injection
- URLSession
- REST API
- Async/Await
- Codable
- JSONDecoder
- UserDefaults
- Git
- GitHub
- Xcode
---

## 📚 What I Learned

Building QuickCart helped me gain practical experience with:

- Designing applications using MVVM architecture
- Applying the Repository Pattern to separate data access from business logic
- Building reusable SwiftUI components
- Consuming REST APIs using URLSession and async/await
- Mapping DTOs to domain models
- Managing application state with the Observation framework
- Persisting local data using UserDefaults
- Organizing scalable project structures
- Writing clean, maintainable Swift code
- Using Git and GitHub with professional commit conventions
---

## 🚀 Getting Started

### Prerequisites

- Xcode 16 or later
- iOS 18 Simulator
- macOS Sequoia or later

### Installation

1. Clone the repository

```bash
git clone https://github.com/priyanshusahu5726-arch/QuickCart.git
```

2. Open the project

```bash
open QuickCart.xcodeproj
```

3. Build and run the project in Xcode.
---

## 🔮 Future Improvements

- User Authentication
- SwiftData/Core Data for offline storage
- Image caching
- Unit Testing
- UI Testing
- Firebase Integration
- Wishlist functionality
- Product reviews and ratings
- Pagination
- Dark Mode improvements
---

## 👨‍💻 Author

**Priyanshu Sahu**

Aspiring iOS Developer passionate about building modern iOS applications with Swift and SwiftUI while following clean architecture and software engineering best practices.

GitHub:
https://github.com/priyanshusahu5726-arch
