if [ -s "$HOME/.scm_breeze/scm_breeze.sh" ]; then
    source "$HOME/.scm_breeze/scm_breeze.sh"
    git_index --rebuild
else
    echo "scm_breeze not installed. do this:

    git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
    ~/.scm_breeze/install.sh

then you can delete the line that it adds to your .bashrc
"
fi
