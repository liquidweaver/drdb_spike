resource r0 {
  on alice {
    device    /dev/drbd1;
    disk      /dev/sdb;
    address   172.22.33.10:7789;
    meta-disk internal;
  }
  on bob {
    device    /dev/drbd1;
    disk      /dev/sdb;
    address   172.22.33.11:7789;
    meta-disk internal;
  }
}
