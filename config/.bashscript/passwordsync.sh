#!/usr/bin/env bash
#
# Copyright 2020 Raman Gupta
# LICENSE: https://opensource.org/licenses/MIT
# https://gist.github.com/rocketraman/820d94f2f9c8731a6f2d56cbc2ddb60f
#
# Syncs a local keepassxc database with a remote source via rclone.
# The basic process is:
# 1) rclone copy to temporary local location
# 2) use keepassxc cli to merge the remote database into the local one
# 3) rclone copy the updated local db back to the remote
#
export TMPDIR=$HOME/tmp
tempdir=$(mktemp -d -t passwordsync-XXXXX.tmp)
function cleanup {
  rm -rf "$tempdir"
}
trap cleanup EXIT

# Update these according to your local rclone remote name, and remote
# directory path where your password file is stored, or pass in arguments
local_file="${1:-$HOME/drive/database2.kdbx}"
rcloneremote="${2:-gdrive}"
rcloneremote_file="${3:-keepass/database2.kdbx}"

# If you want a timestamped local backup before the sync
local_backup=${4:-true}

rcloneremote_path="$(dirname "$rcloneremote_file")"
local_path="$(dirname "$local_file")"
local_filename="$(basename "$local_file")"

rclone copy --progress "$rcloneremote:$rcloneremote_file" "$tempdir"
if [[ $local_backup == "true" ]]; then
  backup_file="$local_filename."$(date "+%Y%m%d%H%M%S")
  cp "$local_file" "$local_path/$backup_file"
  if [[ $? == 0 ]]; then
    echo "Created backup in $backup_file"
  else
    echo >&2 "Creating backup of "$local_file" to "$local_path/$backup_file" failed, bailing"
    exit 1
  fi
fi
# Merge remote db into local db
date '+%Y-%m-%d %H:%M' -r "$tempdir/$local_filename"
date '+%Y-%m-%d %H:%M' -r "$local_file"
keepassxc-cli merge -s "$local_file" "$tempdir/$local_filename"
if [[ $? != 0 ]]; then
  echo >&2 "Error opening database, incorrect passphrase?"
  exit 1
fi

# If the database is open in keepassxc, it may write back to it, sleep a bit
sleep 3
# Now update remote with the merged local db
rclone copy --progress "$local_file" "$rcloneremote:$rcloneremote_path/"
echo "Done"
