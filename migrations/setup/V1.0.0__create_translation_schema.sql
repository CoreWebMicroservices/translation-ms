-- ============================================================================
-- V1.0.0 - Create translation_ms schema
-- ============================================================================
-- Based on: TranslationEntity
-- ============================================================================

CREATE SCHEMA IF NOT EXISTS translation_ms;

COMMENT ON SCHEMA translation_ms IS 'Translation service - i18n bundles';

SET search_path TO translation_ms;

-- ----------------------------------------------------------------------------
-- translation_bundles table
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS translation_bundles (
    id              BIGSERIAL PRIMARY KEY,
    realm           VARCHAR(255) NOT NULL,
    lang            VARCHAR(10) NOT NULL,
    data            JSONB NOT NULL,
    updated_at      TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by      UUID,
    
    CONSTRAINT uk_translation_realm_lang UNIQUE (realm, lang)
);

CREATE INDEX IF NOT EXISTS idx_translation_realm ON translation_bundles(realm);
CREATE INDEX IF NOT EXISTS idx_translation_lang ON translation_bundles(lang);

RESET search_path;
