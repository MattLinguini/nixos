{ config, lib, pkgs, ... }:

{
    networking = {
        hostName = "thinkpad";

        networkmanager = { 
            enable = true; 
            ensureProfiles = {
                profiles = {
                    "uofu-wifi" = {
                        connection = {
                            id = "uofu-wifi";
                            type = "wifi";
                        };
                        wifi = {
                            ssid = "UConnect"; # Replace with the actual SSID if different (e.g., "uofuwireless")
                            mode = "infrastructure";
                        };
                        wifi-security = {
                            key-mgmt = "wpa-eap";
                        };
                        "802-1x" = {
                            eap = "ttls";
                            identity = "u1334024";
                            anonymous-identity = "anonymous";
                            password = "Matthewb312!";
                            phase2-auth = "pap";
                        };
                        ipv4.method = "auto";
                        ipv6.method = "auto";
                    };
                };
            };
        };

        wireless = { enable = false; };

        firewall = {
            checkReversePath = false;
        };
    };
}