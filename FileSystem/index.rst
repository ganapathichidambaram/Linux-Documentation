Linux File System
==========================

What is File System
--------------------------

        File System is a methods and structure of data that an operating system used to keep track the files and control the data are organized in the disk or partition.

        File system logically defined the files in the disk by mentioned below :

                - **Sharable** - It can be accessed locally or by remote host.
                - **unsharable** - Only It can be accessed locally.
                - **Variable** - These files can able to change at any time such as documents.
                - **Static** - Static Binaries which is do not change without administrator permission.It used to execute the program to the user.


Types of File systems
-------------------------------

	#. Disk File Systems
	#. Flash File Systems
	#. Tape File Systems
	#. Database File Systems
	#. Transactional File Systems
	#. Network File Systems
	#. Shared disk File Systems
	#. Special File Systems
	#. Minimal File Systems

#. Disk File Systems :

	Ability of disk storage media to randomly address data in a short amount of time.Additional considerations include the speed 
	of accessing data following that initially requested and the anticipation that the following data may also be requested. This 
	permits multiple users (or processes) access to various data on the disk without regard to the sequential location of the data.
	Some disk file systems are journaling file systems or versioning file systems.

	Here are some of Disk File Systems are : 

		- FAT (FAT12, FAT16, FAT32), 
		- exFAT, 
		- NTFS, 
		- HFS and HFS+, HPFS, 
		- UFS, 
		- ext2, ext3, ext4, 
		- XFS, 
		- btrfs, 
		- ISO 9660, 
		- Files-11, 
		- Veritas File System, 
		- VMFS, 
		- ZFS, 
		- ReiserFS and UDF. 

	ISO 9660 and Universal Disk Format (UDF) are two common formats that target Compact Discs, DVDs and Blu-ray discs.

#. Flash File Systems :

	A flash file system considers the special abilities, performance and restrictions of flash memory devices. Frequently a disk 
	file system can use a flash memory device as the underlying storage media but it is much better to use a file system 
	specifically designed for a flash device.

#. Tape File Systems :

	A tape file system is a file system and tape format designed to store files on tape in a self-describing form. Magnetic tapes 
	are sequential storage media with significantly longer random data access times than disks, posing challenges to the creation 
	and efficient management of a general-purpose file system.

	In a disk file system there is typically a master file directory, and a map of used and free data regions. Any file additions, 
	changes, or removals require updating the directory and the used/free maps. Random access to data regions is measured in 
	milliseconds so this system works well for disks.

#. Database file systems :

	Another concept for file management is the idea of a database-based file system. Instead of, or in addition to, hierarchical 
	structured management, files are identified by their characteristics, like type of file, topic, author, or similar rich 
	metadata.

#. Transactional file systems :

	Some programs need to update multiple files "all at once". For example, a software installation may write program binaries, 
	libraries, and configuration files. If the software installation fails, the program may be unusable. If the installation is 
	upgrading a key system utility, such as the command shell, the entire system may be left in an unusable state.

	Transaction processing introduces the isolation guarantee, which states that operations within a transaction are hidden from 
	other threads on the system until the transaction commits, and that interfering operations on the system will be properly 
	serialized with the transaction. Transactions also provide the atomicity guarantee, ensuring that operations inside of a 
	transaction are either all committed or the transaction can be aborted and the system discards all of its partial results. 
	This means that if there is a crash or power failure, after recovery, the stored state will be consistent. Either the software 
	will be completely installed or the failed installation will be completely rolled back, but an unusable partial install will 
	not be left on the system.

	Journaling file systems are one technique used to introduce transaction-level consistency to file system structures. Journal 
	transactions are not exposed to programs as part of the OS API; they are only used internally to ensure consistency at the 
	granularity of a single system call.

#. Network File Systems :

	A network file system is a file system that acts as a client for a remote file access protocol, providing access to files on a 
	server. Programs using local interfaces can transparently create, manage and access hierarchical directories and files in 
	remote network-connected computers. 

	Examples of network file systems include clients for the 

		- NFS,
		- AFS, 
		- SMB protocols, 

	And file-system-like clients for 

		- FTP
		- WebDAV.

#. Shared disk file systems :

	A shared disk file system is one in which a number of machines (usually servers) all have access to the same external disk 
	subsystem (usually a SAN). The file system arbitrates access to that subsystem, preventing write collisions. 
	
	Examples include 
	
		- GFS2 from Red Hat, 
		- GPFS from IBM, 
		- SFS from DataPlow, 
		- CXFS from SGI and 
		- StorNext from Quantum Corporation.

#. Special file systems :

	A special file system presents non-file elements of an operating system as files so they can be acted on using file system 
	APIs. This is most commonly done in Unix-like operating systems, but devices are given file names in some non-Unix-like 
	operating systems as well.

	#. Device file systems :

		A device file system represents I/O devices and pseudo-devices as files, called device files. Examples in Unix-like systems include devfs and, in Linux 2.6 systems, udev. In non-Unix-like systems, such as TOPS-10 and other operating systems influenced by it, where the full filename or pathname of a file can include a device prefix, devices other than those containing file systems are referred to by a device prefix specifying the device, without anything following it.

	#. Other special file systems :

		- In the Linux kernel, configfs and sysfs provide files that can be used to query the kernel for information and configure entities in the kernel.

		- procfs maps processes and, on Linux, other operating system structures into a filespace.

