Users and Groups
======================================

	Linux/Unix operating systems have the ability to multitask in a manner similar to other operating systems. However, Linux’s major difference from other operating systems is its ability to have multiple users. Linux was designed to allow more than one user to have access to the system at the same time.

	The *user* of the system is either a human being or an account used by specific applications identified by a unique numerical 
	identification number called user ID (UID). Users within a group can have read permissions, write permissions, execute 
	permissions or any combination of read/write/execute permissions for files owned by that group.

	A *group* is an organization unit tying users together for a common purpose, which can be reading permissions, writing permission, or executing permission for files owned by that group. Similar to UID, each group is associated with a group ID (GID).


/etc/passwd
-----------------

		It stores user account information, which is required during login.It contains a list of the system's accounts, giving for each account some useful information like user ID, group ID, home directory, shell, etc. It should readable by many utilities, but write access only for the root user's.

		Each entry on this file should be mentioned below ::	

		 ganapathi:x:501:501:Ganapathi Chidambaram:/home/ganapathi:/bin/bash

		#. **Username**: It is username which is used to logs into the system. It should be between 1 and 32 characters in length.

		#. **Password**: An x character indicates that password is encrypted and saved password would be available in /etc/shadow file.

		#. **User ID (UID)**: The numerical equivalent of the username which is referenced by the system and applications when determining access privileges.Each user must be assigned a user ID (UID). UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups.And UID reservation range can be able to modify through /etc/login.defs.

		#. **Group ID (GID)**: The numerical equivalent of the primary group name which is referenced by the system and applications when determining access privileges.The primary group ID for the user.
		
		#. **User ID Info**: The comment field. It allow you to add extra information about the users such as user's full name, phone number etc. This field use by finger command.
		
		#. **Home directory**: The absolute path to the directory the user will be in when they log in. If this directory does not exists then users directory becomes /
		
		#. **Command/shell**: The program automatically launched whenever a user logs in. This is usually a command interpreter (often called a shell). Under Red Hat Enterprise Linux, the default value is /bin/bash. If this field is left blank, /bin/sh is used. If it is set to a non-existent file, then the user will be unable to log into the system.

/etc/shadow
-----------------

		Individual users on the system are provided with shadow passwords. Encrypted password hashes are stored in here, which is readable only by the root user, and store information about password aging as well. 

		Each entry on this file should be mentioned below ::	

		 ganapathi:$1$.QKDPc5E$SWlkjRWexrXYgc98F.:12825:0:90:5:30:13096:

		This line shows the following information for user ganapathi:

			- The password was last changed February 11, 2005
			- There is no minimum amount of time required before the password can be changed
			- The password must be changed every 90 days
			- The user will get a warning five days before the password must be changed
			- The account will be disabled 30 days after the password expires if no login attempt is made
			- The account will expire on November 9,2005.


		#. **Username**: Username to login into the system.

		#. **Password**: The 13 to 24 character password. The password is encrypted using either the *crypt* library function  or the md5 hash algorithm. In this field, values other than a validly-formatted encrypted or hashed password are used to control user logins and to show the password status. For example, if the value is `!` or `*`, the account is locked and the user is not allowed to log in. If the value is !! a password has never been set before (and the user, not having set a password, will not be able to log in).

		#. **Last password change (lastchanged)** : The number of days since January 1, 1970 (also called the epoch) that the password was last changed. This information is used in conjunction with the password aging fields that follow.
		
		#. **Minimum** : The minimum number of days that must pass before the password can be changed.
		
		#. **Maximum** : The number of days that must pass before the password must be changed.
		
		#. **Warn** : The number of days before password expiration during which the user is warned of the impending expiration.
		
		#. **Inactive** : The number of days after a password expires before the account will be disabled.
		
		#. **Expire** :  The date (stored as the number of days since the epoch) since the user account has been disabled.


/etc/group
-----------------
		
		It defines the groups to which users belong under Linux and UNIX operating system. Under Unix / Linux multiple users 
		can be categorized into groups.The use of groups allows additional abilities to be delegated in an organized fashion, 
		such as access to disks, printers, and other peripherals. This method, amongst others, also enables the Superuser to 
		delegate some administrative tasks to normal users.

		Each entry on this file should be mentioned below ::	
		
		 ganapathi:x:24:ganapathi,raja

		#. **group_name**: It is the name of group. If you run ls -l command, you will see this name printed in the group field.

		#. **Password**: Generally password is not used, hence it is empty/blank. It can store encrypted password. This is useful to implement privileged groups.

		#. **Group ID (GID)**: The numerical equivalent of the group name. It is used by the operating system and applications when determining access privileges.

		#. **Group List** : It is a list of user names of users who are members of the group. The user names, must be separated by commas.

