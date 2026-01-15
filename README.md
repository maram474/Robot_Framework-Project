# 🧪 Robot Framework – SauceDemo Burger Menu Tests

## 📌 Description
Ce projet automatise les tests du **menu burger** de l’application web **SauceDemo** en utilisant **Robot Framework** et **Selenium WebDriver**.  
Les tests sont exécutés automatiquement via **GitHub Actions (CI/CD)**.

Le projet est structuré selon de bonnes pratiques QA afin d’être **maintenable, réutilisable et professionnel**.

---

## 🎯 Objectifs du projet
- Automatiser les scénarios critiques du menu burger
- Vérifier la navigation et les options du menu
- Mettre en place une exécution automatique des tests (CI)
- Générer des rapports de tests détaillés

---

## 🛠️ Stack Technique
- Robot Framework
- Selenium WebDriver
- Python 3.11
- GitHub Actions
- Google Chrome (Headless en CI)

---
## 📁 Structure du projet

    Robot_Framework-Project
    │
    ├── README.md
    ├── requirements.txt
    │
    ├── data
    │ ├── config.json # Configuration (URL, etc.)
    │ └── locators.json # Localisateurs centralisés
    │
    ├── resources
    │ └── keywords.robot # Keywords réutilisables
    │
    ├── tests
    │ ├── test_about_page.robot
    │ ├── test_all_items_page.robot
    │ ├── test_burger_full.robot
    │ ├── test_close_menu.robot
    │ ├── test_logout.robot
    │ ├── test_menu_options.robot
    │ └── test_reset_state.robot
    │
    └── results
    ├── log.html
    ├── report.html
    └── output.xml

---

## 🧪 Scénarios testés
- Ouverture du menu burger
- Vérification des options :
  - All Items
  - About
  - Logout
  - Reset App State
- Navigation vers la page About
- Fermeture du menu
- Déconnexion de l’utilisateur
- Réinitialisation de l’état de l’application

---
