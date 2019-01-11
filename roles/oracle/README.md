# Oracle

Configures Oracle Instant Client for local development.

Mostly based on
[SETUP RUBY (OCI8, SEQUEL) FOR ORACLE ON UBUNTU 14.04](https://somethingaboutcode.wordpress.com/2016/03/31/setup-ruby-oci8-sequel-for-oracle-on-ubuntu-14-04/),
with just a couple of modifications, adapting for my own personal use:

* zsh instead of bash
* Makes libraries available via `LD_LIBRARY_PATH` instead of `ldconfig`. Easier single-user configuration.
* Adds connection configuration files for the UMN databases I use.

## Requirements

### Download

Download the following RPMS from
[Instant Client Downloads for Linux x86-64](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html),
where `$version` is your database/client version, e.g., 12.2:

* Instant Client Package – Basic
  * `oracle-instantclient$version-basic-$version-1.x86_64.rpm`
* Instant Client Package – SQL\*Plus
  * `oracle-instantclient$version-sqlplus-$version-1.x86_64.rpm`
* Instant Client Package – SDK
  * `oracle-instantclient$version-devel-$version-1.x86_64.rpm`

### Install

* `sudo apt install alien`, then for each `$rpm`:
* `sudo alien -i $rpm`

### Test

After executing this role:

* `sqlplus $username@$service_name`, e.g., `sqlplus $username@hoteltst.oit`

## Role Variables

See `defaults/main.yml`.

## Dependencies

See `meta/main.yml`.

## Example Playbook

    - hosts: 127.0.0.1
      connection: local
      roles:
        - oracle

## Authors

David Naughton
