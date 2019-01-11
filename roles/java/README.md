# Java

Installs and configures Java packages. 

## Requirements

May need to update the variables in `defaults/main.yml` for a different Java version.
Also, it may be impossible to determine the correct path for `java_alternative_path` until _after_ packages are
installed, in which case the `update alternatives` task will fail. In that case, find the path by running...

````
sudo update-java-alternatives --list
```

...then update `java_alternative_path` accordingly, and re-execute this role.

## Role Variables

See `defaults/main.yml`.

## Dependencies

See `meta/main.yml`.

## Example Playbook

    - hosts: 127.0.0.1
      connection: local
      roles:
        - java

## Authors

David Naughton
