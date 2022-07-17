import cv2
video_path = 'C:/Users/dell/PycharmProjects/Shadow_project_Android/output/video_playback_verification/video/videoplay.mp4'
frame_path = 'C:/Users/dell/PycharmProjects/Shadow_project_Android/output/video_playback_verification/frames/'

vid = cv2.VideoCapture(video_path)
success, image = vid.read()
count = 0
while success:
    cv2.imwrite(frame_path + "frame%d.jpg" % count, image)
    success, image = vid.read()
    count += 1