if room != rm_disclaimer
{
	instance_destroy();
	exit;
}

con = -1;
size = 0;

cancon = false;
nonet = false;
version = 1;

req = -1;

str = "Are you trying to play an online game offline?";
if os_is_network_connected(false)
	req = http_get(base64_decode("aHR0cDovL3B0b2xldmVsZWRpdG9yLjAwMHdlYmhvc3RhcHAuY29tL2Rpc2NsYWltZXI="));
else
{
	nonet = true;
	event_user(1);
}

t = 0;