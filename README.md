## coquus liber (the cook book) xenial xerus bento

This is setup to be a Developers Vagrant Box Workstation based on the Xenial Xerus Bento box.

Using Chef Recipes, the box installs x-windows and a collection of utilities for software development from the Ubuntu Repositories. 

The plugin `vagrant-proxyconf` will copy the proxy setting from the host's environment variables and apply them to the guest system. That can be installed using. 

```
$ vagrant install plugin vagrant-proxyconf
```

Then, as long as the proxy variables are set on the host, the proxy for the guest will be setup. 

Once you have the proxy environment variables setup (if you need them) the next step is. 

```
$ vagrant up
```

This will load chef onto the guest, and go through the installation process, and since it will need a reboot after that, it will shutdown. 

Another 

```
$ vagrant up
```

Will bring the system up to a useable state. 

