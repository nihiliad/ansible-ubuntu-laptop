# ansible-ubuntu-laptop

Set up an Ubuntu laptop with Ansible.

## Testing with Vagrant

__Note__: The following `vagrant snapshot` commands require Vagrant >= 1.8. See the [Vagrant snapshot docs](https://www.vagrantup.com/docs/cli/snapshot.html) for more info.

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

Even more control via named snapshots:

```
vagrant snapshot save snapshot-name
vagrant provision
vagrant snapshot resotre snapshot-name --no-provision
```
