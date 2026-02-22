# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

```markdown
# 🖼️ Dynamic Image Logo Component (Salesforce LWC)

<div align="center">

[![GitHub stars](https://img.shields.io/github/stars/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo?style=for-the-badge)](https://github.com/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo?style=for-the-badge)](https://github.com/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo/network)
[![GitHub issues](https://img.shields.io/github/issues/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo?style=for-the-badge)](https://github.com/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo/issues)
<!-- License badge is missing as no LICENSE file was detected -->

**A Salesforce Lightning Web Component (LWC) showcasing a simple integration to dynamically fetch and display an image as a logo.**

</div>

## 📖 Overview

This project provides a foundational Salesforce Lightning Web Component (LWC) designed to demonstrate how to perform an integration call, likely to an external service or an Apex backend, to retrieve an image and display it within the component. It serves as a practical example for developers looking to implement dynamic content fetching and presentation within the Salesforce platform.

The component is built with an emphasis on code quality, utilizing modern JavaScript practices and integrating with Salesforce development tools like the Salesforce CLI, Jest for testing, and ESLint/Prettier for code consistency.

## ✨ Features

-   🎯 **Dynamic Image Fetching**: Implements a mechanism to fetch an image URL (potentially from an external API or Salesforce Apex).
-   🎨 **Image Display**: Renders the fetched image dynamically as a logo within the LWC.
-   ☁️ **Salesforce Platform Integration**: Designed to be deployed and run within a Salesforce Org.
-   🧪 **Unit Testing with Jest**: Includes setup for comprehensive unit tests for LWC components.
-   🧹 **Code Quality & Formatting**: Enforces consistent code style using ESLint and Prettier, including an Apex Prettier plugin.
-   🛠️ **Development Server Support**: Local development server for rapid LWC component iteration.

## 🛠️ Tech Stack

**Frontend:**
![Salesforce LWC](https://img.shields.io/badge/Salesforce-LWC-009DDC?style=for-the-badge&logo=salesforce)
![JavaScript](https://img.shields.io/badge/JavaScript-ESNext-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**Backend:**
![Salesforce Apex](https://img.shields.io/badge/Salesforce-Apex-009DDC?style=for-the-badge&logo=salesforce)
![Salesforce Platform](https://img.shields.io/badge/Salesforce-Platform-009DDC?style=for-the-badge&logo=salesforce)

**DevOps & Tools:**
![Salesforce CLI](https://img.shields.io/badge/Salesforce-CLI-009DDC?style=for-the-badge&logo=salesforce)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)
![npm](https://img.shields.io/badge/npm-CB3837?style=for-the-badge&logo=npm&logoColor=white)
![Jest](https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white)
![ESLint](https://img.shields.io/badge/ESLint-4B32C3?style=for-the-badge&logo=eslint&logoColor=white)
![Prettier](https://img.shields.io/badge/Prettier-F7B93E?style=for-the-badge&logo=prettier&logoColor=black)
![Husky](https://img.shields.io/badge/Husky-black?style=for-the-badge&logo=husky&logoColor=white)
![Rollup.js](https://img.shields.io/badge/Rollup.js-EF3333?style=for-the-badge&logo=rollup.js&logoColor=white) (used for tooling/utilities)
![Webpack](https://img.shields.io/badge/Webpack-1C78C0?style=for-the-badge&logo=webpack&logoColor=white) (used for LWC development server/build)

## 🚀 Quick Start

Follow these steps to set up and deploy the project to your Salesforce Org.

### Prerequisites

-   **Salesforce CLI**: Ensure you have the Salesforce CLI installed and configured. Refer to the [official documentation](https://developer.salesforce.com/tools/vscode/en/sf-cli/install) for installation.
-   **Node.js**: Version 16.x or higher is recommended.
-   **npm**: Node Package Manager, usually installed with Node.js.
-   **Salesforce Org**: Access to a Salesforce Developer Edition, Sandbox, or Scratch Org.

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo.git
    cd Simple-INtegration-call-to-fetch-image-and-show-as-logo
    ```

2.  **Install Node.js dependencies**
    ```bash
    npm install
    ```
    This will install development tools like Jest, ESLint, Prettier, and Salesforce LWC plugins.

3.  **Authorize your Salesforce Org (if not already done)**
    ```bash
    sf org login web
    # or if using a scratch org:
    # sf org create scratch -d -f config/project-scratch-def.json -a MyScratchOrg
    # sf project deploy start
    ```

4.  **Deploy source to Salesforce Org**
    ```bash
    sf project deploy start
    ```
    This command deploys the LWC components and any associated Apex classes or metadata to your default Salesforce Org.

5.  **Start development server (Optional, for local LWC preview)**
    If you want to preview the LWC component locally without deploying to an org, use the LWC development server:
    ```bash
    npm run serve
    ```
    This will typically open the component in your browser at `http://localhost:3000`.

