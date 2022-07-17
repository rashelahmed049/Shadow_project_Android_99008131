import cv2
def Video_Play_Back():
    status = False
    ReferenceImage1 = "C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Videoplayback/reference/ref1.jpg"
    ReferenceImage2 = "C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Videoplayback/reference/ref2.jpg"
    reference1 = cv2.imread(ReferenceImage1)
    reference2 = cv2.imread(ReferenceImage2)
    difference = cv2.subtract(reference1, reference2)
    b, g, r = cv2.split(difference)
    if cv2.countNonZero(b) > 0 and cv2.countNonZero(g) > 0 and  cv2.countNonZero(r) > 0:
        print("Video PLayback Successful")
        status = True
    else:
        print("Video PLayback Unsuccessful")
        status = False
    return status