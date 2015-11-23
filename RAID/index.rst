=============================================
RAID - Redundant Array of Independent Disks
=============================================

------------------------------------------
What is RAID ?
------------------------------------------

Redundant Array of Independent Disks(RAID) is a stroage virtualization technology to improve data redundancy or performance improvement by creating logical unit of storage with help of multiple disk drive components.
Data is distributed across the drives in one of the several ways ,referred to as RAID levels,depending on the specific level of redundancy and performance required. The different Schemes or architectures are named by the word RAID followed by a number(eg.RAID 0,RAID 1). Each scheme provides a difference balance between the key goals:reliabitiy,availablity,performance,capacity. RAID levels greater than RAID 0 provide protection against unrecoverable(sector) read errors,as well as whole disk failure.


Data Striping
-------------------------------------------
Data Striping is the technique of segmenting/dividing logically sequential data,and then distributing the data across multiple storage devices.Striping is useful when a processing device requests data more quicker than a single storage device can provide it.It only provides excellent I/O performance ,there is no redundancy.

Data Mirroring
-------------------------------------------

Data Mirroring is the technique of storing the same set of data blocks across the multiple storage devices.Mirroring is useful for when one of storage device failure in a group of storage devices which is configured as data mirrored technique.

Data Parity
--------------------------------------------

Data Parity is the technique of storing the parity information data on dedicated disk or distributed across all the disk in RAID group of disks.Parity information are the sum(XOR) of the elemets which is storing on the all the remaining disk in RAID.In-case of one disk failure then losing data would calculated by subtracting the remaining data across the RAID set.

-----------------
RAID 0
-----------------

RAID 0 is the one of the RAID Level and it provides excellent performance with minimum of 2 hard disk. 

- Excellent performance (Striping)
- Data Blocks are striped between the disks.
- Minimum of 2 disks
- No Redundancy/Mirror/Parity.
- Not advisable for any critical system.


-------------------------
RAID 1
-------------------------

RAID 1 is the one of the RAID level and it provides good performance with minimum of 2 hard disks and data are mirroring between the disks.

- Excellent Redundancy (Mirroring)
- Good Performance
- Minimum of 2 disks
- No Striping/ Parity.

---------------------------
RAID 5
---------------------------

RAID 5 is the one of the RAID level and it provides Good redundancy and performance with minimum of 3 hard disks.

- Good Performance (Data Striping)
- Good redundancy (Distributed parity)
- Minimum of 3 disks.
- No Mirroring.

---------------------------
RAID 10
---------------------------

RAID 10 is one of the RAID level and it provides Excellent Performance and redundancy with minimum of 4 disks.

- Excellent redundancy ( Data Mirroring )
- Excellent Peformance ( Data Striping )
- Minimum of 4 disks
- Combination of RAID 1 and RAID 0.

Data blocks are striped between mirrored data group of disks.
