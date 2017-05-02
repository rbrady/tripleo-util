# TripleO Utils

~~Some TripleO dev tools, you shouldn't use this unless you are called Dougal.~~
Like most TripleO tools, this one has some defaults, but is configurable!
Export the following environment variables to customize the deployment experience.

    TRIPLEO_UTIL_REPO
    GIT_EMAIL
    GIT_USER_NAME
    GERRIT_USER_NAME

## Host

First. tmux.

```bash
sudo yum upgrade -y
sudo yum install -y tmux vim wget git
tmux
```

Then this.

```bash
sudo useradd heap;
echo "heap ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/heap;
sudo chmod 0440 /etc/sudoers.d/heap;
su - heap;
```

As the heap user from this point on.

Add your ssh key...

```
ssh-copy-id -i ~/.ssh/id_rsa.pub root@localhost
```

Now, install the undercloud bits...

```
git clone https://github.com/rbrady/tripleo-util.git;
~/tripleo-util/host/install.sh;
```

Then to connect to the undercloud...

```
~/tripleo-util/u.sh
```

## restack

```
~/tripleo-util/host/restack.sh;
```


## undercloud

```
git clone https://github.com/rbrady/tripleo-util.git;
~/tripleo-util/undercloud/install.sh;
```
