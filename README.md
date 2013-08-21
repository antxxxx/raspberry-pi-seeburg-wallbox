Intro
=====

Based on my [Raspberry Pi GPIO Interrupt demo code](https://github.com/phil-lavin/raspberry-pi-gpio-interrupt). Interfaces the RasPi with my
1960s Seeburg Wall-O-Matic 100 to decode the pulse train into the key combination that was pressed.

Interfacing with the Pi
-----------------------

The wallbox works on 25V AC. A simple circuit was used to pass pulses at this voltage to the GPIO pins of the RasPi at the RasPi's required
small current (around 2mA) @ 3.3V DC.

Diagram is as follows:

![seeburg circuit](http://phil-lavin.github.io/raspberry-pi-seeburg-wallbox/seeburg-circuit.png)

Compiling
---------

* Clone the repository
* Follow the instructions at http://wiringpi.com/download-and-install/ to install the WiringPi library on your Pi
* ```gcc -lwiringPi -o pi-seeburg pi-seeburg.c```

Settings
--------

There's a number of defines at the top of the code. You can tweak the GPIO pin that the wallbox circuit is connected to as well as the timings
the code works to. Timings may differ between wall boxes, because of the motor arm RPM, significantly enough that these need tweaking.

The pulse train
---------------

The code analyses and decodes the pulse train. The train comprises of a number of pulses, a noticable time gap and a number of additional pulses.
The code is set up to ignore electrical jitter and pulses unrelated to the train (e.g. when a coin is inserted).

On this model wall box, the pulse train is sequential to represent A1 through to K0. If X represents the number of pulses before the gap and Y
represents the number of pulses after the gap, X increments from 1 to 20 whilst Y stays at 1. Y then increments and X resets back to 1. The cycle
repeats through to X=20, Y=4 for K0.

The decoding is simple maths as shown in the code.

Running
-------
Must be run as root

```
./pi-seeburg
```
