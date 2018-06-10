### nvram_clean

This script frees up NVRAM by removing variables with unassigned values. 

---

Instructions:

Copy these folders into the root of the router and reboot the router. Alternatively, after copying, run
>/jffs/etc/config/nvram_clean.startup
from the command line using whatever method you wish (telnet, ssh, administration page on the web gui).

Note that JFFS support on the router must be enabled, and enough space must exist on the JFFS partition.