# this is for Microsoft XBOX 360 Live Cam
cvlc -vvv v4l2:// --sout '#transcode{vcodec=mjpg,vb=2000,width=320,height=240,venc=ffmpeg}:duplicate{dst=standard{access=http,mux=mpjpeg,dst=0.0.0.0:5050/video.mpjpeg}'

#Open this URL to stream:
#http://127.0.0.1:5050/video.mpjpeg

