# Scouting Hub Chant Catalog

This directory is the offline-first content source for the **Chants & Songs** phase.

## Files

- `catalog.json`: root manifest and shared action definitions.
- `categories.json`: Arabic and English category metadata.
- `collections/*.json`: one collection per source page.
- `schemas/chant_collection.schema.json`: validation schema.

## YouTube button

A YouTube button is displayed only when both conditions are true:

```json
{
  "media": {
    "youtube": {
      "enabled": true,
      "videoId": "RvRjuvh28dY",
      "url": "https://www.youtube.com/watch?v=RvRjuvh28dY"
    }
  },
  "availableActions": ["youtube"]
}
```

The localized button label is stored once in `catalog.json`:

- Arabic: `استمع على يوتيوب`
- English: `Watch on YouTube`

## Migration status

- `complete`: all entries from the source page are migrated and reviewed.
- `in_progress`: the file is valid and partially populated.
- `pending`: the source page is registered but its entries are not migrated yet.

Do not translate song lyrics automatically. Keep `lyrics.en` as `null` until an approved translation exists.
