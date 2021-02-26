printf " Automatically Check dependency and Install "
a1=("nmap")
i=0
while [ $i -lt 1 ]
do
if ! which ${a1[$i]}  > /dev/null; then
	sudo apt install ${a1[$i]} >/dev/null 2>&1 
	
fi
i=`expr $i + 1`
done 
clear


hello ()
{
		       printf "\n Enter the website or ip to gather port information\t "
		       read ip
		       if [ "$ip" = "" ]
		       then
		       printf " Please input ip or website "
	       	       fi
	       }

hello1 ()       
{
	if [ "$ip" != "" ]
	then
	printf " Enter the port number or port name to scan "
	read port
	if [ "$port" = "" ] 
	then
		printf " Please input port number or port name "
	fi
	fi

       }
hello2 ()
{
if [ "$ip" != "" ]
then
printf " Enter the Random number ip choose please enter number "
read rnd
if [ "$rnd" = "" ]
then
	printf " Please enter the random number "
fi
fi
}

while [ true ]
do
	printf "\t\t\t Scanning Technique\n\n\n1  Basic Scan or find live lost host using subnetmask\n2  Basic Port Scan\n3  TCP Scan\n4  TCP Scan with Port\n5  Stealth Scan\n6  Stealth Scan with Port\n7  Acknowledgement Scan\n8  Acknowledgement Scan with port\n9  X-mas Scan\n10 X-mas Scan with port\n11 Scan Service version of port\n12 Scan Service version with Particular port\n13 OS Scan\n14 Aggressive Scan\n15 Aggressive Scan with port\n16 Source routing scan with Random number of ip\n17 Source routing scan with particular port\n18 Source routing manually spoof ip address with space\n19 Source routing manually spoof ip address with space and port\n20 Fragmentation Scan\n21 Fragmentation Scan with port\n22 Spoofing Scan\n23 Spoofing Scan with port\n24 Check Port Information\n25 Clear\n26 Exit "
	printf "\n\n Enter the Choice \t "
	read ch
	case "$ch" in 
		"1") # Basic Scan
		       hello
		       if [ "$ip" != "" ] && [[ "$ip" != *"/"* ]]
		       then
		       nmap $ip
		       read -t 1000
		       else
		       nmap -sn $ip
		       read -t 1000
		       fi
	;;
		"2") # Basic Port Scan
			hello
			hello1
			if [ "$port" != "" ]
			then
				nmap -p $port $ip 
				read -t 1000
			fi
		;;
	"3") # TCP Scan
		hello
		if [ "$ip" != "" ]
		then
			nmap -sT $ip
		       read -t 1000	
		fi
		;;
	"4") # TCP Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
		nmap -p $port -sT $ip
		read -t 1000
		fi
		;;
	"5") # Stealth Scan
		hello
		if [ "$ip" != "" ]
		then
			nmap -sS $ip
			read -t 1000
		fi

		;;
	"6") # Stealth Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
			nmap -p $port -sS $ip
			read -t 1000
		fi
		;;
	"7") # Acknowledgement Scan 
		hello
		if [ "$ip" != "" ]
		then
			nmap -sA $ip
			read -t 1000
		fi
		;;
	"8") # Acknowledgement Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
			nmap -p $port -sA $ip
			read -t 1000
		fi
		;;
	"9") # X-mas Scan
		hello 
		if [ "$ip" != "" ]
		then
			nmap -sX $ip
			read -t 1000
		fi
		;;
	"10") # X-mas Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
		nmap -p $port -sX $ip
		read -t 1000
		fi
		;;
	"11") # Scan service version of port
		hello
		if [ "$ip" != "" ]
		then
		nmap -sV $ip
		read -t 1000
		fi
		;;
	"12") # Scan service version of particular port
		hello
		hello1
		if [ "$port" != "" ]
		then
			nmap -p $port -sV $ip
			read -t 1000
		fi
		;;
	"13") # OS Scan
		hello
		if [ "$ip" != "" ]
		then
			nmap -O $ip
			read -t 1000
		fi
		;;
	"14") # Aggressive Scan
		hello
		if [ "$ip" != "" ]
		then
			nmap -A $ip
			read -t 1000

		fi
		;;
	"15") # Aggressive Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
			nmap -p $port -A $ip
			read -t 1000
		fi
		;;
	"16") # Source routing Scan with Random number of ip
		hello
		hello2
		if [ "$rnd" != "" ]
		then
		nmap -D RND:$rnd $ip
		read -t 1000
		fi

		;;
	"17") # Source routing Scan with port
		hello
		hello1
		hello2
		if [ "$rnd" != "" ]
		then
			nmap -p $port -D RND:$rnd $ip 
			read -t 1000
		fi
		;;
	"18") # Source routing manually spoof ip address with space
		hello
		if [ "$ip" != "" ]
		then
			printf  " Enter the spoof ip address if multiple used space  "
			read spoof
			if [ "$spoof" = "" ]
			then
				printf "please enter the spoof ip address "
			else
				nmap -D $spoof $ip
				read -t 1000
			fi	
		fi
		;;
	"19") # Source routing manually spoof ip address with space and port  
		hello
		hello1
		if [ "$port" != "" ]
		then
			printf " Enter the spoof ip address if multiple used space "
			read spoof
			if [ "$spoof" = "" ]
			then
				printf " please enter the spoof ip address "
			else
				nmap -p $port -D $spoof $ip
				read -t 1000
			fi
		fi
		;;
	"20") # Fragmentation Scan
		hello
		if [ "$ip" != "" ]
		then
			nmap -f $ip
			read -t 1000
		fi
		;;
	"21") # Fragmentation Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
			nmap -p $port -f $ip
			read -t 1000
		fi
		;;
	"22") # Spoofing Scan
		hello
		if [ "$ip" != "" ]
		then
			printf " Enter the spoof ip address "
			read spoof
			if [ "$spoof" = "" ]
			then
				printf "Please enter the spoof ip address "
			else
				nmap -S $spoof $ip -e eth0
				read -t 1000
			fi
		fi
		;;
	"23") # Spoofing Scan with port
		hello
		hello1
		if [ "$port" != "" ]
		then
			printf " Enter the spoof ip address "
			read spoof
			if [ "$spoof" = "" ]
			then
				printf " Please enter the spoof ip address "
			else
				nmap -p $port -S $spoof $ip -e eth0
				read -t 1000
			fi
		fi
		;;
	"24") # Check Port Information

	while [ true ]
	do
		clear
		printf "Enter the Port number or Port name or Enter exit "
		read port
		case "$port" in 

			"80" |  "http" | "https" | "443")
				printf "\nPort Name :- HTTP and HTTPS\nPort Number :- 80,443\nPort Information :- \ni) Hypertext Transfer Protocol ( HTTP ) and S means Secure is used to connect to web servers on the internet or on local server \nii) it is primary function to established connection with the server & send html pages back to the user browser\niii) HTTPS is used for secure communication over a computer network"
				read -t 1000
				;;

			"20" | "21" | "ftp")
				printf "\nPort Name :- FTP\nPort Number :- 20,21\nPort Information :- \ni) File Transfer Protocol give client access to file servers through the ftp are used to login & close connection as well as upload download & rename, delete & get information on file from servers"
				read -t 1000
				;;

			"23" | "telnet")
				printf "\nPort Name :- Telnet\nPort Number :- 23\nPort Information :- \ni) Telnet is network protocol used to virtually access a computer and to provide a two way collaborative & text based communication. Ex Terminal,CMD "
				read -t 1000
				;;

			"22" | "ssh")
				printf "\nPort Name :- SSH\nPort Number :- 22\nPort Information :- \ni) Secure Shell is used to secure login from one computer to another "
				read -t 1000
				;;

			"123" | "ntp")
				printf "\nPort Name :- NTP\nPort Number :- 123\nPort Information :- \ni) Network time protocol or network transmission protocol"
				read -t 1000
				;;

			"25" | "smtp")
				printf "\nPort Name :- SMTP\nPort Number :- 25\nPort Information :- \ni) Simple Mail Transfer Protocol is part of application layer Sending Emails by using SMTP"
				read -t 1000
				;;

			"110" | "pop3")
				printf "\nPort Name :- POP3\nPort Number :- 110\nPort Information :- \ni) Post office Protocol Version 3 is used to receive emails from a remote server to a local email client. \nii) pop3 allows you to download email message on your local computer and read them even when you are offline"
				read -t 1000
				;;

			"143" | "imap")
				printf "\nPort Name :- IMAP\nPort Number :- 143\nPort Information :- \ni) Internet Message Access Protocol is mail protocol used for accessing email on a remote web server from local client.\nii) IMAP and POP3 are two most commonly used internet mail protocol for retrieving emails"
				read -t 1000
				;;

			"53" | "dns")
				printf "\nPort Name :- DNS\nPort Number :- 53\nPort Information :- \ni) Domain Name System is center part of internet providing a way to match name  ( website you were searching ) to numbers ( ip address ) website anything connected to internet laptop,mobile etc website as an internet protocol\nii) dns work only websites\niii) dns store website ip address"
				read -t 1000
				;;

			"67" | "68" | "dhcp")
				printf "\nPort Name :- DHCP\nPort Number :- 67,68\nPort Information :- \ni) Dynamic Host Configration Protocol is network management protocol used to automate process of configuring device on ip network does allowing them used to service such as dns,ntp & communication protocol based on TCP & UDP\nii) It assign ip address"
				read -t 1000
				;;

			"137" | "138" | "139" | "netbios")
				printf "\nPort Name :- NetBios\nPort Number :- 137,138,139\nPort Information :- \ni) Network Basic Input Output System is a program that allows applications on different computers to communicate within a local area network ( LAN )\nii) it means communication between device and network is called netbios\niii) it collects info about open ports and services detail and all about shared devices and file folder"
				read -t 1000
				;;

			"135" | "msrpc")
				printf "\nPort Name :- MSRPC\nPort Number :- 135\nPort Information :- \ni) Microsoft Remote Procedure Call is used the client-server model in order to allow one program to request service from a program on another computer without having to understand the details of that computer’s network"
				read -t 1000
				;;

			"445" | "smb")
				printf "\nPort Name :- SMB\nPort Number :- 445\nPort Information :- \ni) The Server Message Block (SMB) protocol is a network file sharing protocol that allows applications on a computer to read and write to files and to request services from server programs in a computer network.\nii) The SMB protocol can be used on top of its TCP/IP protocol or other network protocols"
				read -t 1000
				;;

			"389" | "ldap")
				printf "\nPort Name :- LDAP\nPort Number :- 389\nPort Information :- \ni) LDAP (Lightweight Directory Access Protocol) is an open and cross platform protocol used for directory services authentication.\nii) LDAP provides the communication language that applications use to communicate with other directory services servers."
				read -t 1000
				;;

			"3306" | "mysql")
				printf "\nPort Name :- MySql\nPort Number :- 3306\nPort Information :- \ni) The MySQL protocol is used between MySQL Clients and a MySQL Server.\nii) It is implemented by: The protocol supports these features: Transparent encryption using SSL."
				read -t 1000
				;;

			"162" | "snmp")
				printf "\nPort Name :- SNMP\nPort Number :- 162\nPort Information :- \ni) Simple network management protocol is a networking protocol used for the management and monitoring of network-connected devices in Internet Protocol networks."
				read -t 1000
					
				;;	
			"exit")
				break
				;;	
		
			*)
				printf " Please Enter correct Port Number and Port Name "
				read -t 1000
				;;
			
		esac
	done
		;;
	"25") # Clear
		clear
		;;
	"26") # Exit
		exit
		;;

	*)
		printf " Please Enter the correct choice "
		read -t 1000
		;;
	esac
done
		  

