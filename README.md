# btrfs
## list
```sh
btrfs subvolume list /.snapshots
```
## probe
```sh
btrfs subvolume show /.snapshots/{snapshot}
btrfs filesystem du -s /.snapshots/{snapshot}
```
## create
```sh
btrfs subvolume snapshot /home /.snapshots/{snapshot}
```
### readonly
```sh
btrfs subvolume snapshot -r /home /.snapshots/{snapshot}
```
## remove
```sh
btrfs subvolume delete /.snapshots/{snapshot} # or just rm
```
## recover
mount in /etc/fstab
```sh
rsync -avz /.snapshots/{snapshot} /home
```
### delete new files at destination
```sh
rsync -avz --delete /.snapshots/{snapshot} /home 
```

# pacman
pacman -Syu {package}	Install (and update package list)
pacman -S {package}	Install only
pacman -Rsc {package}	Uninstall
pacman -Ss <keywords>	Search
pacman -Syu	Upgrade everything

pacman -Qe	List explictly-installed packages
pacman -Ql {package}	What files does this package have?
pacman -Qii {package}	List information on package
pacman -Qo <file>	Who owns this file?
pacman -Qs <query>	Search installed packages for keywords

pacman -Qdt	List unneeded packages
pacman -Rns $(pacman -Qdtq)	Uninstall unneeded packages
Avoid orphans by using pacman -Rsc to remove packages, which will remove unneeded dependencies.
