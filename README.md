# prarthona-foundation.github.io

Website of Prarthona Foundation e.V. — built with [Hugo](https://gohugo.io/)
and the [Blowfish](https://blowfish.page/) theme, hosted on GitHub Pages.

Live at <https://prarthona-foundation.github.io/>

## Preview locally

```bash
hugo server -D
```

Then open <http://localhost:1313>. The site rebuilds as you save.

## Deploy

Pushing to `main` rebuilds and publishes automatically via
`.github/workflows/hugo.yml`.

To publish immediately without waiting for GitHub Actions:

```bash
./deploy.sh
```

Both do the same thing: build the site and force-push the output to the
`gh-pages` branch, which GitHub Pages serves.

## Editing content

Pages live in `content/`, one file per language:

| Page | German | English |
| --- | --- | --- |
| Home | `content/_index.de.md` | `content/_index.en.md` |
| About | `content/about/_index.de.md` | `content/about/_index.en.md` |
| Programs | `content/programs/_index.de.md` | `content/programs/_index.en.md` |
| Apply | `content/apply/_index.de.md` | `content/apply/_index.en.md` |
| Donate | `content/donate/_index.de.md` | `content/donate/_index.en.md` |
| Contact | `content/contact/_index.de.md` | `content/contact/_index.en.md` |

German is the default language and is served at the root; English is at
`/en/`. Navigation labels are in `config/_default/menus.de.toml` and
`menus.en.toml`.

To add a news post:

```bash
hugo new content/news/my-post.de.md
```

Remove `draft: true` from the front matter to publish it.

## Appearance

In `config/_default/params.toml`:

- `colorScheme` — currently `bloody`. Other options: `blowfish`, `avocado`,
  `fire`, `ocean`, `forest`, `princess`, `neon`, `terminal`, `marvel`, `noir`,
  `autumn`, `congo`, `slate`, `github`, `one-light`.
- `[homepage] layout` — currently `card`. Other options: `page`, `profile`,
  `hero`, `background`, `custom`.
- `autoSwitchAppearance` is `false` so the site always uses the light
  palette. Setting it to `true` makes it follow the visitor's system
  dark/light preference.

The homepage card image is Blowfish's default placeholder. To use a real
photo, put it in `assets/img/` and set `homepageImage` under `[homepage]`.

## Still to do

- Fill in the real Impressum and Datenschutzerklärung — `content/impressum/`
  and `content/datenschutz/` are placeholders with TODOs. Both are legally
  required for a German e.V. before the site is promoted publicly.
- Phase 2: embed the Tally.so scholarship form, add the PayPal donation
  button and SEPA bank details.
