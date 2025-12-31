# Github Setup

Git should be preinstall with cachyos but if needed

```bash
sudo pacman -S git
```

```bash
# Generate new SSH keys
ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub
```

```bash
# If needed, Test Connection
ssh -T git@github.com
```

```bash
# Setup global meta data
git config --global user.name "username"
# To find email as private email is blocked. https://github.com/settings/emails
git config --global user.email "{ID}+{username}@users.noreply.github.com"
```

## Other Commands

```bash
# If needed, change permission to restricted. git will complain if ssh key is too open
chmod 0400 ~/.ssh/id_rsa
```

```bash
# when needed set single repo
git config user.name ""
# To find email as private email is blocked. https://github.com/settings/emails
git config user.email "{ID}+{username}@users.noreply.github.com"
```

```bash
# set git to use different ssh
# not the .pub
git config --add --local core.sshCommand 'ssh -i <<<PATH_TO_SSH_KEY>>>'
```
