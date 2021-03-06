# DOS style clear
alias cls="clear"

# flush DNS cache
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"

# empty all trashes
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

alias allup="githubup; brewup; apm update"
alias allclean="emptytrash; cleanup -h; lsclean; lpclean; flushdns"

# GitHub Professional Services PDFify
alias ghpdf="pdfify --header ~/github/pdfify-node/assets/header.hbs --style ~/github/pdfify-node/assets/style.css"
