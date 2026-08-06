# prarthona-foundation.github.io

Website of Prarthona i. G. — built with [Hugo](https://gohugo.io/)
and the [Blowfish](https://blowfish.page/) theme, hosted on GitHub Pages.

Live at <https://prarthona-foundation.github.io/>

## Preview while you edit

```bash
hugo server -D
```

Open <http://localhost:1313>. Save any file and the browser updates by
itself — no rebuild, no refresh. Leave this running the whole time you
are editing. Stop it with `Ctrl+C`.

English is at <http://localhost:1313/> and German at
<http://localhost:1313/de/>. Check both — a change to one language does
not change the other.

## Where to edit what

Text lives in one of three places depending on the page.

### 1. Page prose and news posts → `content/`

Plain Markdown, one file per language.

| Page | English | German |
| --- | --- | --- |
| About — "Our Story" | `content/about/_index.en.md` | `content/about/_index.de.md` |
| Programs — full text | `content/programs/_index.en.md` | `content/programs/_index.de.md` |
| Apply | `content/apply/_index.en.md` | `content/apply/_index.de.md` |
| Contact | `content/contact/_index.en.md` | `content/contact/_index.de.md` |
| Impressum | `content/impressum/_index.en.md` | `content/impressum/_index.de.md` |
| Privacy | `content/datenschutz/_index.en.md` | `content/datenschutz/_index.de.md` |
| News posts | `content/news/*.en.md` | `content/news/*.de.md` |

The `title:` and `description:` at the top of each file set the page
heading and the search-engine summary.

### 2. Home, About and Donate section copy → `i18n/`

The Home, About and Donate pages are built from fixed sections
(hero, stats, cards, FAQ), so their text lives in:

- `i18n/en.toml` — English
- `i18n/de.toml` — German

Both files have the same keys in the same order, grouped by page. To
change the homepage headline, edit `home_hero_headline` in **both**
files. Only ever change the text inside the quotes, not the key name:

```toml
[home_hero_headline]
other = "Empowering Dreams Through Education"
```

### 3. Numbers, bank details and navigation → `config/_default/`

| What | File |
| --- | --- |
| Impact numbers (students, scholarships, years) | `params.toml`, under `[impact]` |
| Bank account, IBAN, PayPal link | `params.toml`, under `[donate]` |
| Colour scheme and appearance | `params.toml` |
| Menu labels, top and footer | `menus.en.toml`, `menus.de.toml` |
| Site title, language settings | `hugo.toml`, `languages.*.toml` |

## Adding a news post

```bash
hugo new content/news/my-post.en.md
```

Then copy it to `my-post.de.md` and translate. Delete the
`draft: true` line to publish. Categories in use: Scholarship Reviews,
Student Achievements, Foundation Updates, Events, Announcements — add a
new one and it appears in the filter automatically.

## Deploy

```bash
./deploy.sh
```

Builds and publishes in about a minute. Pushing to `main` also deploys
automatically via `.github/workflows/hugo.yml`; the script is there for
when you want it live immediately.

## Appearance

In `config/_default/params.toml`:

- `colorScheme` — currently `avocado`. Also available: `blowfish`,
  `bloody`, `fire`, `ocean`, `forest`, `princess`, `neon`, `terminal`,
  `marvel`, `noir`, `autumn`, `congo`, `slate`, `github`, `one-light`.
  The custom pages follow whichever you pick — nothing is hard-coded.
- `autoSwitchAppearance` is `false`, so the site always uses the light
  palette. Set it to `true` to follow the visitor's system preference.

Custom styling lives in `assets/css/custom.css`. Note that Blowfish
ships pre-compiled CSS, so **new Tailwind utility classes will not
work** in custom layouts — add styles to `custom.css` instead.

## If something looks wrong

- **Change not showing?** Check the terminal running `hugo server` for a
  red error, and make sure you edited the file for the language you are
  viewing.
- **Only one language changed?** Expected — edit the matching `.de.md`
  or the `de.toml` key too.
- **Page looks unstyled?** You probably used a Tailwind class that is
  not in the pre-compiled CSS. Use `assets/css/custom.css`.

## Still to do

- Replace the placeholder founding story in `content/about/`.
- Fill in `[donate]` bank details in `params.toml` — the Donate page
  shows "To be added" until then.
- Replace the three sample news posts in `content/news/`.
- Complete the Impressum and Datenschutzerklärung. Both are legally
  required before the site is promoted publicly.
- Phase 2: embed the Tally.so scholarship form and the PayPal button.
