Name: erc
Version: 0.1
Release: alt1

Summary: Etersoft Archiver

License: AGPLv3
Group: System/Configuration/Packaging
Url: http://wiki.etersoft.ru/ERC

Packager: Vitaly Lipatov <lav@altlinux.ru>

# git-clone http://git.etersoft.ru/projects/korinf/erc.git
Source: ftp://updates.etersoft.ru/pub/Etersoft/Sisyphus/sources/tarball/%name-%version.tar

BuildArchitectures: noarch

# who really does all our work
Requires: patool

%description
Etersoft Arhiver is the archive manager for any format
It provides universal interface to any archive manager.

See detailed description here: http://wiki.etersoft.ru/ERC

%prep
%setup

%install
# install to datadir and so on
%makeinstall version=%version-%release

#mkdir -p %buildroot%_sysconfdir/bash_completion.d/
#install -m 0644 bash_completion/erc %buildroot%_sysconfdir/bash_completion.d/erc

# shebang.req.files
#chmod a+x %buildroot%_datadir/%name/{erc-}*

%files
%doc README LICENSE
%_bindir/erc
%_datadir/%name/
#%_sysconfdir/bash_completion.d/erc

%changelog
* Thu Jul 25 2013 Vitaly Lipatov <lav@altlinux.ru> 0.1-alt1
- initial build for ALT Linux Sisyphus
