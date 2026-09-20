# Lawn Business OS — Quick Start

## Start using it now
Open `public/index.html` in a modern browser. It autosaves locally.

## Share one live business plan with your partner
1. Open https://script.google.com and create a project.
2. Paste the contents of `Code.gs`.
3. Deploy > New deployment > Web app.
4. Execute as: Me. Access: Anyone.
5. Copy the Web App URL.
6. In the app, open Settings > Configure Shared Sync.
7. Enter your name, paste the URL, generate a Plan Key, enable sync.
8. On your partner's device, use the same URL + Plan Key and their own name.

The app autosaves every edit locally and checks the shared plan every 5 seconds.

## Included day-one business tools
- Customer CRM with phone/email/address/notes
- Recurring mowing price and frequency
- Route/day grouping
- Job scheduling and completion
- Payment method/status
- Expense tracking
- Revenue/profit dashboard
- Lead pipeline and lead-to-customer conversion
- Marketing-spend / acquisition tracking
- Owner-income target
- JSON backups
- Customer/job CSV exports
- PWA/offline support
- Capacitor config for Android + iOS

## Native app builds
Install Node.js, then run `npm install`.
Android: `npx cap add android && npx cap sync android && npx cap open android`
iOS (Mac/Xcode required): `npx cap add ios && npx cap sync ios && npx cap open ios`

## Public-store note
The Apps Script backend is reasonable for a two-partner private startup/testing workflow. Before a public store launch, replace it with authenticated accounts, per-business access control, server-side backups and a shared-data deletion flow.
