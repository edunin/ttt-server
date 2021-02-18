#!/bin/bash

### Configuration templates
cfg_path="$HOME/cfg"
mount_cfg_path="$cfg_path/mounts.cfg"
server_cfg_path="$cfg_path/server.cfg"

### Server paths
servers_path="$HOME/servers"
gmod_path="$servers_path/gmod_ds"
gmod_cfg_path="$gmod_path/garrysmod/cfg"
css_path="$servers_path/css_ds"

### Install gmod server
echo "Downloading gmod server from steam..."
./steamcmd.sh +login anonymous +force_install_dir "$gmod_path" +app_update 4020 +quit

### Install css server
if [ "$INSTALL_CSS" = true ]; then
    echo "CS:S server installation is enabled. Downloading it from steam..."
    ./steamcmd.sh +login anonymous +force_install_dir "$css_path" +app_update 232330 +quit
    
    echo "Copying mount configuration..."
    cp  $mount_cfg_path $gmod_cfg_path
fi

### Copy server configuration
echo "Copying gmod server configuration..."
cp $server_cfg_path $gmod_cfg_path

### Run server
echo "Running gmod server..."
~/servers/gmod_ds/srcds_run -game garrysmod -debug +gamemode terrortown +maxplayers 16 +map gm_flatgrass +host_workshop_collection $WORKSHOP_COLLECTION_ID
