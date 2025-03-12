# PPA2 Stable

Personal Package Archive (PPA) for stable ROS2 MRS deb packages.

## Adding the PPA

```bash
curl https://ctu-mrs.github.io/ppa2-stable/add_ppa.sh | bash
```

## Uninstalling packages from this PPA

```bash
sudo apt-get -y install aptitude
sudo apt remove $(aptitude search -F '%p' '~S ~i ?origin("ctu-mrs") ?label("stable")')
```

## Removing the PPA

```bash
curl https://ctu-mrs.github.io/ppa2-stable/remove_ppa.sh | bash
```
