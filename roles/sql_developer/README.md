# SQL Developer

Configures Oracle SQL Developer for local development.

Mostly based on
[How to install SQL Developer on Ubuntu 14.04?](https://askubuntu.com/questions/458554/how-to-install-sql-developer-on-ubuntu-14-04).
with just a couple of modifications, adapting for my own personal use:

## Requirements

### Download

Download the Other Platforms zip file from
[Oracle SQL Developer Downloads](https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html).

### Install

```
sudo unzip sqldeveloper-*-no-jre.zip -d /opt/
```

### Test

After executing this role, run `sqldeveloper`. Create a new connection, and set Connection Name, Username,
Password, Hostname, Port, and Service name. Example:

* Connection Name: $username@hoteltst.oit
* Username: $username
* Password: $password
* Hostname: oracle-hotel-tst.oit.umn.edu 
* Port: 1521
* Service name: hoteltst.oit

## Role Variables

See `defaults/main.yml`.

## Dependencies

See `meta/main.yml`.

## Example Playbook

    - hosts: 127.0.0.1
      connection: local
      roles:
        - sql_developer

## Authors

David Naughton
