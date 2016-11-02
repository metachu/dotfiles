Add to /etc/X11/xorg.conf
Section "Device"
	Identifier "intel"
	Driver "intel"
	Option "AccelMethod" "none"
EndSection

OR 
Section "Device"
	Identifier "intel"
	Driver "modesetting"
EndSection
