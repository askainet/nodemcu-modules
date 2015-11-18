# NTP module

Needs a version of the nodemcu firmware with the SNTP and RTCTIME modules

## Example
```lua
NTP_SERVER1 = '192.168.1.1'
NTP_SERVER2 = '0.europe.pool.ntp.org'
ntp = require("ntp")
ntp.sync(NTP_SERVER1, NTP_SERVER2, verbose=1)
```

## Functions
### sync
sync(ntp_server1, ntp_server2='', verbose=0)
Syncs using first server, try second on failure
Sets RTC time implicitly calling rtctime.set()

**Parameters:**

* ntp_server1 - First NTP server to try sync
* ntp_server2 - Optional second NTP server to try sync
* verbose - Print sync success or failure

