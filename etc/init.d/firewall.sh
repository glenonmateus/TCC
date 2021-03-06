#!/bin/bash

### BEGIN INIT INFO
# Provides:          firewall.sh
# Required-Start:    $all                               
# Required-Stop:                                        
# Default-Start:     2 3 4 5                            
# Default-Stop:      0 1 6                              
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

case "$1" in
    start)
        iptables -F
        iptables -P INPUT DROP
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A INPUT -p tcp --syn --dport 22 -j ACCEPT -s 10.15.10.0/24
        iptables -A INPUT -p tcp --syn --dport 9102 -j ACCEPT -s 200.239.64.84
        iptables -A INPUT -p tcp --syn --dport 5666 -j ACCEPT -s 200.239.64.15
	iptables -A INPUT -p tcp --syn --dport 10050 -j ACCEPT -s 200.239.64.124 
	iptables -A INPUT -p tcp --syn -m multiport --dports 21,22,80,12345 -j ACCEPT -s 200.239.72.19
        iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT -s 200.239.64.15
	iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT -s 200.239.64.124 
        #iptables -A INPUT -m limit --limit 20/s -j LOG --log-prefix 'Firewall: '
	# IPv6
	ip6tables -F
        ip6tables -P INPUT DROP
        ip6tables -A INPUT -i lo -j ACCEPT
        ip6tables -A INPUT -p icmpv6 -j ACCEPT
        ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        ip6tables -A INPUT -p tcp --syn --dport   22 -j ACCEPT -s 2801:80:240:42c0::/64
    ;;
    stop)
        iptables -P INPUT ACCEPT
        iptables -F
        ip6tables -P INPUT ACCEPT
        ip6tables -F
    ;;
    status|list)
        iptables -nvL
        ip6tables -nvL
    ;;
    *)
        echo "Sintaxe: $0 [ start | stop | list ]"
    ;;
esac

