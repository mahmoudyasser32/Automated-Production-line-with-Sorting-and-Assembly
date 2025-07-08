import cv2
import numpy as np
import serial
import time
SeralObj = serial.Serial('COM6')
#SerialObj2 =serial.Serial('COM13',9600)
#SeralObj_TIVA = serial.Serial('COM6')

SeralObj.baudrate = 9600
SeralObj.bytesize = 8
SeralObj.parity = 'N'
SeralObj.stopbits = 1

#SeralObj_TIVA.baudrate = 9600
#SeralObj_TIVA.bytesize = 8
#SeralObj_TIVA.parity = 'N'
#SeralObj_TIVA.stopbits = 1

#SerialObj2.timeout = 3
time.sleep(3)


rng = np.random.default_rng(12345)
# Load the video capture object or webcam
cap = cv2.VideoCapture(0)  # Use 0 for webcam, or provide video file path

# Define the object to be tracked (in this case, a blue object)
lower_blue = (100, 50, 50)
upper_blue = (130, 255, 255)
lower_red = (170, 50, 50)
upper_red = (180, 255, 255)

# Main tracking loop
while True:
    #Receive_char_from_arduino = SerialObj2.read()
    #print(Receive_char_from_arduino)
    #SerialObj2.close()
    # Read the current frame
    ret, frame = cap.read()
    frame_blur = cv2.GaussianBlur(frame, (17, 17), 0)

    # Convert the frame to the HSV color space
    hsv = cv2.cvtColor(frame_blur, cv2.COLOR_BGR2HSV)

    # Create a mask to filter out the object
    mask1 = cv2.inRange(hsv, lower_blue, upper_blue)  # mask1 for blue detection
    mask2 = cv2.inRange(hsv, lower_red, upper_red)  # mask2 for red detection

    # Morphological operations for noise reduction and refinement
    kernel = np.ones((5, 5), np.uint8)
    mask1 = cv2.morphologyEx(mask1, cv2.MORPH_OPEN, kernel)
    mask1 = cv2.morphologyEx(mask1, cv2.MORPH_CLOSE, kernel)
    mask2 = cv2.morphologyEx(mask2, cv2.MORPH_OPEN, kernel)
    mask2 = cv2.morphologyEx(mask2, cv2.MORPH_CLOSE, kernel)

    edges1 = cv2.Canny(mask1, 1000, 1500)
    edges2= cv2.Canny(mask2,1000 , 1500)
    #applying dilation 
    kerl= cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(2,2))
    dilated1 = cv2.dilate(edges1,kerl,iterations=2)
    dilated2 = cv2.dilate(edges2,kerl,iterations=2)
    # Find contours in the mask
    contours1, _ = cv2.findContours(dilated1, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    contours2, _ = cv2.findContours(dilated2, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # If contours are found, track the largest one and detect shape
    if len(contours1) > 0:
        


# Draw circles on the image
        
        largest_contour1 = max(contours1, key=cv2.contourArea)
        x1, y1, w1, h1 = cv2.boundingRect(largest_contour1)
        

        # Minimum area threshold to filter small contours (adjust as needed)
        shape1="un"
        previous1 = 0
        t=4
        flag_concentrated1=False
        flage21=False
        for maxR in range(9,300,9):

            circles1 = cv2.HoughCircles(mask1, cv2.HOUGH_GRADIENT, 0.9, 1000, param1=600, param2=15, minRadius=t, maxRadius=maxR)
            print(t)
            t+=4
            if circles1 is not None:
                circles1 = np.uint16(np.around(circles1))
                print(circles1)
                
                if len(circles1) == 1:
                    if 60 <= t <80 :
                        flag_concentrated1=True
                    if t>80:
                        flage21=True

                # Detected a single circle
                    for u in circles1[0,:]:
                        cv2.circle(frame, (u[0], u[1]), u[2], (0, 255, 0), 2)
                        cv2.circle(frame, (u[0], u[1]), 2, (0, 0, 255), 3)
                        if flag_concentrated1==True and flage21 ==True:
                            shape1 = "base"
                            BytesWritten1 = SeralObj.write(b'B')
                            print('BytesWritten1 = ',BytesWritten1)
                            cv2.putText(frame, "concentrated Circles", (u[0] - 50, u[1] - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                        elif flag_concentrated1 == False and flage21 == True:
                            shape1 = "lid"
                            BytesWritten2 = SeralObj.write(b'b')
                            print('BytesWritten2 = ',BytesWritten2)
                            cv2.putText(frame, "Single Circle", (u[0] - 50, u[1] - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
        
            

        cv2.rectangle(frame, (x1, y1), (x1 + w1, y1 + h1), (255, 0, 0), 2)
        cv2.putText(frame, f'Blue - {shape1}', (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255,0,0))
    else:
         BytesWrittenN = SeralObj.write(b'n')
         print('BytesWrittenN = ',BytesWrittenN)

    if len(contours2) > 0:
        largest_contour2 = max(contours2, key=cv2.contourArea)
        x2, y2, w2, h2 = cv2.boundingRect(largest_contour2)
        
        # Minimum area threshold to filter small contours (adjust as needed)
        shape2="un"
        previous2 = 0
        o=4
        flag_concentrated2=False
        flage22=False
        for maxR in range(9,300,9):

            circles2 = cv2.HoughCircles(mask2, cv2.HOUGH_GRADIENT, 0.7, 1100, param1=1000, param2=15, minRadius=o, maxRadius=maxR)
            print(o)
            o+=4
            if circles2 is not None:
                circles2 = np.uint16(np.around(circles2))
                print(circles2)
                
                if len(circles2) == 1:
                    if 60 <= o <80 :
                        flag_concentrated2=True
                    if o>80:
                        flage22=True

                # Detected a single circle
                    for u in circles2[0,:]:
                        cv2.circle(frame, (u[0], u[1]), u[2], (0, 255, 0), 2)
                        cv2.circle(frame, (u[0], u[1]), 2, (0, 0, 255), 3)
                        if flag_concentrated2==True and flage22 ==True:
                            shape2 = "base"
                            BytesWritten3 = SeralObj.write(b'R')
                            print('BytesWritten3 = ',BytesWritten3)
                            cv2.putText(frame, "concentrated Circles", (u[0] - 50, u[1] - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                        elif flag_concentrated2 == False and flage22 == True:
                            shape2 = "lid"
                            BytesWritten4 = SeralObj.write(b'r')
                            print('BytesWritten4 = ',BytesWritten4)
                            cv2.putText(frame, "Single Circle", (u[0] - 50, u[1] - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

        cv2.rectangle(frame, (x2, y2), (x2 + w2, y2 + h2), (0, 0, 255), 2)
        cv2.putText(frame, f'Red - {shape2}', (x2, y2 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255))
    else:
        BytesWrittenN = SeralObj.write(b'n')
        print('BytesWrittenN = ',BytesWrittenN)
    # Display the frame
    cv2.imshow("Object Tracking",frame)

    # Exit the loop if 'q' is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the video capture object and close windows
cap.release()
cv2.destroyAllWindows()