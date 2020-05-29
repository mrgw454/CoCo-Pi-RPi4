NOW=$(date +"%Y-%m-%d_%H-%M-%S")

cd $HOME

tar czvf /media/share1/rclone/dropbox/CoCoPi-CoreFilesBackup-$NOW.tar.gz \
scripts \
.mame \
.xroar \
.dosbox \
 DriveWire4 \
emceed \
lwwire \
pyDriveWire \
tcpser \
rclone \
.bashrc \
.profile \
.nanorc \
.fonts \
.config \
.nano \
.coco3x

/
