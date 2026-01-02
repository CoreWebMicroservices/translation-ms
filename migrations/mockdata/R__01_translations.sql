-- ============================================================================
-- R__01 - Seed translations (Dev/Stage only)
-- ============================================================================
-- Based on actual TranslationEntity schema
-- ============================================================================

SET search_path TO translation_ms;

-- ----------------------------------------------------------------------------
-- Translation bundles
-- ----------------------------------------------------------------------------
INSERT INTO translation_bundles (realm, lang, data) VALUES
    ('common', 'en', '{"app.name": "CoreMS", "app.welcome": "Welcome", "app.logout": "Logout", "app.save": "Save", "app.cancel": "Cancel", "app.delete": "Delete", "app.edit": "Edit", "app.loading": "Loading..."}'),
    ('common', 'es', '{"app.name": "CoreMS", "app.welcome": "Bienvenido", "app.logout": "Cerrar sesión", "app.save": "Guardar", "app.cancel": "Cancelar", "app.delete": "Eliminar", "app.edit": "Editar", "app.loading": "Cargando..."}'),
    ('common', 'fr', '{"app.name": "CoreMS", "app.welcome": "Bienvenue", "app.logout": "Déconnexion", "app.save": "Enregistrer", "app.cancel": "Annuler", "app.delete": "Supprimer", "app.edit": "Modifier", "app.loading": "Chargement..."}'),
    ('auth', 'en', '{"auth.login": "Login", "auth.register": "Register", "auth.email": "Email", "auth.password": "Password", "auth.forgot": "Forgot password?", "auth.remember": "Remember me"}'),
    ('auth', 'es', '{"auth.login": "Iniciar sesión", "auth.register": "Registrarse", "auth.email": "Correo", "auth.password": "Contraseña", "auth.forgot": "¿Olvidaste tu contraseña?", "auth.remember": "Recuérdame"}'),
    ('auth', 'fr', '{"auth.login": "Connexion", "auth.register": "Inscription", "auth.email": "Email", "auth.password": "Mot de passe", "auth.forgot": "Mot de passe oublié?", "auth.remember": "Se souvenir de moi"}'),
    ('errors', 'en', '{"error.generic": "Something went wrong", "error.notfound": "Not found", "error.unauthorized": "Unauthorized", "error.validation": "Validation error"}'),
    ('errors', 'es', '{"error.generic": "Algo salió mal", "error.notfound": "No encontrado", "error.unauthorized": "No autorizado", "error.validation": "Error de validación"}'),
    ('errors', 'fr', '{"error.generic": "Une erreur est survenue", "error.notfound": "Non trouvé", "error.unauthorized": "Non autorisé", "error.validation": "Erreur de validation"}')
ON CONFLICT ON CONSTRAINT uk_translation_realm_lang DO UPDATE SET
    data = EXCLUDED.data,
    updated_at = CURRENT_TIMESTAMP;

RESET search_path;
