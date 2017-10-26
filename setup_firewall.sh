iptables -A DOCKER -t nat -p udp -m udp --dport 10000:20000 -j DNAT --to-destination 172.17.0.2:10000-20000
iptables -A DOCKER -d 172.17.0.2/32 ! -i docker0 -o docker0 -p udp -m udp --dport 10000:20000 -j ACCEPT
iptables -A POSTROUTING -t nat -s 172.17.0.2/32 -d 172.17.0.2/32 -p udp -m udp --dport 10000:20000 -j MASQUERADE