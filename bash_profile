export PS1="\u@\h:\W$"
alias p='python'
alias ll='ls -lt'
alias lla='ls -alt'
alias lld='ll|grep "^d"'
alias llf='ll|grep "^-"'
alias lll='ll|grep "^l"'
alias g='grep -rn --color=auto'

#alias p2='arch -i386 python'
#alias p3='python3'
#alias mongod='sudo mongod --config /usr/local/etc/mongod.conf &'
#alias ab='/usr/local/Cellar/httpd24/2.4.12/bin/ab'
#alias memcached='memcached -d -P /tmp/memcached.pid'
#alias wireshark='nohup /usr/local/Cellar/wireshark/1.12.0/bin/wireshark-qt 2>&1 > /dev/null &'
#alias phpmd='/Users/yangbingxi/www/game_server_v1.1/vendor/phpmd/phpmd/src/bin/phpmd'
#alias php-fpm='/usr/local/Cellar/php55/5.5.26/sbin/php-fpm'
#alias redis='sudo redis-server /usr/local/etc/redis.conf'
#alias redis7000='sudo /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7000.conf'
#alias redis7001='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7001.conf'
#alias redis7002='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7002.conf'
#alias redis7003='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7003.conf'
#alias redis7004='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7004.conf'
#alias php_fpm_restart='sudo kill -USR2 `cat /usr/local/var/run/php-fpm.pid`'
#alias php_fpm_stop 'sudo kill -INT `cat /opt/local/var/run/nginx/nginx.pid`'
#alias ipconfig='ipconfig getpacket en0'
# mark
export MARKPATH=$HOME/.marks
#export MARKDEFAULT=sanguo#设置你的默认书签，可以直接输入g跳转
function g {
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    cd -P "$MARKPATH/$m" 2>/dev/null || echo "No such mark: $m"
}
function mark {
    mkdir -p "$MARKPATH"
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    rm -f "$MARKPATH/$m"
    ln -s "$(pwd)" "$MARKPATH/$m"
}
function unmark {
    local m=$1
    if [ "$m" = "" ]; then m=$MARKDEFAULT; fi
    rm -i "$MARKPATH/$m"
}
function gs {
    ls -l "$MARKPATH" | grep ^l | cut -d ' ' -f 13-
}
_completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(ls -l "$MARKPATH" | grep ^l | cut -d ' ' -f 13)
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completemarks g unmark

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
#mac os qmake位置
export PATH=$PATH:/Users/ybx/app/Qt5.11.3/5.11.3/clang_64/bin
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
alias ssinit1='nohup sslocal -c /root/www/gist/crolax/config_us2.json &>> /var/log/sslocal.log &'
alias ssinit2='nohup sslocal -c /root/www/gist/crolax/config_jp9.json &>> /var/log/sslocal.log &'
alias ssinit3='nohup sslocal -c /root/www/gist/crolax/config_hk2.json &>> /var/log/sslocal.log &'
alias ssinit4='nohup sslocal -c /root/www/gist/crolax/config_us8.json &>> /var/log/sslocal.log &'
alias sson='export http_proxy=http://127.0.0.1:8118 && export https_proxy=http://127.0.0.1:8118 && export ftp_proxy=http://127.0.0.1:8118 && privoxy /etc/privoxy/config'
alias ssoff='unset http_proxy && unset https_proxy && systemctl stop privoxy && pkill sslocal'
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
export GOROOT=/usr/local/go #go软件安装位置
export PATH=$PATH:$GOROOT/bin #go自己的bin
export GOPATH=$HOME/www/go_www #自己go的代码位置
export PATH=$PATH:$GOPATH/bin #自己go的bin
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
alias ll='ls -l'
export ETCDCTL_API=3
############https://www.cnblogs.com/smiler/p/6939913.html#############
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_221
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

MAVEN_HOME=/root/soft/apache-maven-3.6.1
PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_HOME PATH
