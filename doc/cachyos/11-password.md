# keepass

keepass xc is used instead of keepass because plugins are wonky on linux. easier to use xc that included better
features and just manual sync with rclone

```bash
# keepassxc # password manager
# rclone # clones google drive for keepass
sudo pacman -S keepassxc rclone
```

# rclone setup

rclone is used to sync google drive. this is done with a manual command since a cron job timing will never be correct
since user needs password to be synced on demand or generally right before openning passwords. see passsync for command

```bash
# open rclone to create a new remote
rclone config

# new
# gdrive
# 22 = google drive
# leave client id blank
# leave client secret blank
# 1 full scope
# leave service account file blank
# no (default) to advanced config
# yes (default) to use browser to auth rclone
# log in via browser
# no (default) to team drive
# yes this is ok (default) to keep remote
# quit config
```
