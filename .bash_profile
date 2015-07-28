export PS1="\u@\h:\W$"
alias p='python'
alias ll='ls -lt'
alias lla='ls -alt'
alias lld='ll|grep "^d"'
alias llf='ll|grep "^-"'
alias lll='ll|grep "^l"'
alias cl='clear'
alias g='grep -rn --color=auto'
alias f='find'
alias p2='arch -i386 python'
alias p3='python3'
alias mongod='sudo mongod --config /usr/local/etc/mongod.conf &'
alias memcached='memcached -d -P /tmp/memcached.pid'
alias goagent='nohup python /Users/yangbingxi/goagent/local/proxy.py  2>&1 > /dev/null &'
alias crolax='nohup /Users/yangbingxi/crolax/shadowsocks-local-mac -c  /Users/yangbingxi/crolax/config.json 2>&1 > /dev/null &'
alias wireshark='nohup /usr/local/Cellar/wireshark/1.12.0/bin/wireshark-qt 2>&1 > /dev/null &'
alias phpmd='/Users/yangbingxi/www/game_server_v1.1/vendor/phpmd/phpmd/src/bin/phpmd'
alias php-fpm='/usr/local/Cellar/php55/5.5.26/sbin/php-fpm'
alias redis-server='sudo redis-server /usr/local/etc/redis.conf &'
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
alias log_m='sshfs root@42.62.24.92:/data/www/dev/ybx  /Users/yangbingxi/www/log_m -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'
alias dev_m='sshfs root@42.62.24.92:/data/www/dev/  /Users/yangbingxi/www/dev/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'
alias log_root_m='sshfs root@42.62.24.92:/  /Users/yangbingxi/www/log_root_m -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'
alias ali_m='sshfs root@182.92.111.153:/  /Users/yangbingxi/py_www/ali -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=somename'

alias jump="sudo ssh -i /Users/yangbingxi/.ssh/key.txt rd@54.223.154.105"

alias un_log_m='sudo umount -f /Users/yangbingxi/www/log_m'
alias un_ubuntu='sudo umount -f /Users/yangbingxi/mountpoint'

alias lost_s='ssh root@42.62.24.87 -p 2208' #192.168.133.87
alias second_s='ssh root@42.62.52.67 -p 2208' #192.168.133.67
alias web2_s='ssh root@42.62.24.83 -p 2208' #192.168.133.101
alias cool_s='ssh root@42.62.52.68 -p 2208' #192.168.133.68
alias luck_s='ssh root@42.62.29.11 -p 2208' #192.168.133.189
alias duke_s='ssh root@42.62.24.85 -p 2208'
alias ali_s='ssh root@182.92.111.153 -p 22'
alias zhao_s='ssh root@10.10.10.100'

alias git-info='git  remote show origin'
alias g11='g++ --std=c++11'

alias push_jiepy='git push origin master; git push log master;'
alias db-dev='mysql -uroot -hdb-dev-00.cvdcrhews6fj.rds.cn-north-1.amazonaws.com.cn -p8uxUUqk9NJtFTh'
alias db-s0='mysql -uroot -hshangcheng_online_s0.cvdcrhews6fj.rds.cn-north-1.amazonaws.com.cn -p'

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
