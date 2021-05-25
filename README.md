# docker-powergate

This repository is tracking development of a `docker-compose.yml` file that composes Docker containers for IPFS, Filecoin (Lotus), and Powergate. It's based on the production Docker scripts in the [Powergate repository](https://github.com/textileio/powergate).

## Setup

Make the following directories in the same directory as this repository:

- ipfs-data
- lotus-data
- powergate-data

Run the containers with `docker-compose up -d`. The Lotus node will download a 30GB snapshot and then finish syncing to the tip of the chain. After this first sync has completed, the lotus command in the `docker-compose.yml` file can be commented out.