/etc/gshadow
-----------------

		Each Group on the system are provided with shadow passwords. Encrypted password hashes are stored in here, which is readable only by the root user group, and store information about password aging as well. 

		Each entry on this file should be mentioned below ::	
		
		 ganapathi:x:ganapathi:ganapathi,raja

		#. **Group name** — The name of the group. Used by various utility programs as a human-readable identifier for the group.

		#. **Encrypted password** — The encrypted password for the group. If set, non-members of the group can join the group by typing the password for that group using the newgrp command. If the value of this field is !, then no user is allowed to access the group using the newgrp command. A value of !! is treated the same as a value of ! — however, it also indicates that a password has never been set before. If the value is null, only group members can log into the group.
		
		#. **Group administrators** — Group members listed here (in a comma delimited list) can add or remove group members using the gpasswd command.
		
		#. **Group members** — Group members listed here (in a comma delimited list) are regular, non-administrative members of the group

/etc/login.defs
-----------------

		Under Linux password related utilities and config file(s) comes from shadow password suite.It defines the site-specific configuration for this suite.The lines consist of a configuration name and value, separated by whitespace.Absence of this file will not prevent system operation, but will probably result in undesirable operation.

		Blank lines and comment lines are ignored. Comments are introduced with a “#” pound sign and the pound sign must be the first non-white character of the line.

		Parameter values may be of four types: strings, booleans, numbers, and long numbers. A string is comprised of any printable characters. A boolean should be either the value “yes” or “no”. An undefined boolean parameter or one with a value other than these will be given a “no” value. Numbers (both regular and long) may be either decimal values, octal values (precede the value with “0”) or hexadecimal values (precede the value with “0x”). The maximum value of the regular and long numeric parameters is machine-dependent.

		The following configuration items are provided:

		- **CHFN_AUTH (boolean)** :    If yes, the chfn and chsh programs will require authentication before making any changes, unless run by the superuser.

		- **CHFN_RESTRICT (string)** :   This parameter specifies which values in the gecos field of the /etc/passwd file may be changed by regular users using the chfn program. It can be any combination of letters f ,r, w, h, for Full name, Room number, Work phone, and Home phone, respectively. For backward compatibility, “yes” is equivalent to “rwh” and “no” is equivalent to “frwh”. If not specified, only the superuser can make any changes. The most restrictive setting is better achieved by not installing chfn SUID.

		- **DEFAULT_HOME** : Should login be allowed if we can't cd to the home directory?. Default in no.So change it as Yes for cd to the home directory.

		- **ENCRYPT_METHOD** : Encryption method for the password entered by the user.More complicated algorithm is used to difficult to brute forcing the password.

		- **ENV_PATH** & **ENV_SUPATH** - Default Environment path for normal user and super user login.This is must be defined to successful login of user into the system.

		- **FAILLOG_ENABLE** : Enable logging and display of /var/log/faillog login failure info.

		- **GID_MAX (number), GID_MIN (number)** : Range of group IDs to choose from for the useradd and groupadd programs.

		- **MAIL_DIR (string)** : The mail spool directory. This is needed to manipulate the mailbox when its corresponding user account is modified or deleted. If not specified, a compile-time default is used.

		- **PASS_MAX_DAYS (number)** : The maximum number of days a password may be used. If the password is older than this, a password change will be forced. If not specified, -1 will be assumed (which disables the restriction).

		- **PASS_MIN_DAYS (number)** :  The minimum number of days allowed between password changes. Any password changes attempted sooner than this will be rejected. If not specified, -1 will be assumed (which disables the restriction).

		- **PASS_WARN_AGE (number)** :  The number of days warning given before a password expires. A zero means warning is given only upon the day of expiration, a negative value means no warning is given. If not specified, no warning will be provided.

		- **UID_MAX (number), UID_MIN (number)** : Range of user IDs to choose from for the useradd program.

		- **UMASK (number)** : The permission mask is initialized to this value. If not specified, the permission mask will be initialized to 022.

		- **USERDEL_CMD (string)** :    If defined, this command is run when removing a user. It should remove any at/cron/print jobs etc. owned by the user to be removed (passed as the first argument).

		

		The following cross reference shows which programs in the shadow password suite use which parameters.

			- chfn  CHFN_AUTH CHFN_RESTRICT
			- chsh   CHFN_AUTH
			- groupadd   GID_MAX GID_MIN
			- newusers  PASS_MAX_DAYS PASS_MIN_DAYS PASS_WARN_AGE UMASK
			- pwconv  PASS_MAX_DAYS PASS_MIN_DAYS PASS_WARN_AGE
			- useradd   GID_MAX GID_MIN PASS_MAX_DAYS PASS_MIN_DAYS PASS_WARN_AGE UID_MAX UID_MIN UMASK
			- userdel  MAIL_DIR USERDEL_CMD
			- usermod MAIL_DIR


