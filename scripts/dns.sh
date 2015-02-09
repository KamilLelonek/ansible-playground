#!/bin/bash

vagrant plugin install vagrant-dns
vagrant dns --install
vagrant dns --start
