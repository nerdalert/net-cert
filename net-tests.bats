#!/usr/bin/env bats

load test_helper

@test "Test: Create, start container and delete Docker network using driver ($driver)" {
  docker network create -d $driver test_net1
  docker run -itd --net=test_net1 --name=c1 alpine /bin/sh
  docker rm --force c1
  docker network rm test_net1
}

@test "Test: Create a Docker network using driver ($driver) with specified IPv4 addressing" {
  docker network create -d $driver --subnet=192.168.200.0/24 --gateway=192.168.200.1 test_net1
  docker run -itd --net=test_net1 --name=c1 alpine /bin/sh
  docker rm --force c1
  docker network rm test_net1
}

@test "Test: Create two containers with the driver ($driver) and test reachability" {
  docker network create -d $driver --subnet=192.168.201.0/24 --gateway=192.168.201.1 test_net2
  docker run -itd --net=test_net2 --ip=192.168.201.10 --name=c1 alpine /bin/sh
  docker run -it --rm --net=test_net2 --name=c2 alpine ping -c2 192.168.201.10
  docker rm --force c1
  docker network rm test_net2
}
