setopt no_global_rcs

export VISUAL=vim
export EDITOR=$VISUAL

# gnu coreutils first
export PATH=/usr/local/bin:/~bin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# java
export JAVA_HOME=`/usr/libexec/java_home`

# maven (ugh)
export MAVEN_OPTS="-Xmx512m -XX:+UseCompressedOops -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"

# hadoop
export HADOOP_HOME="$(brew --prefix hadoop)"
export HADOOP_CONF_DIR="/usr/local/etc/hadoop/conf"
#export HADOOP_OPTS="-Dsun.security.krb5.debug=true $HADOOP_OPTS"
export PATH=$PATH:$HADOOP/bin

# go
export GOPATH=$HOME/Develop/go
export GOROOT=$(brew --prefix go)/libexec/
export PATH=$PATH:$GOPATH/bin

# overrides
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
