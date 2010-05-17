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

# Keep same perms on rc.hiawatha.new:
if [ -e etc/rc.d/rc.hiawatha ]; then
  cp -a etc/rc.d/rc.hiawatha etc/rc.d/rc.hiawatha.new.incoming
  cat etc/rc.d/rc.hiawatha.new > etc/rc.d/rc.hiawatha.new.incoming
  mv etc/rc.d/rc.hiawatha.new.incoming etc/rc.d/rc.hiawatha.new
fi

# Keep same perms on rc.php-fcgi.new:
if [ -e etc/rc.d/rc.php-fcgi ]; then
  cp -a etc/rc.d/rc.php-fcgi etc/rc.d/rc.php-fcgi.new.incoming
  cat etc/rc.d/rc.php-fcgi.new > etc/rc.d/rc.php-fcgi.new.incoming
  mv etc/rc.d/rc.php-fcgi.new.incoming etc/rc.d/rc.php-fcgi.new
fi

