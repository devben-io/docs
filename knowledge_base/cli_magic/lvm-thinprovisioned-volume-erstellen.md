# CLI \| create LVM thinprovisioned Volumes {#lvm_thinprovisioned_volume_erstellen}

```
pvcreate /dev/sda
vgcreate vg01_bricks /dev/sda
lvcreate -l 100%FREE -T vg01_bricks/lv_thinpool
...
mkfs.ext4 /dev/mapper/vg01_bricks-lv_thinpool
```

## Weblinks {#weblinks}

* [https://access.redhat.com/documentation/en-US/Red\_Hat\_Enterprise\_Linux/6/html/Logical\_Volume\_Manager\_Administration/thinly\_provisioned\_volume\_creation.html](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/thinly_provisioned_volume_creation.html)
* [http://blog.gluster.org/2014/10/gluster-volume-snapshot-howto/](http://blog.gluster.org/2014/10/gluster-volume-snapshot-howto/)



