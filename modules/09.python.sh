function set-python(){
    version=$1
    ls -l /usr/local/opt/python
    rm /usr/local/opt/python
    ln -s "/usr/local/opt/python@$version" "/usr/local/opt/python"
    ls -l /usr/local/opt/python
}
