======================================
Booting Process
======================================

--------------------------------------
What is Booting Process?.
--------------------------------------

Booting Process is the sequence process of Booting the computer system.And it includes the list of process performed by the computer hardware/software from the time of "Power-On" to the load Operating System completely ready for users to run applications.And below are the list of step by step process involved in Booting Process.

- Power Supply
- Basic Input Output System -BIOS
- Booting Record/Partition Table
- Bootloader - GRUB
- Kernel
- Init
- RunLevel Programs

-------------------------------------
Power Supply
-------------------------------------
Once Computer power turned on and then Power Supply Unit performs some self test and it sends the Power signal to the CPU motherboard and related components if self test succeeded by Power Supply Unit.In-case of if it fails then usually no output at all.

-----------------------------------
Basic Input Output System - BIOS
-----------------------------------
BIOS is an Integrated circuit chip Interface which is programmed with firmware to get the hardware information in your computer and also having some sort of storage known as CMOS(Complimentary Metal Oxide Semiconductor) to keep the hardware settings which is necessary for the Operating System such as location and configuration of Drives and other devices,Memory Speed,CPU Frequency Multiplier etc. BIOS also performs Power On Self Test once power turned up.BIOS would ensure below Check to continue the booting Process:

- Check available Hard Drives and other device are all responding.
- Check that the mouse and Keyboard Memory are connected.
- Check video Card is available and if any problem or not.
- Initialize RAID Controller if it's installed.

BIOS also keeps the Booting Sequence Information to search for an Booting Paritifrom sequence of Booting Device.

-----------------------------------------
Booting Record/Partition Table
-----------------------------------------

Once BIOS identifies the Boot Partition and it look for Booting records which contains Partition Table and Boot Loader information.

 **Boot Loader Information** :

      -- Boot loader information block is where the first program the computer can run is stored.

 **Disk partition Table** :

      -- The parition table stores the information about how the disk drive is logically laid out.

There are two types of Booting Record are available.

- Master Boot Record ( MBR )
- GUID Partition Table ( GPT )


Master Boot Record - MBR
-----------------------------------------

Master Boot Record is the old way of Partition Table and usually available on first sector on the drive.And it occupy only first 512 bytes of space on the drive.And in those first 448 bytes used for Boot loader information and remaining 64 bytes for disk Partition Table. And each 16 bytes in 64 bytes used for each partition.And remaining 2 bytes used for magic number to validation check for bootloader.


GUID Partition Table - GPT
-----------------------------------------

GUID Partition Table is the new way of Parition table and usually available on first and last sector on the drive.In-case of first sector corrupted and able to run from the last sector on the drive like a backup.And globally unique ID used for partition instead of partition number which was used by the MBR.And there is no limit for disk partition table.And it supports more than 2TB for the partition where MBR doesn't support more than 2TB for partition.

---------------------------------------------
Boot Loader
---------------------------------------------
Boot loader is to load the kernel and supporting modules into the memory.there are few common Boot Loader is available.GRUB(GRand Unified Bootloader) most commonly used boot loader for many distributions.And Linux Loader is the other and older version of Boot Loader.

GRUB have knowledge of the filesystem and understand the partition filesystem type where LILO don't have understand the filesystem.

By defining configuration file ,GRUB Boot Loader also wait for user to select required Booting kernel image from the list of installed kernel images.Else it would load into default kernel image.

--------------------------------------
Kernel
--------------------------------------
Kernel mount the filesystem which is specified on boot loader configuration file(grub.conf) and executes the init program.And init is the first program on system which also occupies 1 as ProcessID(PID).

During the boot of kernel initd RAM disk(initd) that was loaded into memory and serves as a temporary root system until allows kernel to fully boot without having to mount any physical disks.

Kernel can be very small but still support large number of possible hardware configurations. After kernel is booted ,the root file system is pivoted(via pivot_roo) where initrd root file system is unmounted and the real root file system is mounted.

---------------------------------------
Init
---------------------------------------

Init is the program to identies the default init level from inittab and uses that to load all appropraite programs.

Init default level are defined under *initdefault* in /etc/inittab.

Boot the system with required init level which is mentioned below by appropriate needs.

- 0 - Halt.
- 1 - Single User Mode.
- 2 - Local MultiUser without networking/NFS.
- 3 - Full MutliUser with Networking.
- 4 - Not Used (User defineable).
- 5 - Graphical Mode (with X11 System).
- 6 - Reboot.

--------------------------------------
Run Level Programs
--------------------------------------
Run Level Programs is the programs to run the programs on appropriate run level which system started by init program.

These programs are would start and kill according to run level and it is defined in /etc/rc.d/rcX.d/  where X is the init Level.

Run Level 0 - /etc/rc.d/rc0.d/
Run Level 1 - /etc/rc.d/rc1.d/ etc..

And in these directories usually contains the services and also mentioned as to start the service or need to kill the service on those levels when system booting up.

Example :

- S80sendmail - /etc/rc.d/rc3.d/  
 
     It means *sendmail* service need to be start(S) while system booting up on init level 3 and in the sequence number of this *sendmail* service is 80.

- K12syslog - /etc/rc.d/rc5.d/

   It means *syslog* service need to be kill(K) while system booting up on init level 5 and in the sequence number of this *syslog* service is 12.
