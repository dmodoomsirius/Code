# program to ping workstations in classrooms and press enter
#If the ping is successful, a message is sent to my ipaddress using net send and press
#Programs assumes a class C address (w.x.y.z) where w.x.y is teh netwrok portion of the IP 
#The "z" octet wil be incremented from 1-254 unless otherwise directed by the instructor
use strict;
use warnings;
use Net::Ping;

my $class_IP = '172.16.45'; #Network ID -- Change to reflect topology
my $my_IP = '172.16.45.105'; #Use thsi address in microsoft "net send" command
my $file = "C:\\Users\\Mike\\temp.txt";

{
my $username = getlogin || getpwuid($<) || "veeru";
 print $username;
}

{my ($sec,$min,$hour,$day,$month,$yr19,@rest) =   localtime(time);#######To get the localtime of your system
printf "\nDate:\t$day-".++$month. "-".($yr19+1900)."\n"; ####To printf date format as expected
printf "Time:\t".printf("%02d",$hour).":".printf("%02d",$min).":".printf("%02d",$sec)."\n";###To printf the current time
}





unless(open FILE, '>'.$file) {
	#die with error message if we can't open it.
	die "\nUnable to create $file\n";
}
for (my $z = 1; $z < 255; $z++) {
	my $ip = $class_IP . "." . $z;
	my $p = Net::Ping->new('icmp', 1, 32);
	if ($p->ping($ip)) {
		printf "$ip is alive.\n";
		printf FILE "$ip is alive.\n"; 
	}
	else {
		printf "$ip is down.\n"; 
		printf FILE "$ip is down.\n"; 
	}
	$p->close();
}
close FILE;