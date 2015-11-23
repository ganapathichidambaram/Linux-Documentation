==================================
SSH - Secure Shell
==================================

----------------------------------
What is Secure Shell(SSH) ?
----------------------------------
Secure Shell is an application protocol and software suite that allows secure network services over an insecure network such as the 
public internet by strong encryption and authentication. It can be used for remote terminal connections,remote file copy and 
forwarding X11 sessions as well as arbitrary TCP ports through a secure tunnel.It replaces the other insecure protocols such as Telnet 
and FTP.

+--------------+-------------+------------------------+
| Service Name | Port Number |	Transport Protocol    |
+==============+=============+========================+
| ssh          | 22	     | TCP/UDP/SCTP           |
+--------------+-------------+------------------------+

----------------------------------
What is OpenSSH
----------------------------------
OpenSSH - It is a suite of security-related network-level utilities based on the SSH protocol, which help to secure network 
communications via the encryption of network traffic over multiple authentication methods and by providing secure tunneling 
capabilities.

----------------------------------
Installation of OpenSSH
----------------------------------
OpenSSH is a client-server application tool and server and client utilities need to be installed to get access through SSH protocol. 
**openssh-server** need to be installed on Server-End. And **openssh-client** need to be installed on Client-End to access the server.

Server installation
----------------------------------
On Ubuntu/Debian Linux distributions::

 sudo apt-get install openssh-server

On Redhat/CentOs/Fedora Linux Distributions::

 sudo yum install openssh-server

Client Installation
-----------------------------------
On Ubuntu/Debian Linux distributions::

 sudo apt-get install openssh-client

On Redhat/CentOs/Fedora Linux Distributions::

 sudo yum install openssh-client


---------------------------------------------
Configuration
---------------------------------------------
Configurations files are located under the */etc/ssh* Directory and configurations files are mentioned below.
 
.. note ::
 Server Configuration File - */etc/ssh/sshd_config*
 
 Client Configurations File - */etc/ssh/ssh_config* or *~/.ssh/config*

And here are few configuration and its usage are :

- Host *

	Restricts the following declarations (up to the next Host or Match keyword) to be only for those hosts that match one of the
        patterns given after the *Host* keyword. In this case it allows all the host access. 

- ConnectTimeout 0

	If Connection Timeout value defined then it used when connecting to the SSH server instead of using default system TCP timeout.
        And value only used for target is down or unreachable condition,not when server refuses the connection.

- Port 13

	Specifies the port number which need to used to connect the remote host. The default Port number is 22.

- AddressFamily

	Specifies which address family to use when connecting.Valid arguments are “any”, “inet” (use IPv4 only), or “inet6” (use IPv6 
        only).

- BatchMode

	If this option set to “yes”, passphrase/password querying will be disabled.

- ServerAliveInterval

	If this used to maintain the server connectivity session to desired period instead of default 300 seconds when there is no 
        active jobs running on the connection.

- BindAddress

	Use the specified address on the local machine as the source address of the connection.Only useful on systems with more than 
        one address. Note that this option does not work if UsePrivilegedPort is set to “yes”.

- Compression

        Specifies whether to use compression.  The argument must be “yes” or “no”.  The default is “no”.

- CompressionLevel

        Specifies the compression level to use if compression is enabled.The argument must be an integer from 1 (fast) to 9(slow,best).
        The default level is 6, which is good for most applications.The meaning of the values is the same as in gzip(1).Note that this 
        option applies to protocol version 1 only.

- ConnectionAttempts

	Specifies the number of tries (one per second) to make before exiting.The argument must be an integer.This may be useful in 
        scripts if the connection sometimes fails.The default is 1.

- ConnectTimeout

        Specifies the timeout (in seconds) used when connecting to the SSH server, instead of using the default system TCP timeout.
        This value is used only when the target is down or really unreachable, not when it refuses the connection.

- GlobalKnownHostsFile

        Specifies one or more files to use for the global host key data‐base, separated by whitespace.The default is /etc/ssh/
        ssh_known_hosts, /etc/ssh/ssh_known_hosts2.

- UserKnownHostsFile

        Specifies one or more files to use for the user host key database, separated by whitespace. The default is ~/.ssh/known_hosts, 
        ~/.ssh/known_hosts2.

- HostbasedAuthentication

        Specifies whether to try rhosts based authentication with public key authentication.The argument must be “yes” or “no”.The 
        default is “no”.  This option applies to protocol version 2 only and is similar to RhostsRSAAuthentication.

- NumberOfPasswordPrompts

        Specifies the number of password prompts before giving up.The argument to this keyword must be an integer.The default is 3.

- PasswordAuthentication

        Specifies whether to use password authentication. The argument to this keyword must be “yes” or “no”.The default is “yes”.

- PreferredAuthentications

        Specifies the order in which the client should try protocol 2 authentication methods.This allows a client to prefer one   
        method (e.g. keyboard-interactive) over another method (e.g.password).The default is:( gssapi-with-mic,hostbased,publickey,
        keyboard-interactive,password ).

- Protocol

        Specifies the protocol versions ssh(1) should support in order of preference.The possible values are ‘1’ and ‘2’.Multiple 
        versions must be comma-separated.When this option is set to “2,1”.ssh will try version 2 and fall back to version 1 if version 
        2 is not available.The default is ‘2’.

- StrictHostKeyChecking

        If this flag is set to “yes”, ssh(1) will never automatically add host keys to the ~/.ssh/known_hosts file, and refuses to 
        connect to hosts whose host key has changed.  This provides maximum protection against trojan horse attacks, though it can be 
        annoying when the /etc/ssh/ssh_known_hosts file is poorly maintained or when connections to new hosts are frequently made.This 
        option forces the user to manually add all new hosts.If this flag is set to “no”, ssh will automatically add new host keys to 
        the user known hosts files.If this flag is set to “ask”, new host keys will be added to the user known host files only after 
        the user has confirmed that is what they really want to do, and ssh will refuse to connect to hosts whose host key has changed.
        The host keys of known hosts will be verified automatically in all cases.The argument must be “yes”, “no”, or “ask”.The 
        default is “ask”.