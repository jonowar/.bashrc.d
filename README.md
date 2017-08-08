# .bashrc.d
An attempt to organize my .bashrc

## Installation

```bash
git clone git://github.com/jonowar/.bashrc.d.git ~/.bashrc.d
.bashrc.d/install.sh
source ~/.bashrc
```

This adds the following to your .bashrc:
```
# added by .bashrc.d/install.sh
for file in `find $HOME/.bashrc.d/modules/* | grep "/[0-9]\..*[0-9a-zA-Z]$"`; do echo $file; source $file; done
```

## Adding stuff
Create a new file with a filename in the format of `<order in which this will be run>.<brief description>` in the `modules` directory. Somet

That's it!
