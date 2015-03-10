# win32.pl
#Documentation here
#
#Author: Mike Yahm
#01/17/2013
#Comments
#
#Modifications
#
#

#Populate Variables

use Win32;
$login = Win32::LoginName();
$NetBIOS = Win32::NodeName();
$filesystem = Win32::FsType();
$Directory = Win32::GetCwd();
$os_name = Win32::GetOSName();

#Print output

print "$login/n";
print "$NetBIOS/n";
print "$filesystem/n";
print "$Directory/n";
print "os_name/n";