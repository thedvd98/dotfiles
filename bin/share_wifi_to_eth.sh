#!/bin/sh

NET=enp0s31f6
INTERNET=wlp5s0

ip link set up dev $NET
ip addr add 192.168.123.254/24 dev $NET

sysctl net.ipv4.ip_forward=1

iptables -t nat -A POSTROUTING -o $INTERNET -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $NET -o $INTERNET -j ACCEPT
