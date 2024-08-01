
# Flutter UI Design Implementation

## Overview

This project is designed to implement a Flutter user interface based on a reference design provided in a Figma link. The goal is to replicate the design as closely as possible, paying attention to colors, layout, typography, and design elements.

## Project Structure

* **Project Directory** : `mobile/Samuel_Tolossa/ecommers`
* **Repository** : `2024-internship-mobile-tasks`
* **Figma Design Link** : [Figma Link](https://www.figma.com/design/957Md2CrZ2B9KGjHy8RDcH/Internship?node-id=0-1&t=Yrw4etwCj3Z4NKCI-0)

## Requirements

* **Flutter SDK** : Ensure that you have Flutter SDK installed. You can follow the installation guide [here](https://flutter.dev/docs/get-started/install).
* **Dependencies** : The project uses standard Flutter dependencies. Run `flutter pub get` to install them.

## Implementation Details

### Design Replication

The user interface should closely match the design provided in the Figma link. Focus on:

* **Colors** : Match the color scheme as closely as possible.
* **Layout** : Ensure the layout and positioning of elements are consistent with the design.
* **Typography** : Use the specified fonts, sizes, and weights.
* **Design Elements** : Include any specific design elements such as buttons, icons, and images.

### Widgets and Components

Utilize Flutter widgets and components to build the UI:

* **Container** : For layout and styling.
* **Column & Row** : For arranging widgets vertically and horizontally.
* **Image** : To display images.
* **Text** : For displaying text.
* **Button** : For interactive elements.

## Task Verification

* **Project Naming** : Ensure the project is named correctly as specified.
* **Screenshots** :
* ![Screenshot 2](images/flutter_02.png)
* ![Screenshot 3](images/flutter_03.png)
* ![Screenshot 4](images/flutter_04.png)
* ![Screenshot 5](images/flutter_05.png)
* ![Screenshot 6](images/flutter_06.png)
* ![Screenshot 1](https://file+.vscode-resource.vscode-cdn.net/home/samuel/Documents/2024-internship-mobile-tasks-/Mobile/Samuel_Tolossa/images/flutter_01.png)

## Clean Architecture Structure

### Project Directory 

### Main Directory Structure

- **`core/` - Contains core functionalities and utilities used across the application.**
- **`features/` - Contains the features of the application. Each feature is further divided into layers:**
  - **`Data/` - Contains data sources, models, and repositories for data management.**
    - **`data_source/` - Handles data retrieval from various sources.**
    - **`model/` - Contains data models used in the application.**
    - **`repositories/` - Manages data operations and communication with data sources.**
  - **`Domain/` - Contains business logic and domain entities.**
    - **`entity/` - Contains domain entities.**
    - **`repositories/` - Interface definitions for repositories.**
    - **`usecase/` - Contains use cases representing the application's business logic.**
  - **`presentation/` - Contains UI components and presentation logic.**
    - **`UI/` - Contains different UI components.**
      - **`add_product/` - UI for adding products.**
      - **`home/` - Home screen UI.**
      - **`searchProduct/` - UI for searching products.**

### Testing Directory Structure

- **`Data/` - Contains tests for the data layer.**
  - **`data_source/` - Tests for data sources.**
  - **`model/` - Tests for data models.**
  - **`repositories/` - Tests for data repositories.**
- **`Domain/` - Contains tests for the domain layer.**
  - **`entity/` - Tests for domain entities.**
  - **`repositories/` - Tests for domain repository interfaces.**
  - **`use_case/` - Tests for use cases representing business logic.**
- **`features/` - Contains tests for various features.**
- **`helper/` - Contains helper functions and utilities for tests.**
