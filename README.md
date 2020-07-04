# balena-homebridge

 **⚠️ I have switched to using the [Official Homebridge Raspberry Pi Image](https://github.com/homebridge/homebridge-raspbian-image) ⚠️** As of 2020-07-03, I likely will not be updating this project any more. Please submit an issue if you want to take over maintaining this project.

balenaCloud application for HomeBridge

[![Build Status](https://travis-ci.com/rhwood/balena-homebridge.svg?branch=master)](https://travis-ci.com/rhwood/balena-homebridge)
[![Known Vulnerabilities](https://snyk.io/test/github/rhwood/balena-homebridge/badge.svg)](https://snyk.io/test/github/rhwood/balena-homebridge)

## Setup

You can setup a balena-homebridge computer either remotely or locally. We recommend the remote method since it provides an ability to manage multiple IoT devices from a single dashboard.

### Remote Setup

1. Create an account at [balenaCloud](https://dashboard.balena-cloud.com/).
2. Create an application at balenaCloud that is correct for your hardware.
3. Add a device to your application following the instructions provided by balena.
4. Clone or download this repo (or a fork of this repo) from GitHub.
5. Add the repo for your application to your working copy of this repo.
6. Once your device shows in the dashboard at balena, configure it:
    1. Optionally create an environment variable `HOMEKIT_PIN` set to the value of your choosing in the form `###-##-###` where _#_ is the digits `0-9` or accept the default of `000-00-000`
    2. Optionally create an environment variable `HOMEKIT_USER` set to the value of your choosing in the form `##:##:##:##:##:##` where _#_ is the hexadecimal digits `0-9` or `A-F` or accept the default of `00:11:22:33:44:55`
    3. Optionally create an environment variable `KEEP_CONFIG` set to `yes` or `no`; if set to `yes` (the default if not specified), the config.json will be persisted across application restarts; if set to `no`, the config.json will be overwritten on your device everytime the application is restarted.
    4. Optionally create an environment variable `CONFIG_URL` set to a URL that the desired config.json file can be downloaded from or accept the default value of an empty string which prevents the download from being attempted.
7. Push the contents of your repo towards balenaCloud to complete the installation and initial configuration of your Homebridge device.

### Local Setup

TBD
