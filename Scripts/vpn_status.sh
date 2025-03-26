#!/bin/bash

STATUS=$(scutil --nc status "NordVPN (IKEv2)")
if [[ $STATUS == "Connected" ]]; then
  echo "VPN: Connected"
else
  echo "VPN: Disconnected"
fi

