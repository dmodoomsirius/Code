# program to ping workstations in classrooms and press enter
#If the ping is successful, a message is sent to my ipaddress using net send and press
#Programs assumes a class C address (w.x.y.z) where w.x.y is teh netwrok portion of the IP 
#The "z" octet wil be incremented from 1-254 unless otherwise directed by the instructor
use Net::Ping;

my $class_IP = '172.16.45'; #Network ID -- Change to reflect topology
my $my_IP = '172.16.45.105'; #Use thsi address in microsoft "net send" command


for (my $z = 1; $z < 255; $z++) {
	my$wrkstation = "$class_IP.$z";
	print "\nLooking for live system to attack...\n";
	@ping=("ping $wrkstation");
	unless (system(@ping)) {
		system("msg %username% $my_ip $wrkstation is ready to attack!");
	}
}
