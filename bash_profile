export PS1="\u@\h:\W$"
alias p='python'
alias ll='ls -lt'
alias lla='ls -alt'
alias lld='ll|grep "^d"'
alias llf='ll|grep "^-"'
alias lll='ll|grep "^l"'
alias g='grep -rn --color=auto'
alias p2='arch -i386 python'
alias p3='python3'
alias mongod='sudo mongod --config /usr/local/etc/mongod.conf &'
alias ab='/usr/local/Cellar/httpd24/2.4.12/bin/ab'
alias memcached='memcached -d -P /tmp/memcached.pid'
alias wireshark='nohup /usr/local/Cellar/wireshark/1.12.0/bin/wireshark-qt 2>&1 > /dev/null &'
alias phpmd='/Users/yangbingxi/www/game_server_v1.1/vendor/phpmd/phpmd/src/bin/phpmd'
alias php-fpm='/usr/local/Cellar/php55/5.5.26/sbin/php-fpm'
alias redis='sudo redis-server /usr/local/etc/redis.conf'
alias redis7000='sudo /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7000.conf'
alias redis7001='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7001.conf'
alias redis7002='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7002.conf'
alias redis7003='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7003.conf'
alias redis7004='sudo  /Users/yangbingxi/www/redis-3.0.3/src/redis-server /usr/local/etc/redis7004.conf'
alias php_fpm_restart='sudo kill -USR2 `cat /usr/local/var/run/php-fpm.pid`'
#alias php_fpm_stop 'sudo kill -INT `cat /opt/local/var/run/nginx/nginx.pid`'
alias ipconfig='ipconfig getpacket en0'
export PS1='\W\$'
alias php='/usr/local/Cellar/php55/5.5.26/bin/php'
export PATH='/usr/local/sbin:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:usr/local/opt/php55/bin'
# mark
export MARKPATH=$HOME/.marks
#export MARKDEFAULT=sanguo#设置你的默认书签，可以直接输入g跳转
function go {
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
#mount ubuntun
alias ubuntu='sshfs wcybxzj@192.168.1.109:/ ~/mountpoint -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'
alias ali_m='sshfs root@123.56.108.205:/  /Users/yangbingxi/ali -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'
alias un_ubuntu='sudo umount -f /Users/yangbingxi/mountpoint'
alias un_ali_m='sudo umount -f /Users/yangbingxi/ali'

alias jump="sudo ssh -i /Users/yangbingxi/.ssh/key.txt rd@54.223.154.105"
alias ali='ssh root@123.56.108.205 -i ~/.ssh/id_rsa'
alias db-dev='mysql -uroot -hdb-dev-00.cvdcrhews6fj.rds.cn-north-1.amazonaws.com.cn -p8uxUUqk9NJtFTh shop'

alias git-info='git  remote show origin'
alias g11='g++ --std=c++11'

alias push_jiepy='git push origin master; git push log master;'

export PATH=/usr/local/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh

# alias pip='pip --proxy 127.0.0.1:1080'

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/yangbingxi/cocos2dx/cocos2d-x-3.3/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/yangbingxi/cocos2dx/cocos2d-x-3.3
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/yangbingxi/cocos2dx/cocos2d-x-3.3/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.4/libexec/bin
export PATH=$ANT_ROOT:$PATH

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
alias ssinit1='nohup sslocal -c /root/www/gist/crolax/config_us2.json &>> /var/log/sslocal.log &'
alias ssinit2='nohup sslocal -c /root/www/gist/crolax/config_jp9.json &>> /var/log/sslocal.log &'
alias sson='export http_proxy=http://127.0.0.1:8118 && export https_proxy=http://127.0.0.1:8118 && privoxy /etc/privoxy/config'
alias ssoff='unset http_proxy && unset https_proxy && systemctl stop privoxy && pkill sslocal'
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
