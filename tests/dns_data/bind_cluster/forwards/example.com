; Zone file for example.com.
;$ORIGIN example.com.

$TTL 900

@ IN SOA master1.example.com. hostmaster.example.com. (
		20150829
		1D
		1H
		1W
		1D
		)

; NS
												IN  NS ns1.example.com.
												IN  NS ns2.example.com.
ns1											IN	A		192.168.56.54
ns2											IN	A		192.168.56.55

; MX

; Records (A, AAAA, CNAME...)

; test a record
machine1                 IN A           192.168.56.90
host1cname               IN CNAME       machine1.example.com.

; test another record
machine1                 IN A           192.168.56.91
host2cname               IN CNAME       machine2.example.com.
