<div align="center">

<img src="remnawave-admin.webp" alt="Remnawave Admin" width="100%" />

# Remnawave Admin

**A control panel and Telegram bot on top of your Remnawave panel**

Users, nodes, anti-abuse, mail and monitoring in one place

[![Stars](https://img.shields.io/github/stars/toluol2005/remnawave-admin?style=flat-square&logo=github&logoColor=white&labelColor=1f2430&color=f5c518)](https://github.com/toluol2005/remnawave-admin/stargazers) [![Release](https://img.shields.io/github/v/release/toluol2005/remnawave-admin?style=flat-square&logo=github&logoColor=white&labelColor=1f2430&color=3fb950)](https://github.com/toluol2005/remnawave-admin/releases/latest) [![License](https://img.shields.io/badge/License-AGPL_v3-blue?style=flat-square&logo=gnu&logoColor=white)](LICENSE)

English · [Русский](README.md)

</div>

---

> [!NOTE]
> This is an independently maintained fork of the last free version, **5.2.0**. The original project is no longer maintained as open source, so this repository lives on its own: updates, fixes and improvements happen here. The licensing server and the paid plugin storefront are disabled — the panel sends no data to external servers.

The Remnawave panel owns users and configuration. Remnawave Admin takes care of everything else: it collects connections from your nodes, hunts for subscription sharing and torrents, takes measures, sends notifications, keeps the history and shows you what is going on.

It works on top of your panel over the API and keeps its data in its own database.

## Features

🛡 **Anti-abuse.** Connection analyzers look for subscription sharing and trial farming: simultaneous connections, impossible travel, networks, devices, HWID, User-Agent. Measures, from a warning to the client to speed limits and disabling, can run automatically, and every violation can be reviewed on its card.

🧲 **Torrents.** An Xray routing tag plus traffic inspection on the node: encrypted BitTorrent shows up too, and game launchers or file sync can be marked as “not a torrent”.

🛰 **Node agent.** Xray logs, host metrics, a remote terminal and a script catalogue, speed limits on the node, channel quality towards clients. Installed with one line from the panel.

🚨 **Attacks and outages.** A DDoS detector for nodes, alerts when nodes go down or the channel degrades.

📧 **Mail server.** Your own MX, DKIM, inbound mail, SPF/DKIM/DMARC checks, with no external SMTP provider.

📈 **Monitoring and analytics.** Prometheus metrics and Grafana dashboards, a connection geo map, a hoster rating, analytics for users and nodes.

🤖 **Telegram bot.** Control from the chat, notifications with action buttons, routing to forum topics.

🔌 **API and integrations.** Its own API with keys and permissions, signed webhooks, violations in the Bedolaga cabinet.

Also: an automation builder, scheduled backups, an action log, roles and permissions, 2FA, themes, Russian and English.

## Getting started

1. Clone the repository and create `.env` from the example:

   ```bash
   git clone https://github.com/toluol2005/remnawave-admin.git
   cd remnawave-admin
   cp .env.example .env
   ```

2. Fill in `.env`: the bot token from @BotFather, your Remnawave panel API address and token, your Telegram ID, the PostgreSQL password and `WEB_SECRET_KEY`. The full list of variables is in `.env.example` and the [reference](docs/en/guide/installation.md).

3. Start it:

   ```bash
   docker network create remnawave-network
   docker compose up -d
   ```

4. Open the bot in Telegram (`/start`) and the web panel on port `:3000` — the administrator account is created on first login.

Detailed installation, reverse proxy and webhooks — in the [documentation](docs/en/guide/installation.md).

## Documentation

The documentation lives in [docs/](docs/) (VitePress): installation, anti-abuse, the node agent, mail, monitoring, the API, environment variables, bot commands.

## Licence

GNU AGPL v3.0 with a plugin exception (§7) — see [LICENSE](LICENSE); original versions up to and including 2.15.x remain under MIT. This fork modifies the 5.2.0 codebase; copyright notices of the original authors are preserved in [LICENSE](LICENSE).

<div align="center">

Built for the Remnawave community

</div>
