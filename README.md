# puppet-x2go

[![Puppet Forge](http://img.shields.io/puppetforge/v/treydock/x2go.svg)](https://forge.puppetlabs.com/treydock/x2go)
[![Build Status](https://travis-ci.org/treydock/puppet-module-x2go.svg?branch=master)](https://travis-ci.org/treydock/puppet-module-x2go)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
    * [Public Classes](#public-classes)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the x2go.  Currently the module only supports x2goserver.

The server components make the following changes:

* Require EPEL (RedHat based systems only)
* Install yum package groups necessary to get a desktop environment (RedHat based systems only)
* Install x2goserver and x2goserver-xsession
* Add sudo rule to keep QT_GRAPHICSYSTEM environment variable
* Start x2gocleansessions service
* Disable Network Manager (EL6 only)

## Usage

### x2go

Standard usage to install x2goserver

    class { 'x2go': }

## Reference

* [Public Classes](#public-classes)
  * [Class: x2go](#class-x2go)
* [Private Classes](#private-classes)

### Public classes

#### Class: `x2go`:

Installs and configures x2go components

Default values in Hiera format:

$::osfamily == 'RedHat'

    x2go::server: true
    x2go::server_desktop_packages:
      - 'General Purpose Desktop'
      - 'Desktop'
    x2go::server_package_name: 'x2goserver'
    x2go::server_xsession_package_name: 'x2goserver-xsession'
    x2go::x2gocleansessions_service_name: 'x2gocleansessions'

$::osfamily == 'RedHat' and $::operatingsystemmajrelease == '6'

    x2go::disable_network_manager: true

$::osfamily == 'RedHat' and $::operatingsystemmajrelease == '7'

    x2go::disable_network_manager: false

#####`server`

Manage x2goserver.  Default is `true`

#####`server_desktop_packages`

Packages necessary to install a desktop environment.  Default is OS dependent.

#####`server_package_name`

x2goserver package name.  Default is `x2goserver`

#####`server_xsession_package_name`

x2goserver-xsession package name.  Default is `x2goserver-xsession`

#####`x2gocleansessions_service_name`

x2gocleansessions service name.  Default is `x2gocleansessions`

#####`disable_network_manager`

Boolean that determines if NetworkManager should be turned off and disabled.  Default is OS dependent.

### Private classes

* `x2go::server`: Manages x2go server
* `x2go::server::install`: Installs the x2go server packages.
* `x2go::server::config`: Manages x2go server configuration.
* `x2go::server::service`: Manages the x2go server services.
* `x2go::params`: Sets default values based on facts.

## Limitations

Supports the following operating systems:

* RedHat/CentOS 6
* RedHat/CentOS 7

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker
