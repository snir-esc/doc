var domainCondorcet = "w2003condorcet";
var domainIR = "ir.lan";
var ipCondorcet = "172.16.";
var ipIR = "192.168.";
  // our local URLs from the domains below domainCondorcet and domainIR don't need a proxy:
  if (shExpMatch(url,"*."+domainCondorcet+"/*"))
	return "DIRECT";
  if (shExpMatch(url,"*."+domainCondorcet+"*"))
	return "DIRECT";
  if (shExpMatch(url, "*."+domainCondorcet+":*/*"))
	return "DIRECT";
  if (shExpMatch(url,"*."+domainIR+"/*"))
	return "DIRECT";
  if (shExpMatch(url,"*."+domainIR+"*"))
	return "DIRECT";
  if (shExpMatch(url, "*."+domainIR+":*/*"))
	return "DIRECT";
	
  // host without any dot in name
  if (isPlainHostName(host))	return "DIRECT";
	
  // host in private network don't need proxy
  if (isInNet(host, ipCondorcet+"0.0",  "255.255.0.0"))
	return "DIRECT";  
  if (isInNet(host, ipIR+"0.0",  "255.255.0.0"))  
	return "DIRECT";  

  if (isInNet(dnsResolve(host), ipCondorcet+"0.0", "255.255.0.0")) return "DIRECT";
  if (isInNet(dnsResolve(host), ipIR+"0.0", "255.255.0.0")) return "DIRECT";
  
  // All other requests go through proxy.
  return "PROXY 172.16.0.1:3128";
}
