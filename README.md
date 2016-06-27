# TripleO Utils

Some TripleO dev tools, you shouldn't use this unless you plan on debugging it
yourself.

## Host

Run this.

```
sudo yum upgrade -y
sudo yum install -y tmux vim wget git
tmux
```

Then this.

```
sudo useradd stack
echo "stack ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/stack
sudo chmod 0440 /etc/sudoers.d/stack
su - stack
```

Finally this.

```
git clone https://github.com/d0ugal/tripleo-util.git;
./tripleo-util/host/install.sh;
./tripleo-util/host/restack.sh;
```
