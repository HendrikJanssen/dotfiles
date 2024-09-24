path=('/opt/homebrew/bin' '/opt/homebrew/sbin' "$HOME/.dotnet/tools" $path)

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

use_java() {
    export JAVA_HOME=$(/usr/libexec/java_home -F -v $1)
}

use_java 17

PATH="/Users/hjanssen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/hjanssen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/hjanssen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/hjanssen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/hjanssen/perl5"; export PERL_MM_OPT;
