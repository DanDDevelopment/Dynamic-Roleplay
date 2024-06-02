# dyn-phone
Advanced Phone for dyn-Core Framework :iphone:

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

## Dependencies
- [dyn-core](https://github.com/qbcore-framework/dyn-core)
- [apex_lawenforcement](https://github.com/qbcore-framework/apex_lawenforcement) - MEOS, handcuff check etc. 
- [dyn-crypto](https://github.com/qbcore-framework/dyn-crypto) - Crypto currency trading 
- [dyn-lapraces](https://github.com/qbcore-framework/dyn-lapraces) - Creating routes and racing 
- [dyn-houses](https://github.com/qbcore-framework/dyn-houses) - House and Key Management App
- [dyn-garages](https://github.com/qbcore-framework/dyn-garages) - For Garage App
- [dyn-banking](https://github.com/qbcore-framework/dyn-banking) - For Banking App
- [screenshot-basic](https://github.com/citizenfx/screenshot-basic) - For Taking Photos
- A Webhook for hosting photos (Discord or Imgur can provide this)


## Screenshots
![Home](https://cdn.discordapp.com/attachments/921675245360922625/921675439783673897/home.jpg)
![Bank](https://cdn.discordapp.com/attachments/921675245360922625/921675441142644756/bank.jpg)
![Advert](https://cdn.discordapp.com/attachments/921675245360922625/921675440878415872/advert.jpg)
![Mail](https://cdn.discordapp.com/attachments/921675245360922625/921675440278614068/mail.jpg)
![Garage](https://cdn.discordapp.com/attachments/921675245360922625/921675439590760528/garage.jpg)
![Garage Detail](https://cdn.discordapp.com/attachments/921675245360922625/921675441591422986/garage_in.jpg)
![services](https://cdn.discordapp.com/attachments/921675245360922625/921675458670641152/services.jpg)
![Houses](https://cdn.discordapp.com/attachments/921675245360922625/921675440005988362/house.jpg)
![Racing](https://cdn.discordapp.com/attachments/921675245360922625/921675458423173140/race.jpg)
![Crypto](https://cdn.discordapp.com/attachments/921675245360922625/921675457718517820/qbit.jpg)
![Gallery](https://cdn.discordapp.com/attachments/921675245360922625/921675441381736448/gallery.jpg)
![MEOS](https://cdn.discordapp.com/attachments/921675245360922625/921675440488341534/meos.jpg)
![Twitter](https://cdn.discordapp.com/attachments/921675245360922625/921675459270438922/twitter.jpg)
![Settings](https://cdn.discordapp.com/attachments/921675245360922625/921675458905513984/setting.jpg)
![Whatsapp](https://cdn.discordapp.com/attachments/921675245360922625/921675459517906944/whatsapp.jpg)
![Phone](https://cdn.discordapp.com/attachments/921675245360922625/921675440677064745/phone.jpg)

## Features
- Garages app to see your vehicle details
- Mails to inform the player
- Banking app to see balance and transfer money
- Racing app to create races
- App Store to download apps
- MEOS app for polices to search
- Houses app for house details and management

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Import `dyn-phone.sql` in your database
- Add the following code to your server.cfg/resouces.cfg
```
ensure dyn-core
ensure screenshot-basic
ensure dyn-phone
ensure apex_lawenforcement
ensure dyn-crypto
ensure dyn-lapraces
ensure dyn-houses
ensure dyn-garages
ensure dyn-banking
```

## Configuration
```

Config = Config or {}

Config.RepeatTimeout = 2000 -- Timeout for unanswered call notification
Config.CallRepeats = 10 -- Repeats for unanswered call notification
Config.OpenPhone = 244 -- Key to open phone display
Config.PhoneApplications = {
    ["phone"] = { -- Needs to be unique
        app = "phone", -- App route
        color = "#04b543", -- App icon color
        icon = "fa fa-phone-alt", -- App icon
        tooltipText = "Phone", -- App name
        tooltipPos = "top",
        job = false, -- Job requirement
        blockedjobs = {}, -- Jobs cannot use this app
        slot = 1, -- App position
        Alerts = 0, -- Alert count
    },
}
```
## Setup Webhook in `server/main.lua` for photos
Set the following variable to your webhook (For example, a Discord channel or Imgur webhook)
### To use Discord:
- Right click on a channel dedicated for photos
- Click Edit Channel
- Click Integrations
- Click View Webhooks
- Click New Webhook
- Confirm channel
- Click Copy Webhook URL
- Paste into `WebHook` in `server/main.lua`
```
local WebHook = ""
```
