#!/bin/bash

gem install eventmachine -v '1.0.7'

vagrant plugin install vagrant-dns
vagrant dns --install
vagrant dns --start
