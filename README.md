# ansible-playground

This project consists of automation infrastructure setup for rails-api with separate frontend application.

## Installation

  1. Make sure you have [virutalbox](https://www.virtualbox.org/wiki/Downloads) installed.
  2. Visit [vagrant download page](https://www.vagrantup.com/downloads) and install particular binary for your OS.

## Usage

### DNS

To install DNS resolvers run setup script

    ./scripts/dns.sh

Then you will be able to visit

    http://example.company/

and any subdomain.

### Local

  1. To create virtual machine (this is required only for the first time) run the following command:

        vagrant up

  2. Then you can setup you local machine in the same way as production environment will be configured

        vagrant provision

  3. Finally you can `ssh` to your machine and browse it contents

        vagrant ssh

### Tests

If you want to modify ansible command, for example by providing tag names you can use `test.sh` script for that.

    ./scripts/test.sh --tags=common,postgres

### Producion

To deploy infrastructure on production server run:

    ./scripts/deploy.rb [playbook_name]
