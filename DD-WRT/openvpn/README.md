### openvpn

These are configuration files to run OpenVPN as a client without using the router's administration webpage. This allows far more freedom to configure other router settings (firewall, DNS, etc.) than would otherwise be possible.

The configuration here is intended for forwarding DNS lookups to another device. On my home network, I have a Raspberry Pi using Pi-hole to block ads on all devices on the network. With these scripts, I have also extended the ad-blocking capability to other family households without the need for additional hardware.

---

Instructions:

Using OpenVPN requires a great deal of customization and technical knowledge that I would expect someone with that level of proficiency to already know what to do with these files. Eventually, I may create a step-by-step guide for others who want to replicate my own OpenVPN setup for a similar use-case, at which point I will place a link to it here.

Important note for those using these files: `no-poll` must be included in DNSMasq's config. This can simply be added to the `Additional DNSMasq Options` field on the router's `Services` webpage.