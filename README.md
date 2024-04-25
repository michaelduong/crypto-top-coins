<p align="center">
  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" alt="project-logo">
</p>
<p align="center">
    <h1 align="center">CRYPTO-TOP-COINS</h1>
</p>
<p align="center">
    <em>Unveil cryptos top picks with precision."</em>
</p>
<p align="center">
	<img src="https://img.shields.io/github/license/michaelduong/crypto-top-coins?style=default&logo=opensourceinitiative&logoColor=white&color=0080ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/michaelduong/crypto-top-coins?style=default&logo=git&logoColor=white&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/michaelduong/crypto-top-coins?style=default&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/michaelduong/crypto-top-coins?style=default&color=0080ff" alt="repo-language-count">
<p>
<p align="center">
	<!-- default option, no dependency badges. -->
</p>

<br><!-- TABLE OF CONTENTS -->

<details>
  <summary>Table of Contents</summary><br>

- [ Overview](#-overview)
- [ Features](#-features)
- [ Repository Structure](#-repository-structure)
- [ Modules](#-modules)
- [ Getting Started](#-getting-started)
  - [ Installation](#-installation)
  - [ Usage](#-usage)
  - [ Tests](#-tests)
  </details>
  <hr>

## Overview

The Crypto Top Coins project is a cryptocurrency tracking application that leverages external APIs to provide real-time data on top cryptocurrencies. By efficiently managing network requests and responses, the software ensures up-to-date and accurate information for users. Key components like CoinViewModel and CoinService drive seamless data fetching, while CoinDetailViewModel handles detailed coin information. The project's robust testing suite ensures data accuracy and reliability, while cache management enhances performance. With a focus on user experience and data integrity, Crypto Top Coins offers a dynamic platform for monitoring and analyzing cryptocurrency trends.

---

## Features

|     | Feature           | Description                                                                                                                                                                                                                                   |
| --- | ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ⚙️  | **Architecture**  | The project relies on a modular architecture with clear separation of concerns. It uses SwiftUI for the front end and network communication for fetching real-time cryptocurrency data.                                                       |
| 🔩  | **Code Quality**  | The codebase maintains a high standard of quality with consistent coding style, clear naming conventions, and proper documentation. It follows best practices for Swift development.                                                          |
| 📄  | **Documentation** | The project features extensive inline documentation, aiding developers in understanding the codebase. Additionally, it includes a README file providing an overview of the project and setup instructions.                                    |
| 🔌  | **Integrations**  | Key integrations include dependencies like `Kingfisher`, `Inject`, and `ActivityIndicatorView` for image loading, hot code reload for iOS, and activity indicator functionality. External APIs are utilized for fetching cryptocurrency data. |
| 🧩  | **Modularity**    | The codebase demonstrates high modularity, allowing for easy component reuse and isolation of functionalities. This promotes maintainability and scalability of the project.                                                                  |
| 🧪  | **Testing**       | The project utilizes XCTest for unit testing and functional testing. It includes tests for view models, network manager, cache manager, and mock objects, ensuring code reliability and performance.                                          |
| ⚡️ | **Performance**   | The project exhibits efficient performance with optimized network requests, caching mechanisms, and asynchronous data fetching. Resource management is handled effectively to provide a smooth user experience.                               |
| 🛡️  | **Security**      | Security measures include sandboxing, read-only file access, and secure API key management for data protection. These measures ensure the confidentiality and integrity of user data within the application.                                  |
| 📦  | **Dependencies**  | Key dependencies include libraries like `plist`, `json`, and external packages for networking and UI components. These dependencies enhance the functionality and user interface of the application.                                          |

---

## Repository Structure

```sh
└── crypto-top-coins/
    ├── Crypto Top Coins
    │   ├── Assets.xcassets
    │   ├── Crypto_Top_Coins.entitlements
    │   ├── Crypto_Top_CoinsApp.swift
    │   ├── Data
    │   ├── Extensions
    │   ├── Helpers
    │   ├── Model
    │   ├── Networking
    │   ├── Preview Content
    │   ├── Resources
    │   ├── View
    │   └── ViewModel
    ├── Crypto Top Coins.xcodeproj
    │   ├── project.pbxproj
    │   ├── project.xcworkspace
    │   └── xcuserdata
    └── Crypto Top CoinsTests
        ├── CacheManagerTests.swift
        ├── CoinViewModelTests.swift
        ├── Crypto_Top_CoinsTests.swift
        ├── Mock Objects
        └── NetworkManagerFunctionalTests.swift
```

---

## Modules

<details closed><summary>Crypto Top CoinsTests</summary>

| File                                                                                                                                                          | Summary                                                                                                                                                                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [CoinViewModelTests.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top CoinsTests/CoinViewModelTests.swift)                       | Tests `CoinViewModel` parsing JSON data for Crypto Top Coins, ensuring accurate coin information retrieval. Implements mock interface for test isolation, setting up test environment with predefined response data and testing coin attributes against expected values. |
| [NetworkManagerFunctionalTests.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top CoinsTests/NetworkManagerFunctionalTests.swift) | Verifies the end-to-end functionality of network requests in the Crypto Top Coins app. Uses CoinService to fetch coin data, asserting a successful response. Signals completion after verifying data retrieval within a specified timeout.                               |
| [Crypto_Top_CoinsTests.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top CoinsTests/Crypto_Top_CoinsTests.swift)                 | Verifies unit test setup for the Crypto Top Coins module. Implements testExample for functional testing using XCTest assertions and async handling. Includes testPerformanceExample for measuring code execution time.                                                   |
| [CacheManagerTests.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top CoinsTests/CacheManagerTests.swift)                         | Tests cache loading and saving functionality with mock data in CacheManager using UserDefaults. Validates cache count and key existence for coins.                                                                                                                       |

</details>

<details closed><summary>Crypto Top CoinsTests.Mock Objects</summary>

| File                                                                                                                             | Summary                                                                                                                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MockData.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top CoinsTests/Mock Objects/MockData.swift) | Provides mock JSON data for testing API responses in the `Crypto Top Coins` project. The `MockedData` class contains a static URL referencing a JSON file, enhancing unit test coverage for network requests. |

</details>

<details closed><summary>Crypto Top Coins</summary>

| File                                                                                                                                         | Summary                                                                                                                                                                                           |
| -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Crypto_Top_Coins.entitlements](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Crypto_Top_Coins.entitlements) | Enables sandboxing and read-only file access, ensuring secure app operations and user data protection within the Crypto Top Coins app.                                                            |
| [Crypto_Top_CoinsApp.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Crypto_Top_CoinsApp.swift)         | Initiates app setup by configuring dependencies for HTTP client, cache manager, and API service, enabling data access for CoinViewModel. Renders CoinListView with essential environment objects. |

</details>

<details closed><summary>Crypto Top Coins.ViewModel</summary>

| File                                                                                                                                           | Summary                                                                                                                                                                                                                                                                                          |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [CoinDetailViewModel.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/ViewModel/CoinDetailViewModel.swift) | Defines CoinDetailViewModel handling CoinDetail data with fetch functionality, error management, and stats calculation. Supports SwiftUI with asynchronous fetching and custom error handling based on network errors.                                                                           |
| [CoinViewModel.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/ViewModel/CoinViewModel.swift)             | Designs and manages a CoinViewModel for the parent repository, delivering real-time coin data. Fetches and sorts top moving coins, handling network errors seamlessly. Incorporated with a CoinServiceInterface to ensure smooth API interactions and error handling throughout the application. |

</details>

<details closed><summary>Crypto Top Coins.Networking.HTTP</summary>

| File                                                                                                                               | Summary                                                                                                                                                                                                                                            |
| ---------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [HTTPClient.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Networking/HTTP/HTTPClient.swift) | Implements HTTP client for network requests with connectivity check. Inherits from NSObject and conforms to ObservableObject. Handles fetching raw data and decoding to given type. Aims to facilitate data retrieval in the Crypto Top Coins app. |

</details>

<details closed><summary>Crypto Top Coins.Networking.Service</summary>

| File                                                                                                                                                | Summary                                                                                                                                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [CoinService.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Networking/Service/CoinService.swift)             | Implements CoinService with fetch methods for coins, utilizing HTTPClient and CacheManagerInterface to fetch and save data. Supports fetching cached coins if network request fails, ensuring seamless coin data retrieval in Crypto Top Coins app. |
| [CoinDetailService.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Networking/Service/CoinDetailService.swift) | Implements service to fetch and cache coin details using HTTP Client and Cache Manager. Handles network requests and caching to display coin details efficiently in the Crypto Top Coins app.                                                       |

</details>

<details closed><summary>Crypto Top Coins.Resources</summary>

| File                                                                                                                                                                 | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [CryptoTopCoinsConfiguration.xcconfig](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Resources/CryptoTopCoinsConfiguration.xcconfig) | Specifies CoinGecko API key for the projects configuration.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| [coin_response.json](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Resources/coin_response.json)                                     | Code File SummaryThe `Crypto_Top_CoinsApp.swift` file serves as the entry point for the Crypto Top Coins application within the parent repository. It orchestrates the initialization of the apps main components and sets up the essential configuration for the seamless operation of the cryptocurrency tracking functionalities. This code file plays a pivotal role in launching and structuring the overall flow of the Crypto Top Coins application within the defined repository architecture. |

</details>

<details closed><summary>Crypto Top Coins.Extensions</summary>

| File                                                                                                                                      | Summary                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| [Double+Extension.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Extensions/Double+Extension.swift) | Formats and converts Double values to currency, percent, and abbreviated formats in the Crypto Top Coins app. |
| [String+Extension.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Extensions/String+Extension.swift) | Enhances Crypto Top Coins by sanitizing HTML tags in strings. Improves user experience and data cleanliness.  |

</details>

<details closed><summary>Crypto Top Coins.Model</summary>

| File                                                                                                                     | Summary                                                                                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [StatModel.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Model/StatModel.swift)   | Defines a data model for statistics, including title, value, and optional percentage change. The model encapsulates key information about cryptocurrency stats, contributing to the data layer of the Crypto Top Coins app. |
| [Coin.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Model/Coin.swift)             | Defines Coin model structure with properties for cryptocurrency data. Implements Codable, Identifiable, Hashable, and Equatable protocols. Includes JSONDecoder configuration for data parsing.                             |
| [CoinDetail.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Model/CoinDetail.swift) | Defines a model structure for cryptocurrency details with properties like id, symbol, and description. Implements protocols for hashing and equatability to enable comparison.                                              |

</details>

<details closed><summary>Crypto Top Coins.View</summary>

| File                                                                                                                            | Summary                                                                                                                                                                                                                              |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [StatView.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/View/StatView.swift)             | Showcases a SwiftUI component rendering cryptocurrency statistics with title, value, and percentage change. Implements dynamic color indication based on value change direction.                                                     |
| [CoinListView.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/View/CoinListView.swift)     | Empowers users to browse a list of cryptocurrencies. Displays coins with details, handles loading states, and fetches data securely. Additionally, presents alerts for errors and ensures smooth navigation within the app.          |
| [CoinView.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/View/CoinView.swift)             | Illustrates a SwiftUI view for displaying coin details with image, name, symbol, price, and price change percentage. Utilizes Kingfisher for image loading, currency formatting, and percentage display. Supports dynamic injection. |
| [CoinDetailView.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/View/CoinDetailView.swift) | Displays detailed overview of a cryptocurrency.-Shows description, stats, and image.-Implements loading indicator and error handling.-Supports Read more feature.-Fetches data from API using dependency injection.                  |

</details>

<details closed><summary>Crypto Top Coins.Data</summary>

| File                                                                                                                        | Summary                                                                                                                                                                                                                                                                                |
| --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [CacheManager.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Data/CacheManager.swift) | Manages caching of cryptocurrency data, allowing loading, saving, retrieval, addition, removal, and updating of cached coins. Utilizes UserDefaults for storage and conforms to CacheManagerInterface protocol. Ensures efficient handling and updating of cached data within the app. |

</details>

<details closed><summary>Crypto Top Coins.Helpers</summary>

| File                                                                                                                     | Summary                                                                                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Constants.swift](https://github.com/michaelduong/crypto-top-coins/blob/master/Crypto Top Coins/Helpers/Constants.swift) | Defines base URLs and error messages, and constructs endpoints for a crypto app. Organizes constants for API calls and UI strings efficiently within the parent repositorys architecture. |

</details>

---

## Getting Started

**System Requirements:**

- **Swift**: `version 5.10.0`

### Installation

<h4>From <code>source</code></h4>

> 1. Clone the crypto-top-coins repository:
>
> ```console
> $ git clone https://github.com/michaelduong/crypto-top-coins
> ```
>
> 2. Change to the project directory:
>
> ```console
> $ cd crypto-top-coins
> ```
>
> 3. Install the dependencies:
>
> ```console
> $ swift build
> ```

### Usage

<h4>From <code>source</code></h4>

> Run crypto-top-coins using the command below:
>
> ```console
> $ .build/debug/myapp
> ```

### Tests

> Run the test suite using the command below:
>
> ```console
> $ swift test
> ```

---

[**Return**](#-overview)

---
