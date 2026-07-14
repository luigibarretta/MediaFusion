-- Remove the seeded rows and their dependents (artwork attributed to the m3u
-- provider, and the live_tv / radio catalog links).
DELETE FROM media_image
    WHERE provider_id IN (SELECT id FROM metadata_provider WHERE name = 'm3u');
DELETE FROM metadata_provider WHERE name = 'm3u';

DELETE FROM media_catalog_link
    WHERE catalog_id IN (SELECT id FROM catalog WHERE name IN ('live_tv', 'radio'));
DELETE FROM catalog WHERE name IN ('live_tv', 'radio');
