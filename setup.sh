function log {
    echo $(date +%F_%T) $$ $BASHPID $1
}

log "Cloning plySampler"
git clone git@github.com:JinghaoZhao/plySampler.git

log "Cloning pydraco"
git clone --recursive git@github.com:JinghaoZhao/pydraco.git

cd pydraco
git clone git@github.com:JinghaoZhao/draco.git

cd ../
docker-compose build
docker-compose up -d