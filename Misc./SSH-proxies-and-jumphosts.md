# SSH - Proxies und Jumphosts

A useful trick is „ssh -tt“ which forces tty allocation, so instead of the above you can do the following, connecting to server2 via firewall as the jump host:

```
ssh -tt firewall.example.com ssh -tt server2.example.org
```

This opens an ssh terminal to the remote machine. You can also pass commands. For example, to reattach to a remote screen session using screen you can do the following:

```
ssh -tt firewall.example.com ssh -tt server2.example.org screen -dR
```

The chain can be arbitrarily long and is not limited to just two hosts.

Bearbeiten

## Port Forwarding via an Intermediate Host

Tunneling, also called port forwarding, is when a port on one machine mapped to a connection to a port on another machine. In that way remote services can be accessed as if they were local. Or in the case of reverse port forwarding, vice verse. Forwarding can be done directly from one machine to another or via a machine in the middle.

Below we are setting up a tunnel from the localhost to machine2, which is behind a firewall, machine1. The tunnel will be via machine1 which is publicly accessible and also has access to machine2.

```
ssh -L 2222:machine2.example.org:22 machine1.example.org
```

Next connecting to the tunnel will actually connect to the second host, machine2.

```
ssh -p 2222 remoteuser@localhost
```

That's it.

It is possible to use all the options in this way, such as -X for X11 forwarding. Here is an example of running rsync between the two hosts using machine1 as an intermediary with the above setup.

```
rsync -av -e "ssh -p 2222"  /path/to/some/dir/   localhost:/path/to/some/dir/
```



## Links

* [https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies\_and\_Jump\_Hosts](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts)



