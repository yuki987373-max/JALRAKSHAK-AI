# Changelog

## v2.6.1 — Fast map lookup
- Query independent public Overpass endpoints concurrently and use the first valid response instead of waiting through sequential 12-second timeouts.
- Set a 7-second per-provider request cap and cancel losing requests after a valid response.
- Remove artificial inter-provider backoff from the live lookup path.
- Reduce failed large-radius retries to one smaller-radius retry, preserving the requested radius on the first attempt.
- Keep waterbody and infrastructure lookups separate so a slow infrastructure inventory cannot erase a successfully retrieved waterbody.
- Automated test suite: 98/98 passing.

## Standalone Digital Twin Edition

- Removed the local QGIS / GeoPackage connection panel.
- Removed the Python GIS backend and its automatic Vite startup plugin.
- Removed the dependency on local `.gpkg` files for app startup.
- Kept the coordinate map explorer and optional browser-based GeoJSON imports.
- Kept the standalone Three.js 3D demo available when map lookup returns no waterbody features.
- Updated setup instructions and launcher messaging.

## Important limitations

- The 3D scene is a schematic demo, not a real surveyed catchment.
- Public map tiles may omit water features and are not a complete spatial inventory.
- Water-quality conclusions require actual sensor or laboratory measurements.


## v2.5.1 — Location analysis upgrade
- Analyse location now automatically inspects currently rendered map features within the selected radius.
- Results are deduplicated, distance-sorted, and separated into water features and surrounding context.
- The scan is bounded to 300 visible features and explicitly marked as incomplete map coverage.
- Retains manual feature inspection and the standalone 3D demo; no QGIS or GeoPackage dependency.


## v2.6.0 — Beginner-first interface and Indian address lookup

- Added a no-technical-knowledge quick-start guide to the dashboard.
- Location search now accepts Indian addresses as well as coordinates and supported map URLs, resolving address text through Nominatim before map analysis.
- Reconnected the live waterbody and infrastructure lookup workflow to the location analyser, with separate water and surrounding-feature requests, cached/offline fallback, and multiple Overpass endpoints.
- Increased the per-endpoint timeout to better tolerate slower connections.
- Added the requested predicted-output warning directly below Sensor network and clarified that simulated readings do not train the model.
- Made the remedies panel a separate full-width section beneath likely causes.
- Kept the existing 3D hologram, manual inputs, lab imports, sensor gateway, model-training workspace, and public deployment setup.
- Automated tests: 98 passed. Production build not run because npm dependency installation timed out in this environment.


## v3.0.0 — reliability and beginner deployment update

- Continue from the supplied v2.6.1 source; retain the existing feature set and tests.
- Keep the map visible when independent Overpass geographic lookup fails, so map tiles and manual workflows remain usable.
- Explicitly label provider failure as unavailable/partial data rather than reporting zero waterbodies.
- Bound India place-name geocoding to an 8-second request timeout with a coordinates-first fallback message.
- Bound the OpenFreeMap map-load wait and show a recoverable status instead of an endless loading indicator.
- Add visible Three.js zoom-in/zoom-out controls and keyboard guidance (`R` zoom in, `F` zoom out).
- Clarify that missing waterbody geometry and geometry-free surrounding features are schematic/approximate, not surveyed assets.
- Update project version, Windows launcher, beginner README and add a Cloudflare Pages deployment guide.
