sudo rsync -avu --delete --chown=game:game ./. "/home/game/.factorio/mods/permanence_0.1.0/"

zip -r 'Permanence_0.1.0.zip' ./. -x \*.sh
