use Net::Ping;

$host='172.16.45.1';

$p = Net::Ping->new('icmp', 1, 128);
if ($p->ping($host)) {
	print "$host is alive.\n" 
}
else {
	print "$host is down.\n" 
}
$p->close();