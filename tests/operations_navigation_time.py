import cv2
video_path = 'C:/Users/dell/PycharmProjects/Shadow_project_Android/output/home_to_lib/home_to_library.mp4'
frame_path = 'C:/Users/dell/PycharmProjects/Shadow_project_Android/output/home_to_lib/frames/'
reference_path = 'C:/Users/dell/PycharmProjects/Shadow_project_Android/output/home_to_lib/reference/reference.jpg'
def navigate_time():
    vid = cv2.VideoCapture(video_path)
    success, image = vid.read()
    count = 0
    while success:
        cv2.imwrite(frame_path+"frame%d.jpg" % count, image)
        success, image = vid.read()
        count += 1
    FPS = count/2
    print("FPS is %d" % FPS)
    print("matching frames with reference frame...")
    loop = True
    image = 0
    while loop:
        reference = cv2.imread(reference_path)
        if image<count:
            frames = cv2.imread(frame_path+"frame%d.jpg" % image)
            if True:
                difference = cv2.subtract(reference,frames)
                b,g,r = cv2.split(difference)
                if cv2.countNonZero(b) == 0 and cv2.countNonZero(g) == 0 and cv2.countNonZero(r) == 0:
                    print("frame no %d is same" % image)
                    launch_time = (image+1)/FPS
                    print("operation switching time is %d" % launch_time+"secs")
                    loop = False
                else:
                    print("reference image is not matching with frame %d" % image)
                image += 1
        else:
            print("reference image is not matching with any frame. Please record for more duration.")
    return launch_time
