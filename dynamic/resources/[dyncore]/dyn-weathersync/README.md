# dyn-weathersync
Synced weather and time for dyn-Core Framework :sunrise:

# License

    DynCore Framework
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
- [dyn-core](https://github.com/DynCore-framework/dyn-core)

## Features
- Syncs the weather for all players

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure dyn-core
ensure dyn-weathersync
```

## Configuration
You can adjust available weather and defaults in `config.lua`
to adjust weather patterns you need to modify nextWeatherStage() in `server/server.lua`



## Commands

`/freezetime` - Toggle time progression

`/freezeweather` - Toggle dynamic weather

`/weather [type]` - Set weather

`/blackout` - Toggle blackout

`/morning` - Set time to 9am

`/noon` - Set time to 12pm

`/evening` - Set time to 6pm

`/night` - Set time to 11pm

`/time [hour] (minute)` - Set time to whatever you want

## Exports

### nextWeatherStage
Triggers event to switch weather to next stage
```lua
-- LUA EXAMPLE
local success = exports["dyn-weathersync"]:nextWeatherStage();
```
```js
// JAVASCRIPT EXAMPLE
const success = global.exports["dyn-weathersync"].nextWeatherStage();
```


### setWeather [type]
Switch to a specified weather type from Config.AvailableWeatherTypes
```lua
-- LUA EXAMPLE
local success = exports["dyn-weathersync"]:setWeather("snow");
```
```js
// JAVASCRIPT EXAMPLE
const success = global.exports["dyn-weathersync"].setWeather("snow");
```


### setTime [hour] (minute)
Sets sun position based on time to specified
```lua
-- LUA EXAMPLE
local success = exports["dyn-weathersync"]:setTime(8, 10); -- 8:10 AM
```
```js
// JAVASCRIPT EXAMPLE
const success = global.exports["dyn-weathersync"].setTime(15, 30); // 3:30PM
```


### setBlackout (true|false)
Sets or toggles blackout state and returns the state
```lua
-- LUA EXAMPLE
local newStatus = exports["dyn-weathersync"]:setBlackout(); -- Toggle
```
```js
// JAVASCRIPT EXAMPLE
const newStatus = global.exports["dyn-weathersync"].setBlackout(true); // Enable
```


### setTimeFreeze (true|false)
Sets or toggles time freeze state and returns the state
```lua
-- LUA EXAMPLE
local newStatus = exports["dyn-weathersync"]:setTimeFreeze(); -- Toggle
```
```js
// JAVASCRIPT EXAMPLE
const newStatus = global.exports["dyn-weathersync"].setTimeFreeze(true); // Enable
```


### setDynamicWeather (true|false)
Sets or toggles dynamic weather state and returns the state
```lua
-- LUA EXAMPLE
local newStatus = exports["dyn-weathersync"]:setDynamicWeather(); -- Toggle
```
```js
// JAVASCRIPT EXAMPLE
const newStatus = global.exports["dyn-weathersync"].setDynamicWeather(true); // Enable
```


### getBlackoutState
Returns if blackout is enabled or disabled
```lua
-- LUA EXAMPLE
local state = exports["dyn-weathersync"]:getBlackoutState();
```
```js
// JAVASCRIPT EXAMPLE
const state = global.exports["dyn-weathersync"].getBlackoutState();
```


### getTimeFreezeState
Returns if time progression is enabled or disabled
```lua
-- LUA EXAMPLE
local state = exports["dyn-weathersync"]:getTimeFreezeState();
```
```js
// JAVASCRIPT EXAMPLE
const state = global.exports["dyn-weathersync"].getTimeFreezeState();
```


### getWeatherState
Returns the current weather type
```lua
-- LUA EXAMPLE
local currentWeather = exports["dyn-weathersync"]:getWeatherState();
```
```js
// JAVASCRIPT EXAMPLE
const currentWeather = global.exports["dyn-weathersync"].getWeatherState();
```


### getDynamicWeather
Returns if time progression is enabled or disabled
```lua
-- LUA EXAMPLE
local state = exports["dyn-weathersync"]:getDynamicWeather();
```
```js
// JAVASCRIPT EXAMPLE
const state = global.exports["dyn-weathersync"].getDynamicWeather();
```


## Events


`dyn-weathersync:server:RequestStateSync` - Sync time and weather for everyone

`dyn-weathersync:server:setWeather` [type] - Set Weather type (List in Config)

`dyn-weathersync:server:setTime` [hour] (minute) - Set simulated time

`dyn-weathersync:server:toggleBlackout` (true|false) - Enable, disable or toggle blackout

`dyn-weathersync:server:toggleFreezeTime` (true|false) (minute) - Enable, disable or toggle time progression

`dyn-weathersync:server:toggleDynamicWeather` (true|false) - Enable, disable or toggle dynamic weather

