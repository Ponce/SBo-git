config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

# Keep same perms on rc.policyd.new:
if [ -e etc/rc.d/rc.policyd2 ]; then
  cp -a etc/rc.d/rc.policyd2 etc/rc.d/rc.policyd2.new.incoming
  cat etc/rc.d/rc.policyd2.new > etc/rc.d/rc.policyd2.new.incoming
  mv etc/rc.d/rc.policyd2.new.incoming etc/rc.d/rc.policyd2.new
fi

config etc/rc.d/rc.policyd2.new
config etc/policyd2.conf.new
config @DOCROOT@/policyd2-webui/includes/config.php.new
config etc/httpd/extra/httpd-policyd2.conf.new
config etc/logrotate.d/policyd2.new

