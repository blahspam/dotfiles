setopt no_global_rcs
export DOTFILES=~/.dotfiles

export VISUAL=vim
export EDITOR=$VISUAL

# gnu coreutils first
export PATH="/~bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# java
export JAVA_HOME=`/usr/libexec/java_home`

# maven (ugh)
export MAVEN_OPTS="-Xmx512m -XX:+UseCompressedOops -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"

# hadoop
export HADOOP_HOME="$(brew --prefix hadoop)"
export HADOOP_CONF_DIR="/usr/local/etc/hadoop/conf"
#export HADOOP_OPTS="-Dsun.security.krb5.debug=true $HADOOP_OPTS"
export PATH="$PATH:$HADOOP/bin"

# go
export GOPATH="$HOME/Develop/go"
export GOROOT=$(brew --prefix go)/libexec/
export PKG_CONFIG_PATH=$(brew --prefix lua@5.1)/lib/pkgconfig/
export PATH="$PATH:$GOPATH/bin"

# overrides
[[ -f $HOME/.zshenv.local ]] && source $HOME/.zshenv.local
