# App Store Connect API - Vapor Web App Example

This is an example web app built using [vapor](https://vapor.codes) that lets users register their devices to your provisioning profile.

### How to Run

### Mac OS

You need to have Xcode installed. The example was made in `13.2.1`

In the root folder

```bash
open package.swift
```

*note: upon first start resolving the spm packages will take a significant amount of time*

In `Sources/App/routes.swift` add your credentials on the top. See [how to get an API key](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api)

Press run in Xcode

After the server launches visit `localhost:8080` in your browser.

### Dockerized (in swift:5.5-focal)

You need to have [docker](https://docs.docker.com/desktop/mac/install/) installed

In the root folder

Build: `docker compose build`

Run: `docker compose up app`

visit `localhost:8080` in your browser