#. Minimal File System :


Linux File System Hierarchy
-------------------------------

	- **/boot/** 
         
		Directory contains static files required to boot the system such as kernel.

	- **/dev/**

		Directory contains the device nodes that either represent devices that are attached to the system or virtual devices that are provided by the kernel.The *udev* dameon takes care of creating and removing all these device node on this directory.

	- **/etc/**

		Reserved for configuration files that are required to the local machine.

	- **/lib/**

		Directory should contain the libraries needed to execute binaries are located on */bin/* and */sbin/*. It is necessary to executes the commands within the root file system.

	- **/media/**

		Directory should used as mount point for removal media such as DVD-ROM or USB storage media stick.

	- **/mnt/**

		Directory reserved for temporary mounted file systems.

	- **/opt/**

		Directory to hold storage for most of application packages.It hold the manual files,binaries etc,.

	- **/proc/**

		Contains special files that either extract information from or send information to the kernel.for example it contain system memory,cpu information and other hardware information etc.

	- **/sbin/**

		Contains System binaries by the root user.It is used at boot time. It is essential for booting,restoring,recovering,repairing the system.

	- **/srv/**

		Directory contains site-specific data served by your system.It gives users the location of data files for particular service.

	- **/sys/**

		It contains the information about device similarly held i /proc/ directory. and also it utilizes the new systfs virtual file system specific to the 2.6 kernel.

	- **/usr/** 

		Directory for the user level accessing files for configuration,binaries,libraries.And it contain the files that can shared across multiple machines.

	- **/var/**

		Directory for any programs to write logs or any other data need to stored by the programs.


Filesystem comparison
------------------------

+-------------+-------------------+---------------+-----------------+----------------+--------------+
| FS Name     | Year Introduced   | Original OS   | Max File Size   | Max FS Size    | Journaling   |
+=============+===================+===============+=================+================+==============+
| FAT16       | 1983              | MSDOS V2      | 4GB             | 16MB to 8GB    | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| FAT32       | 1997              | Windows 95    | 4GB             | 8GB to 2TB     | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| HPFS        | 1988              | OS/2          | 4GB             | 2TB            | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| NTFS        | 1993              | Windows NT    | 16EB            | 16EB           | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| HFS+        | 1998              | Mac OS        | 8EB             | ?              | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| UFS2        | 2002              | FreeBSD       | 512GB to 32PB   | 1YB            | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| ext2        | 1993              | Linux         | 16GB to 2TB4    | 2TB to 32TB    | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| ext3        | 1999              | Linux         | 16GB to 2TB4    | 2TB to 32TB    | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| ReiserFS3   | 2001              | Linux         | 8TB8            | 16TB           | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| ReiserFS4   | 2005              | Linux         | ?               | ?              | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| XFS         | 1994              | IRIX          | 9EB             | 9EB            | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| JFS         | ?                 | AIX           | 8EB             | 512TB to 4PB   | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| VxFS        | 1991              | SVR4.0        | 16EB            | ?              | Y            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+
| ZFS         | 2004              | Solaris 10    | 1YB             | 16EB           | N            |
+-------------+-------------------+---------------+-----------------+----------------+--------------+


Sizes Table
---------------

+------------------+--------------+
| Kilobyte - KB    | 1024 Bytes   |
+------------------+--------------+
| Megabyte - MB    | 1024 KBs     |
+------------------+--------------+
| Gigabyte - GB    | 1024 MBs     |
+------------------+--------------+
| Terabyte - TB    | 1024 GBs     |
+------------------+--------------+
| Petabyte - PB    | 1024 TBs     |
+------------------+--------------+
| Exabyte - EB     | 1024 PBs     |
+------------------+--------------+
| Zettabyte - ZB   | 1024 EBs     |
+------------------+--------------+
| Yottabyte - YB   | 1024 ZBs     |
+------------------+--------------+


Creating a FileSystem
------------------------

	Before creating a filesystem make sure the disk which you need to create is already unmounted or not.If not then unmount the same.And kindly note down creating filesystem would lost of entire data on the disk.

	- fdisk -l 

		It would list down all the available devices on the system.get the disk partition name from this command.

	- umount /dev/sdb1

		It should the un mount the hard disk from the system.

	- mkfs.vfat /dev/sdb1 -n DiskName

		It should format the disk partition which is specified and make the filesystem.

		mkfs 

			mkfs is used to build a Linux filesystem on a device, usually a hard disk partition. The device argument is either the device name (e.g. /dev/hda1, /dev/sdb2), or a regular file that shall contain the filesystem. The size argument is the number of blocks to be used for the filesystem.
		vfat

			Formats the drive to FAT32 as filesystem type.And other formats available are 

				mkfs.bfs, 
				mkfs.ext2, 
				mkfs.ext3, 
				mkfs.ext4, 
				mkfs.minix, 
				mkfs.msdos, 
				mkfs.vfat, 
				mkfs.xfs, 
				mkfs.xiafs etc

		/dev/sdb1 

			Disk partition name on the disk should going to build the filesystem.

		- n :

			Sets the volume name (label) of the filesystem. The volume name can
           		be up to 11 characters long. The default is no label.DiskName is the name which you required for the filesystem.

           		Optional Field.And it may vary depend upon the Filesystem.For Example Label option should be -L for NTFS Filesystem.






