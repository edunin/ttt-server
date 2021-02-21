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

### Install gmod & css server
if [ "$INSTALL_CSS" = true ]; then
    echo "CS:S server installation is enabled. Downloading css & gmod server from steam..."
    ./steamcmd.sh +login anonymous +force_install_dir "$gmod_path" +app_update 4020 +force_install_dir "$css_path" +app_update 232330 +quit
    
    echo "Copying mount configuration..."
    cp  $mount_cfg_path $gmod_cfg_path
    
    else
        ### Install only gmod server
        echo "Downloading only gmod server from steam..."
        ./steamcmd.sh +login anonymous +force_install_dir "$gmod_path" +app_update 4020 +quit
fi

### Copy server configuration
echo "Copying gmod server configuration..."
cp $server_cfg_path $gmod_cfg_path

### Run server
echo "Running gmod server..."
~/servers/gmod_ds/srcds_run -game garrysmod +gamemode terrortown +maxplayers $MAXPLAYERS +map gm_flatgrass +host_workshop_collection $WORKSHOP_COLLECTION_ID -ttt_preptime_seconds $PREPTIME -ttt_posttime_seconds $POSTTIME -ttt_round_limit $ROUND_PER_MAP_LIMIT -ttt_firstpreptime $TTT_FIRST_PREPTIME
