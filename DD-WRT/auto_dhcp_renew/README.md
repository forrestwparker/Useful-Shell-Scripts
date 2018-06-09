### auto_dhcp_renew

Intended to be used on an network gateway to the internet to alleviate issues with DHCP renewal. The script will attempt to ping the ISP every few seconds.

---

Instructions:

Copy these folders into the root of the router and reboot the router. Alternatively, after copying, run
>/jffs/etc/config/auto_dhcp_renew.startup
from the command line using whatever method you wish (telnet, ssh, administration page on the web gui).

Note that JFFS support on the router must be enabled, and enough space must exist on the JFFS partition.