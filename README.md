# enterprise-archive

Read-only archive of legacy projects (2002–2023): VB6/VB.NET/Delphi desktop apps, WordPress/Drupal/Magento sites, Node/React/NestJS apps, and embedded/.NET tooling. Kept for reference; **not maintained**.

## Layout

| Directory | Contents |
|---|---|
| `alkafry-co/`, `communication-department/`, `eblatech/`, `eurikatech/`, `jabbour/`, `loavi/`, `ministry-of-information/`, `petrotech/`, `samagroup/`, `service-media-and-alanatic-center/`, `sja/`, `syrian-private-univercity/`, `techalients/` | Source, newest version of each project, dependencies removed |
| `windows-apps/` | Prebuilt Windows executables, one folder per app (newest build) |
| `docs/` | Manifests: what was kept, what was left out and why |

## Prerequisites

- To inspect code: any editor and `git`.
- To run `windows-apps/*`: Windows 7+ x86/x64. Many apps are 2003–2013 era and need the .NET Framework 2.0–4.x or VB6 runtime. Some also need a local database that is not included.

## Running

This is an archive, so there is no dev/staging/production deployment. To try an app on Windows, open `windows-apps/<AppName>/` and run the `.exe` inside it. See `docs/WINDOWS_APPS_MANIFEST.md` for which exe belongs to which project.

To rebuild a Node project, run `npm install` inside it. `node_modules` is intentionally not included.

## Moved to separate repositories

`mountain-breeze` and `arab-engineering-industries` have their own archived repos with full history; see `docs/SPLIT_REPOS.md`.

## What is not included

Dependencies and build output, archives (`.tar`/`.zip`/`.rar`), database dumps, third-party or licensed code, and anything containing credentials or private keys. See `docs/EXCLUDED.md`.
