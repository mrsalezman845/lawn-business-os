# Shared partner sync backend

The included `Code.gs` is a lightweight Google Apps Script backend intended for the two owners during startup.

## Setup
1. Open https://script.google.com and create a new project.
2. Replace the starter code with `Code.gs` from this folder.
3. Choose **Deploy -> New deployment -> Web app**.
4. Execute as **Me**.
5. Set access to **Anyone**.
6. Deploy and copy the Web App URL.
7. In Lawn Business OS open **Settings -> Shared partner sync -> Configure**.
8. Enter your name, paste the URL, generate a Plan Key, enable sync, and save.
9. Your partner uses the same URL + Plan Key and their own name.

The app saves locally immediately and checks the shared plan every five seconds.

## Production note
Before a public app-store launch, replace this simple shared-key backend with authenticated accounts, per-business authorization, database backups, audit history, and account/business deletion.
