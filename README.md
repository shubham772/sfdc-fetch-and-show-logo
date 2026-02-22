---

# Simple Integration: Call-to-Fetch Image and Show as Logo

### *Salesforce LWC & Apex Integration Framework*

## 🚀 Project Overview

This repository demonstrates a robust integration pattern within Salesforce to fetch external data and images via a REST API and persist them directly into the CRM database. Using the **PokéAPI** as a proof-of-concept, this project implements a "Search & Stamp" architecture where external assets are retrieved, displayed in a responsive UI, and saved to the Lead record.

---

## 💼 Real-World Business Scenarios

The logic used in this "Fun" project is identical to professional enterprise requirements:

* **Brand Enrichment:** Automatically fetching a company's logo via Clearbit/LinkedIn based on an email domain.
* **Shipping Logistics:** Retrieving real-time tracking maps and status from FedEx/UPS APIs.
* **Identity Verification:** Fetching and storing profile photos for KYC (Know Your Customer) compliance.
* **Product Cataloging:** Dynamically pulling product images and specs from an external PIM (Product Information Management) system.

---

## 🛠️ Technical Stack & Features

* **Asynchronous Apex:** REST callouts using `Http` classes and `@future` methods for non-blocking data processing.
* **Dynamic LWC UI:** A responsive "Scanner" interface utilizing `lightning-combobox` and CSS animations.
* **Contextual Intelligence:** Uses `CurrentPageReference` and `@api recordId` to ensure the component is always aware of its parent record.
* **Data Persistence:** Uses the `lightning/uiRecordApi` (Wire Service) to update Salesforce records without requiring page refreshes.
* **Visual Feedback:** Professional-grade error handling with `ShowToastEvent` notifications.

---

## 📂 Project Structure

```text
force-app/main/default/
├── classes/
│   └── PokeApiService.cls       # REST Callout logic & JSON Deserialization
├── lwc/
│   └── pokemonScanner/          # Responsive UI & JavaScript Controller
├── objects/
│   └── Lead/fields/             # Custom fields for Data Stamping
└── triggers/
    └── LeadPokemonTrigger.trigger # Automatic sync on record save

```

---

## ⚙️ Setup & Installation

### 1. Prerequisites

* Salesforce Developer Org or Scratch Org.
* SFDX CLI and VS Code installed.

### 2. Configuration

Before deploying, you must whitelist the API endpoints in Salesforce:

* **Remote Site Settings:** Add `https://pokeapi.co`
* **CSP Trusted Sites:** Add `https://raw.githubusercontent.com` (to allow images to load).

### 3. Deployment

```bash
# Clone the repo
git clone https://github.com/your-username/sfdc-fetch-and-show-logo.git

# Deploy to your org
sf project deploy start

```

---

## 🛠️ Troubleshooting

* **`recordId` is Undefined:** Ensure the component is placed on a **Record Page** (not a Home page) and that the `.js-meta.xml` includes the `lightning__RecordPage` target.
* **Image Not Loading:** Check the browser console. If you see a CSP violation, ensure the Image URL domain is added to **CSP Trusted Sites**.
* **Update Failed:** Verify that your User Profile has **Edit Access** to the custom fields (`Favorite_Pokemon__c`, etc.).

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---
