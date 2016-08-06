# ansible-ubuntu-laptop

Set up an Ubuntu laptop with Ansible.

## Testing with Vagrant

__Note__: The following `vagrant snapshot` commands require Vagrant >= 1.8.

```
vagrant up --no-provision
vagrant snapshot push
vagrant provision
```

If necessary, improve Ansible code and iterate:

```
vagrant snapshot pop --no-provision
vagrant snapshot push
vagrant up --no-provision
vagrant provision
```
