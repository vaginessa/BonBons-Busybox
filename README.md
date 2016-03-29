*Taken from http://www.busybox.net/*:
### BusyBox: The Swiss Army Knife of Embedded Linux

BusyBox combines tiny versions of many common UNIX utilities into a single small executable.
It provides replacements for most of the utilities you usually find in GNU fileutils, shellutils, etc.
The utilities in BusyBox generally have fewer options than their full-featured GNU cousins;
however, the options that are included provide the expected functionality and behave very much
like their GNU counterparts. BusyBox provides a fairly complete environment for any small or embedded system.

BusyBox has been written with size-optimization and limited resources in mind. It is also extremely
modular so you can easily include or exclude commands (or features) at compile time.
This makes it easy to customize your embedded systems. To create a working system, just add
some device nodes in /dev, a few configuration files in /etc, and a Linux kernel.

BusyBox is maintained by [Denys Vlasenko] (vda.linux@googlemail.com), and licensed under the
[GNU GENERAL PUBLIC LICENSE] (http://www.busybox.net/license.html) version 2. (Can also be found in this projects root folder)

### Who are the Busybox developers?

The following login accounts currently exist on busybox.net.
(I.E. these people can commit patches into the Busybox, uClibc, and buildroot projects.)
```
aldot     :Bernhard Reutner-Fischer
andersen  :Erik Andersen      - uClibc and BuildRoot maintainer
bug1      :Glenn McGrath
davidm    :David McCullough
gkajmowi  :Garrett Kajmowicz  - uClibc++ maintainer
jbglaw    :Jan-Benedict Glaw
jocke     :Joakim Tjernlund
landley   :Rob Landley
lethal    :Paul Mundt
mjn3      :Manuel Novoa III
osuadmin  :osuadmin
pgf       :Paul Fox
pkj       :Peter Kjellerstedt
prpplague :David Anders
psm       :Peter S. Mazinger
russ      :Russ Dill
sandman   :Robert Griebl
sjhill    :Steven J. Hill
solar     :Ned Ludd
timr      :Tim Riker
tobiasa   :Tobias Anderberg
vapier    :Mike Frysinger
vda       :Denys Vlasenko     - Busybox maintainer
```

## BonBons Busybox Installer

##### These are my builds of the busybox build for ARM, ARM64, x86 and MIPS devices, designed to be used on an android device

### **Why use these builds?**
##### Compared to other busybox builds, I have few additional applets added and other obsolete ones removed.
##### There's also some speed and size tweaks in place. But the main improvement, is the three busybox versions:

**A Full build**, that has all the applets an android user could ever dream of.
Android ROM and OS creators could benefit from including the full build to
their packages as it has every single applet an android system might need.

**A modular build**, that is suited for everyday users. It's just what you need if someone
or something needs busybox installed. It has everything needed for regular android use

**A minimalistic build**, that only has core applets often needed for scripting.
**It's ideal for mod makers or other script creators to include the minimalistic build
inside their work, for ensured compatibility and speed / size optimizations!

## More info and proper download links can be found on this projects XDA thread, [here] (http://forum.xda-developers.com/android/software-hacking/busybox-bonbon-s-busybox-t3253400)

## Build info and other documents

#### **Seting up the source**

Well this one's easy, just download the whole source and blace it somewhere on your computer

#### **Building**

Thanks to some bashy magic all you have to do is:
1. Navigate to the folder you downloaded the source using a terminal
2. Call the BUILD script with the specifications you want to build
3. Wait for the build to finish
4. Done!

#### **The BUILD script**

Parameters:

