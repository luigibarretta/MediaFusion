-- Seed the 'm3u' metadata provider used to attribute tvg-logo artwork imported
-- from M3U playlists, plus the 'live_tv' and 'radio' system catalogs the
-- importer links channels to. Seeding live_tv here gives it a proper display
-- name ("Live TV") instead of the bare "live_tv" the runtime link helper would
-- otherwise create.

INSERT INTO metadata_provider (name, display_name, is_external, is_active, priority, default_priority, created_at)
VALUES ('m3u', 'M3U', false, true, 0, 0, now())
ON CONFLICT (name) DO NOTHING;

INSERT INTO catalog (name, display_name, is_system, display_order)
VALUES
    ('live_tv', 'Live TV', true, 0),
    ('radio',   'Radio',   true, 0)
ON CONFLICT (name) DO NOTHING;