## 📁 Project Structure

```
project-root/
├── .husky/              # Git hooks configuration (pre-commit, post-merge, post-checkout)
├── .vscode/             # VS Code editor settings
├── config/              # Salesforce CLI configuration files (e.g., project-scratch-def.json)
├── force-app/           # Main Salesforce source directory
│   └── main/
│       └── default/
│           ├── aura/         # Aura Components (if any)
│           ├── classes/      # Apex Classes (server-side logic)
│           ├── lwc/          # Lightning Web Components (client-side UI)
│           └── objects/      # Custom Objects (if any)
│           └── package.xml   # Manifest file for deployment
├── manifest/            # Additional manifest files (if any)
├── scripts/             # Custom utility scripts
├── .forceignore         # Specifies files for Salesforce CLI to ignore during deployment
├── .gitignore           # Specifies files for Git to ignore
├── .prettierignore      # Files to ignore during Prettier formatting
├── .prettierrc          # Prettier configuration for code formatting
├── eslint.config.js     # ESLint configuration for code linting
├── jest.config.js       # Jest configuration for unit testing
├── package.json         # Node.js project metadata, scripts, and dependencies
├── sfdx-project.json    # Salesforce DX project configuration
└── README.md            # Project README file
```

## ⚙️ Configuration

### Salesforce Project Configuration
-   **`sfdx-project.json`**: Defines project-specific settings for the Salesforce CLI, including package directories and namespace.

### Code Quality Configuration
-   **`eslint.config.js`**: Configures ESLint with rules for JavaScript, including Salesforce LWC-specific linting.
-   **`.prettierrc`**: Defines code formatting rules for Prettier, ensuring consistent style across JS, HTML, CSS, and Apex files.
-   **`.prettierignore`**: Specifies files and directories that Prettier should not format.

## 🔧 Development

### Available Scripts
The `package.json` includes several scripts to aid in development:

| Command             | Description                                                             |
|---------------------|-------------------------------------------------------------------------|
| `npm run lint`      | Runs ESLint to check for code quality issues.                           |
| `npm run test`      | Executes Jest unit tests.                                               |
| `npm run test:watch`| Runs Jest in watch mode, re-running tests on file changes.              |
| `npm run prettier`  | Formats all project files using Prettier according to `.prettierrc`.    |
| `npm run prettier:verify` | Checks if all files are formatted correctly without making changes. |
| `npm run build`     | Builds the LWC component for production using lwc-webpack.              |
| `npm run serve`     | Starts a local LWC development server for component preview.            |

### Git Hooks
This project uses `husky` to manage Git hooks:
-   **`pre-commit`**: Automatically runs `npm run prettier:verify` and `npm run lint` before committing, ensuring code quality and formatting.
-   **`post-merge`**, **`post-checkout`**: Executes `sfdx-oss lint --quiet --exit-on-error`, which is likely a custom script for linting the Salesforce project after Git operations.

## 🧪 Testing

The project uses Jest for unit testing Lightning Web Components.

```bash
# Run all unit tests
npm run test

# Run tests in watch mode (re-runs on file changes)
npm run test:watch

# Run tests with coverage (if configured in jest.config.js)
# npm run test -- --coverage
```

## 🚀 Deployment

The primary method for deploying this component to a Salesforce Org is via the Salesforce CLI.

### Deployment to Salesforce Org
To deploy all source code from the `force-app` directory to your connected Salesforce Org:
```bash
sf project deploy start
```
For more advanced deployment scenarios (e.g., deploying specific components, destructive changes), refer to the [Salesforce CLI documentation](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_deploy_source.htm).

## 🤝 Contributing

We welcome contributions to enhance this project! Please consider submitting issues or pull requests.

### Development Setup for Contributors
Ensure you have the prerequisites installed and follow the installation steps. When making changes, please:
1.  Create a new branch for your feature or bug fix.
2.  Adhere to the existing code style and run `npm run prettier` before committing.
3.  Ensure all tests pass using `npm run test`.
4.  Write new tests for new features or bug fixes.
5.  Push your branch and open a Pull Request.

## 📄 License

This project currently does not specify a license. Please contact the repository owner for licensing information.

## 🙏 Acknowledgments

-   **Salesforce Developers**: For providing the powerful LWC framework and Salesforce CLI.
-   **Open Source Community**: For tools like Node.js, npm, Jest, ESLint, and Prettier that make development efficient.
-   **`shubham772`**: The original author and maintainer of this repository.

## 📞 Support & Contact

-   🐛 Issues: [GitHub Issues](https://github.com/shubham772/Simple-INtegration-call-to-fetch-image-and-show-as-logo/issues)

---

<div align="center">

**⭐ Star this repo if you find it helpful!**

Made with ❤️ by [shubham772](https://github.com/shubham772)

</div>
```
