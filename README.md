# TRASE - Content management platform

![TRASE](https://raw.github.com/Vizzuality/TRASE-frontend/master/trase-screenshot.png)


Source code for content management tool of the [TRASE](https://trase.earth) tool.

## About TRASE

Trase brings unprecedented transparency to commodity supply chains revealing new pathways towards achieving a
deforestation-free economy.

## About this project

This project consists of the backend that serves content to the text pages of trase.earth. 

For the source code of the data API, visit [this github repository](https://github.com/Vizzuality/trase-api).

## Configuration

The project's main configuration values can be set using [environment variables](https://en.wikipedia.org/wiki/Environment_variable)

* SECRET_KEY_BASE: Rails secret. Use a large random string here
* TRASE_CONTENT_DATABASE_HOST: host of the postgres database server
* TRASE_CONTENT_DATABASE_NAME: name of the postgres database
* TRASE_CONTENT_DATABASE_USER: name of the postgres user
* TRASE_CONTENT_DATABASE_PASSWORD: password to the postgres user
* RAILS_RELATIVE_URL_ROOT: subpath of the URL where the app is serving content
* TWITTER_CONSUMER_KEY: twitter api credentials 
* TWITTER_CONSUMER_SECRET: twitter api credentials 
* TWITTER_ACCESS_TOKEN_KEY: twitter api credentials
* TWITTER_ACCESS_TOKEN_SECRET: twitter api credentials