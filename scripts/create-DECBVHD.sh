# create 578MB DSK image (for use with YA-DOS)

#expr 35 \* 18
#630

#expr 630 \* 256
#161280

#expr 161280 \* 14
#2257920

#os9 format -e -l2257920 DiskBasicVHD.dsk
#Format Summary
#--------------
#Geometry Data:
#      Cylinders: 4410
#          Heads: 128
#  Sectors/track: 4
#    Sector size: 256

#Logical Data:
#  Total sectors: 2257920
#  Size in bytes: 578027520
#   Cluster size: 8


os9 format -e -l2257920 DECBVHD.DSK

