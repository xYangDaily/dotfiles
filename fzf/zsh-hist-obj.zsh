#!/usr/bin/env zsh
if [[ ! "$PATH" == */nfs/user/jiaxuyang/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/nfs/user/jiaxuyang/.fzf/bin"
fi

__fzfcmd() {
  echo "fzf"
}
#function zsh_add_history_with_abname_stored() {
#  emulate -L zsh
#  COMMAND_STR=${1%%$'\n'}
#  echo "$PWD; $COMMAND_STR;" >> ~/.zsh_enhanced_history
#  print -Sr ${COMMAND_STR}  #write into stack
#  #fc -p                    #write into HISTFILE
#}

function zsh_ori_pos_stored() {
  emulate -L zsh
  COMMAND_STR=${1%%$'\n'}
  echo $PWD > $HIST_POS_LOG
  print -Sr ${COMMAND_STR}  #write into stack
  #fc -p                    #write into HISTFILE
}

autoload -U add-zsh-hook
add-zsh-hook -Uz zshaddhistory zsh_ori_pos_stored

function edit_abname_history(){
  abname=$1
  search_result=`grep -wn "${abname}" $HIST_OBJ_LOG`
  ret=$?
  
  if [ $ret -eq 0 ]; then
    line_num=`echo ${search_result%%:*}`
    sed -i "${line_num}d" $HIST_OBJ_LOG
    echo ${abname} >> $HIST_OBJ_LOG
  else
    echo ${abname} >> $HIST_OBJ_LOG
  fi
  
}

function zsh_add_history_with_abname_stored() {
  lastarray=(`history | tail -1`)
  historycontent=${lastarray[2,-1]}
  for part in `echo ${historycontent[@]}`;do
    if [ "${part[1]}" = "/" ];then
      [ -e $part ] && $(edit_abname_history $part)
    else
      real_pwd=`cat ${HIST_POS_LOG}`
      [ "$real_pwd" = "" ] && real_pwd=`pwd`
      [ -e $real_pwd/$part ] && $(edit_abname_history $real_pwd/$part)
    fi
  done
}

add-zsh-hook -Uz precmd zsh_add_history_with_abname_stored

function __howsel {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  
  prefix=`pwd`
  selected=( $(tac $HIST_OBJ_LOG | \
    while read line;do 
      local rele_line=""
      if [[ "$line" == "$prefix/"* ]];then
        prefix_slash=${prefix}/
        rele_line=`echo ${line#${prefix_slash}}`
      else 
        rele_line=`echo ${line#${prefix}}`
      fi
      
      if [ ! -z $rele_line ] && echo $rele_line
        
    done |\
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $1  +m" $(__fzfcmd)) )
  local ret=$?
  echo $selected 
  return $ret
}

history_object_widget() {
  local query_prefix freshlbuffer
  if [ "${LBUFFER[-1]}" = " " ]; then 
    query_opts=""
    LBUFFER="${LBUFFER}$(__howsel $query_opts)"
  else
    local lbuffer_array=(`echo ${LBUFFER}`)
    query_prefix=${lbuffer_array[-1]}
    query_opts="--query=${query_prefix}"
    
    local lbuffer_length=`echo -n ${LBUFFER} | wc -m`
    local query_length=`echo -n ${query_prefix} | wc -m`
    local newlbuffersize=$(($lbuffer_length - $query_length))
    freshlbuffer=${LBUFFER[0,$newlbuffersize]}
    
    local right
    search_result=$(__howsel $query_opts)
    if [ $? -eq 0 ];then
      right=$search_result
    else
      right=$query_prefix
    fi
    
    LBUFFER="${freshlbuffer}${right}"
  fi
  
  
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   history_object_widget
