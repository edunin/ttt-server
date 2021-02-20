## docker-ttt

### Usage

For a minimal server setup use this command:

Replace `PATH_TO_DATA` and `YOUR_COLLECTION` with values of your choice.

```bash
docker run \
    -p 27015:27015/udp -p 27015:27015 \
    -v PATH_TO_DATA:/home/steam/servers \
    -e "INSTALL_CSS=true" \
    -e "WORKSHOP_COLLECTION_ID=YOUR_COLLECTION" \
    -e "MAXPLAYERS=16" \
    -e "PREPTIME=30" \
    -e "POSTTIME=30" \
    -e "ROUNDLIMIT=6" \
    -e "FIRST_PREPTIME=60" \
    docker-ttt
```

### Configuration

To configure the ttt server mostly volumes and environment variables are passed to the container.

#### Environment variables
All possible settings https://www.troubleinterroristtown.com/config/settings/

| Variable                 | Default | Description                       |
| ------------------------ | ------- | --------------------------------- |
| `INSTALL_CSS`            | `false` | Installs and mounts a CSS server. |
| `WORKSHOP_COLLECTION_ID` | none    | Set your workshop collection id.  |
| `MAXPLAYERS`             | 16      | Max players.                      |
| `PREPTIME`               | 30s     | Preperation time in s.            |
| `POSTTIME`               | 30s     | After round time in s.            |
| `ROUND_LIMIT`            | 6       | Round limit per map.              |
| `FIRST_PREPTIME`         | 60      | First preperation time.           |