# ns_lookup.cr
Web-API for www.nslookup.io find all DNS records for a domain name using this online tool.

## Example
```cr
require "./ns_lookup"

ns_lookup = NsLookup.new
dns_info = ns_lookup.dns_lookup(
	domain="google.com", dns_server="cloudflare")
puts dns_info
```
