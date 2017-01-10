
## Setup

- Install BATS.

    ```
    git clone https://github.com/sstephenson/bats.git
    cd bats
    sudo ./install.sh /usr/local
    ```

## Running

- To validate a network plugin:

1. Export the name of the plugin that is referenced when creating a network as the environmental variable `$NETDRIVER`.
2. Run the bats tests.

Example using the bridge driver (replace `bridge` with the name of the plugin/driver you wish to test):

```
$NETDRIVER=bridge
bats build.bats

 ✓ Test: Create, start container and delete Docker network using driver (bridge)
 ✓ Test: Create a Docker network using driver (bridge) with specified IPv4 addressing
 ✓ Test: Create two containers with the driver (bridge) and test IPv4 reachability
 .....
```

