# VAkE
The VAkE is a versatile next generation controller board that can be used for a 3D printer, CNC router, engraver.  It's build around a powerfull 32-bit STM32F446 MCU. If this wouldn't be enough for your project, you can use the Raspberry Pi header to seamless add a Pi of your choice. Don't bother about the interconnects or power supply, they are all provided for you. You only have to marry both boards.
Below picture shows the RPI 3B+ at the bottom.

![VAkE PCB](https://raw.githubusercontent.com/petervanaken/VAkE/master/Images/Board.jpeg "VAkE PCB")


## Description

- EXP1/EXP2 connector to connect an LCD. 
- onboard SD card
- 5 steppers (X,Y,Z,E0,E1) with Stepstick formfactor in standalone mode or SPI configurable. 
- EXP4 connector to add 3 more steppers
- EXP3 connector ...
- Raspberry Pi through PCB connector with 5V/3A power supply, UART connection to the MCU. GPIO to EXP3
- fused input for 12V - 35V DC power supply
- fused output up to 30A (e.g. heated bed)
- 2 unfused outputs up to 5A (e.g. extruder heater)
- 3 fan outputs
- 1 output to control servo
- 4 thermistor inputs
- 5 endstop inputs of which 1 is configurable for serial/parallel
- reset & user defined buttom
- USB OTG
- ST link connector

