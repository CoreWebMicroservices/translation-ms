# Translation Microservice

> **Part of [Core Microservices Project](https://github.com/CoreWebMicroservices/corems-project)** - Enterprise-grade microservices toolkit for rapid application development

## Overview

The Translation Microservice provides comprehensive internationalization (i18n) support for multi-language applications. It manages translations, language configurations, and provides APIs for dynamic content localization.

## Features

- **Multi-language Support**: Manage translations for multiple languages and locales
- **Translation Management**: CRUD operations for translation keys and values


## Quick Start

```bash
# Clone the main project
git clone https://github.com/CoreWebMicroservices/corems-project.git
cd corems-project

# Build and start translation service
./setup.sh build translation-ms
./setup.sh start translation-ms

# Or start entire stack
./setup.sh start-all
```

### Service URLs
- **API**: http://localhost:3003
- **Health Check**: http://localhost:3003/actuator/health
- **API Docs**: http://localhost:3003/swagger-ui.html

## API Endpoints

### Translation Management
- `GET /api/translations` - List all translations
- `GET /api/translations/{language}` - Get translations for specific language
- `POST /api/translations` - Create new translation
- `PUT /api/translations/{id}` - Update translation
- `DELETE /api/translations/{id}` - Delete translation

### Language Management
- `GET /api/languages` - List supported languages
- `POST /api/languages` - Add new language
- `PUT /api/languages/{code}` - Update language configuration

### Bulk Operations
- `POST /api/translations/import` - Import translations from file
- `GET /api/translations/export/{language}` - Export translations

## Environment Variables

```bash
# Database Configuration
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/translation_ms
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=postgres

# Redis Configuration (optional)
SPRING_REDIS_HOST=localhost
SPRING_REDIS_PORT=6379

# Service Configuration
SERVER_PORT=3003
TRANSLATION_DEFAULT_LANGUAGE=en
TRANSLATION_FALLBACK_LANGUAGE=en
```

## Database Schema

The service uses its own database schema `translation_ms` with tables:
- `languages` - Supported languages and configurations
- `translation_keys` - Translation key definitions
- `translations` - Translation values per language
- `translation_history` - Translation change history

## Architecture

```
translation-ms/
├── translation-api/          # OpenAPI spec + generated models
├── translation-client/       # Generated API client
├── translation-service/      # Service implementation
│   ├── controller/           # REST controllers
│   ├── service/             # Business logic
│   ├── repository/          # Data access layer
│   └── entity/              # JPA entities
├── migrations/              # Database migrations
└── docker/                 # Docker configuration
```

## Integration

### Using Translation Client

```java
@Autowired
private TranslationApi translationApi;

// Get translations for a language
TranslationResponse translations = translationApi.getTranslations("en");

// Get specific translation
String value = translationApi.getTranslation("welcome.message", "en");
```

### Frontend Integration

```javascript
// Fetch translations
const translations = await fetch('/api/translation/corems/en').then(r => r.json());

// Use in React components
const t = useTranslation();
return <h1>{t('welcome.message')}</h1>;
```

## Development

### Running Tests
```bash
./setup.sh test translation-ms
```

### Database Migrations
```bash
./setup.sh migrate translation-ms
```

### Building
```bash
./setup.sh build translation-ms
```

## Contributing

1. Follow the [Core Microservices Architecture Guidelines](https://github.com/CoreWebMicroservices/corems-project#architecture)
2. Use OpenAPI-first development approach
3. Ensure proper test coverage
4. Update API documentation for any changes

## License

Licensed under the Apache License 2.0. See the [main project](https://github.com/CoreWebMicroservices/corems-project) for details.