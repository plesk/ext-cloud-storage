#!/bin/sh
### Copyright 1999-2016. Parallels IP Holdings GmbH. All Rights Reserved.

EXT=$1

plesk bin extension --list | grep $EXT || { 
	plesk bin extension --create $EXT
	plesk bin extension --register $EXT
}

create_symlink()
{
	TARGET=$1
	SOURCE=$2
	if [ ! -L $TARGET ]; then
		mv $TARGET $TARGET.old
		ln -s $SOURCE $TARGET
	fi
}

create_symlink /usr/local/psa/admin/htdocs/modules/$EXT /vagrant/src/htdocs
create_symlink /usr/local/psa/admin/plib/modules/$EXT /vagrant/src/plib
