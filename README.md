Kiwix Ops
=========

A repo for setting up a build machine for building kiwix offliner programs.  

To set up the VM, once you've downloaded the git repo, you need to run once:

    sudo apt-get install -y vagrant virtualbox

Then:

    vagrant up

To log in to the virtual machine:

    vagrant ssh

If you want to edit the way in which the VM is provisioned, edit `provision.sh` and then run

    vagrant provision

If you're thinking that the VM has become corrupted, wipe it by

    vagrant halt; vagrant destroy

And restart as above.

