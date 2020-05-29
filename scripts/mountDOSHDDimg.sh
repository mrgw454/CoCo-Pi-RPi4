# https://www.linuxquestions.org/questions/linux-software-2/how-to-mount-dos-img-file-4175430554/
# https://sites.google.com/site/dotalshoff/games/dosbox
# Few sites make large, blank *.img files available, so there are a few in the Attachments section.  Here is the relevant drive geometry:

# 256MB image:    512,63,16,520
# 512MB image:    512,63,32,520
# 520MB image:    512,63,16,1023
# 1GB image:        512,63,64,520
# 2GB image:        512,63,64,1023

#256MB image
sudo mount -t msdos -o loop,offset=32256 $HOME/.dosbox/256MBHDD.img /media/DOSHDD

