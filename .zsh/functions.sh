# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}

function tns() {
  local ctx=$(kubectl config current-context)
  local cns=$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${ctx}\")].context.namespace}")
  echo "TILLER_NAMESPACE=${cns}"
  echo "${cns}" >! "${HOME}/.tiller_namespace"
  export TILLER_NAMESPACE=${cns}
}

# get the service ip for the named service
function kbip() {
  # local node_ip=$(kubectl cluster-info | grep master | egrep -o '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')
  local node_ip=$(kubectl get pods -l name=tiller -o wide | awk 'NR>1 {print $7}')
  local node_ports=$(kubectl get svc -o json SVC | jq -r '.spec.ports[] | "\(.name) \(.nodePort)"')
  if [[ $(echo "${node_ports}" | wc -l) -eq 1 ]]; then
    echo "${node_ports}" \
      | awk -v ip="${node_ip}" '{print "http://" ip ":"$2}' > >(cat) > >(tr -d '\n' | pbcopy)
  else
    echo "${node_ports}" \
      | awk -v OFS='\t' -v ip="${node_ip}" '{print $1, " http://" ip ":"$2}' \
      | fzf-tmux --cycle \
      | awk '{print $2}' > >(cat) > >(tr -d '\n' | pbcopy)
  fi
}

# list installed versions of kubectl
function kbvers() {
  local vers=`ls -d /usr/local/opt/kubectl@* | awk '{split($0,a,"@"); split(a[2],b,"/"); print b[1]}' | paste -s -d ' '`
  _multi_parts : "($vers)"
}  

# re-link the kubectl binary to a specified version
function kbln() {
  if [ -n "$1" ]; then
    if [ -d "/usr/local/opt/kubectl@$1" ]; then 
      ln -s -f "/usr/local/opt/kubectl@$1/kubectl" "/usr/local/bin/kubectl"
    else
      echo "kubectl $1 not installed"
    fi
  else 
    echo `readlink -n /usr/local/bin/kubectl | awk '{split($0,a,"/"); split(a[5],b,"@"); print b[2]}'`
  fi
}
compdef kbvers kbln