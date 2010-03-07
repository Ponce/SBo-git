
if [ -x /usr/bin/update-desktop-database ]; then
   /usr/bin/update-desktop-database -q usr/share/applications 
fi

( cd usr/bin ; rm -rf amsn-remote )
( cd usr/bin ; ln -sf /usr/share/amsn/amsn-remote amsn-remote )
( cd usr/bin ; rm -rf amsn )
( cd usr/bin ; ln -sf /usr/share/amsn/amsn amsn )
( cd usr/bin ; rm -rf amsn-remote-CLI )
( cd usr/bin ; ln -sf /usr/share/amsn/amsn-remote-CLI amsn-remote-CLI )
( cd usr/share/pixmaps ; rm -rf amsn.png )
( cd usr/share/pixmaps ; ln -sf /usr/share/amsn/desktop-icons/48x48/apps/amsn.png amsn.png )
