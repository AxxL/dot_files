# -*- mode:shell-script -*-
# http://wiki.ubuntuusers.de/Zsh
if [[ -x /usr/lib/command-not-found ]] ; then
        function command_not_found_handler() {
                /usr/lib/command-not-found --no-failure-msg -- $1
        }
fi

# prompt adam2
# http://demo.deegree.org/utah-workspace/services/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetCapabilities
function freshStart {
    # z starter application
    cd /srv/mapbender/releasebranch/3.0.5/mapbender-starter/application
    sudo rm -rf app/cache/*
    sudo rm -rf app/logs/*
    app/console doctrine:schema:drop --force
    app/console doctrine:schema:create
    app/console fom:user:resetroot --username root --password root --email root@root.de --silent
    app/console doctrine:fixtures:load --fixtures=./mapbender/src/Mapbender/CoreBundle/DataFixtures/ORM/Epsg/ --append
    app/console doctrine:fixtures:load --fixtures=./mapbender/src/Mapbender/CoreBundle/DataFixtures/ORM/Application/ --append
    sudo rm -rf app/cache/*
    sudo rm -rf app/logs/*
}


# prompt adam2
# http://demo.deegree.org/utah-workspace/services/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetCapabilities
function testYaml {
    # Z starter application
    sudo -u postgres dropdb mb305_test_yaml
    cd /srv/mapbender/releasebranch/3.0.5/mapbender-starter/application
    sudo rm -rf app/cache/*
    sudo rm -rf app/logs/*
    app/console doctrine:database:create
    app/console doctrine:schema:create
    app/console fom:user:resetroot --username root --password root --email root@root.de --silent
    app/console doctrine:fixtures:load --fixtures=./mapbender/src/Mapbender/CoreBundle/DataFixtures/ORM/Epsg/ --append
    app/console doctrine:fixtures:load --fixtures=./mapbender/src/Mapbender/CoreBundle/DataFixtures/ORM/Application/ --append
    sudo rm -rf app/cache/*
    sudo rm -rf app/logs/*
}

function cleanMapbender {
    sudo rm -rf app/cache/*
    sudo rm -rf app/logs/*
}

function cleanMetador {
    sudo rm -rf var/cache/*
    sudo rm -rf var/logs/*
    sudo rm -rf var/sessions/*
}


export ALTERNATE_EDITOR=""
# alias e='emacsclient -t'
