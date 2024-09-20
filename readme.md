# Lighthouse - Hardware

## basic concept

+ lighthouse
+ buoy: hand sender, ble advertising

## lighthouse - electronics

### main board

- RF-MCU: nRF52840: [NINA-B302-00B Module](https://www.mouser.ch/ProductDetail/377-NINA-B302-00B) (ublox)
  - SWDIO connector (50 mil header)
  - RTC (optional): i2c + backup battery CV
  - sound module: [DFPlayer mini](https://wiki.dfrobot.com/DFPlayer_Mini_SKU_DFR0299)
  - display 1: display time
  - display 2: lighting, simulate sunrise
  - Buttons
  - Sensors
    - ambient light sensor (ALS)
      - [VEML7700-TR](https://www.mouser.ch/ProductDetail/78-VEML7700-TR)
      - [TMD37253M](https://www.mouser.ch/ProductDetail/985-TMD37253M) much more than ALS, also proximity and color sensor
      - also maybe [VEML3235](https://www.mouser.ch/ProductDetail/78-VEML3235), [VEML6035](https://www.mouser.ch/ProductDetail/78-VEML6035)
    - rh sensor
      - [SHT40-AD1B-R2](https://www.mouser.ch/ProductDetail/403-SHT40-AD1B-R2)
    - p sensor
      - [DPS368XTSA1](https://www.mouser.ch/ProductDetail/726-DPS368XTSA1)
    - microphone, maybe implement a "do I snore" functionality
      - [CMM-4030DT-26354-TR](https://www.mouser.ch/ProductDetail/490-CMM4030DT26354TR)

### display

- addressable LEDs: [IN-PI22TAT5R5G5B](https://www.mouser.ch/ProductDetail/743-IN-PI22TAT5R5G5B)

### buoy - electronics

- RF-MCU: nRF52811 module [ISP1907-LL-RS](https://www.mouser.ch/ProductDetail/359-ISP1907-LL-RS)
- battery CR2032
- vibration sensor [Adafruit 2384](https://www.mouser.ch/ProductDetail/485-2384)
- button PTS526 [PTS526 SK15 SMTR2 LFS](https://www.mouser.ch/ProductDetail/611-PTS526SK15SMR2L)
- SWDIO connector (50 mil header)

#### schematics

buoy will be soldered together using wire only, no pcb for this.

![buoy_schematics](docs/buoy_schematics.png)

# links

just a collection of (maybe) useful links

- [markdown cheat sheet](https://www.markdownguide.org/cheat-sheet/)

# ideas

- add many sensors like
  - microphone, analyze snoring
- add memory/flash to log
  - sensor values
  - events
  - errors, ...