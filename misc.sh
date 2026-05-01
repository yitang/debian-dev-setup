#!/usr/bin/env bash

sudo -K

sudo apt-get install ledger
sudo apt-get install jekyll
sudo gem install s3_website jekyll-paginate
sudo apt-get install gnome-shell
sudo apt-get install -y graphviz

# sudo pip3 install Pygments
# sudo pip3 install awscli
# sudo pip3 install snakemake

sudo apt-get install npm # node JS

# gem install jekyll-paginate

# mailspring - email client
curl -fS -o /tmp/mailspring.deb https://github.com/Foundry376/Mailspring/releases/download/1.20.1/mailspring-1.20.1-amd64.deb
sudo dpkg -i /tmp/mailspring.deb
sudo apt-get install -f -y
rm /tmp/mailspring.deb

sudo apt-get install -y ack-grep guake graphviz tree

# sudo apt-get install -y postgresql postgresql-client libpq-dev
