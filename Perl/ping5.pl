# program to ping workstations in classrooms and press enter
#If the ping is successful, a message is sent to my ipaddress using net send and press
#Programs assumes a class C address (w.x.y.z) where w.x.y is teh netwrok portion of the IP 
#The "z" octet wil be incremented from 1-254 unless otherwise directed by the instructor
use Net::Ping;

my $class_IP = '172.16.45'; #Network ID -- Change to reflect topology
my $my_IP = '172.16.45.105'; #Use thsi address in microsoft "net send" command


for (my $z = 1; $z < 255; $z++) {
	$ip=$class_IP . "." . $z;
	$p = Net::Ping->new('icmp', 1, 128);
if ($p->ping($ip)) {
	print "$ip is alive.\n" 
}
else {
	print "$ip is down.\n" 
}

$p->close();}