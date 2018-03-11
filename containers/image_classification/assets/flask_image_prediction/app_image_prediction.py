

import os,sys,re, csv
import random
import json
from flask import Flask, render_template, json, request, redirect, jsonify, url_for, session
from werkzeug.utils import secure_filename
#import flask_login
import requests
import datetime, time

import numpy as np
from keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img
from keras.models import Sequential
from keras.layers import Dropout, Flatten, Dense
from keras import applications
from keras.utils.np_utils import to_categorical
from keras.models import load_model
import math
#import cv2 # pip install opencv-python
import base64
from PIL import Image
from io import BytesIO
#import cStringIO
from io import StringIO

'''
conda install keras
#pip install numpy
#pip install pandas
#pip install nose
#pip install pillow
#pip install h5py
#pip install tensorflow
pip install py4j
#pip install opencv-python

cd /tmp
git clone https://github.com/fchollet/deep-learning-models
cd deep-learning-models
ls -al
'''

################################################################################################
#
#   Flask App
#
################################################################################################

app = Flask(__name__)
app.secret_key = os.urandom(24)

################################################################################################
#
#   Global Variables
#
################################################################################################

image_directory     = os.getcwd()+'/static/model_images'
#model_vgg16        = applications.VGG16(include_top=False, weights='imagenet')
model_vgg16         = load_model(os.getcwd()+'/static/assets/vgg16_model.h5')
model_weights_path  = os.getcwd()+'/static/assets/weights.h5'
class_dictionary    = np.load(os.getcwd()+'/static/assets/class_indices.npy').item()
index_number        = 0

################################################################################################
#
#   Functions
#
################################################################################################


def get_all_images(image_directory):
    return [image_directory+'/'+file for file in os.listdir(os.getcwd()+image_directory.replace('.',''))]


def get_random_image():
    all_images = [image_directory+'/'+file for file in os.listdir(image_directory)]
    return all_images[random.randint(0,len(all_images)-1)]


def get_sequential_image():
    '''
    image_map.txt Contents:
    01_alligator.jpeg
    02_alligator.jpeg
    03_water.jpeg
    04_water.jpeg
    05_alligator.jpeg
    06_elephant.JPG
    07_elephant.JPG
    08_elephant.JPG
    '''
    file  = open('image_map.txt','rb')
    data  = file.read().split()
    file.close()
    image = data[0]
    data  = data[1:] + [image]
    try:
        file  = open('image_map.txt','wb')
        file.write(b'\n'.join(data))
        file.close()
    except:
        print('[ ERROR ] Issue writing to image_map.txt')
    return os.getcwd() + '/static/model_images/' + image.decode('utf-8')


def predict_from_image_path(image_path, model_vgg16, model_weights_path, class_dictionary):
    
    num_classes = len(class_dictionary)
    
    # Read Image Path
    image_path = image_path
    #   orig = cv2.imread(image_path)
    
    #print("[INFO] loading and preprocessing image...")
    image = load_img(image_path, target_size=(224, 224))
    image = img_to_array(image)
    
    # important! otherwise the predictions will be '0'
    image = image / 255
    
    image = np.expand_dims(image, axis=0)
    
    # get the bottleneck prediction from the pre-trained VGG16 model
    bottleneck_prediction = model_vgg16.predict(image)
    
    # build top model
    model = Sequential()
    model.add(Flatten(input_shape=bottleneck_prediction.shape[1:]))
    model.add(Dense(256, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(num_classes, activation='sigmoid'))
    
    model.load_weights(model_weights_path)
    
    # use the bottleneck prediction on the top model to get the final
    # classification
    class_predicted = model.predict_classes(bottleneck_prediction)
    
    probabilities = model.predict_proba(bottleneck_prediction)
    
    inID = class_predicted[0]
    
    inv_map = {v: k for k, v in class_dictionary.items()}
    
    prediction_prob = round(probabilities[0][inID], 8)
    prediction     = inv_map[inID]
    #prediction      = 'Alligator' if prediction_prob >= .8 else 'No Alligator'
    
    return prediction.upper(), float(prediction_prob)*100


def predict_from_base64_image(image_base64_encoded, model_vgg16, model_weights_path, class_dictionary):
    
    num_classes = len(class_dictionary)
    
    # Read Image (as Base64 encoded)
    #image = open('/tmp/modeling/training/alligator/alligator_1.jpeg', 'rb')
    #image_read = image.read()
    #image_64_encode  = base64.encodestring(image_read)
    #image_64_encode  = image_base64_encoded
    #image_64_decode  = base64.decodestring(image_64_encode) 
    #image_64_nparray = np.frombuffer(image_64_decode, dtype=np.uint8)
    #image_64_nparray= np.frombuffer(image_64_decode, dtype=np.uint8)
    
    #print("[INFO] loading and preprocessing image...")
    #image = load_img(image_path, target_size=(224, 224))
    #image = img_to_array(image)
    
    image_data = image_base64_encoded
    #image_data = re.sub('^data:image/.+;base64,', '', image_64_encode)             # Not working
    #image = Image.open(BytesIO(base64.b64decode(image_data)))                      # Not working
    image_data = re.sub('^data:image/.+;base64,', '', image_data).decode('base64')
    #image = Image.open(cStringIO.StringIO(image_data))     # Used for python 2.x
    image = Image.open(StringIO(image_data))                # Used for python 3.x
    image = image.resize((224,224),Image.ANTIALIAS)
    image = img_to_array(image)
    
    # important! otherwise the predictions will be '0'
    image = image / 255
    image = np.expand_dims(image, axis=0)
    
    # get the bottleneck prediction from the pre-trained VGG16 model
    bottleneck_prediction = model_vgg16.predict(image)
    
    # build top model
    model = Sequential()
    model.add(Flatten(input_shape=bottleneck_prediction.shape[1:]))
    model.add(Dense(256, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(num_classes, activation='sigmoid'))
    
    model.load_weights(model_weights_path)
    
    # use the bottleneck prediction on the top model to get the final
    # classification
    class_predicted = model.predict_classes(bottleneck_prediction)
    
    probabilities = model.predict_proba(bottleneck_prediction)
    
    inID = class_predicted[0]
    
    inv_map = {v: k for k, v in class_dictionary.items()}
    
    prediction_prob = round(probabilities[0][inID], 8)
    prediction     = inv_map[inID]
    #prediction      = 'Alligator' if prediction_prob >= .8 else 'No Alligator'
    
    return prediction.upper(), float(prediction_prob)*100


###################################################################################################
#
#   Configure Image
#
###################################################################################################

UPLOAD_FOLDER = './static/uploaded_files'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


################################################################################################
#
#   Index
#
################################################################################################
@app.route('/', methods = ['GET','POST'])
@app.route('/index', methods = ['GET','POST'])
def index():
    
    if request.method == 'GET':
        #image_path                 = get_random_image()
        image_path                  = get_sequential_image()
        image_path_html             = re.sub('.*?static','./static',image_path)
        #random_prob                = random.random()*10 + 88
        prediction, prediction_prob = predict_from_image_path(image_path, model_vgg16, model_weights_path, class_dictionary)
        return render_template('index.html', image_path_html=image_path_html, prediction=prediction, prediction_prob=prediction_prob)
    
    if request.method == 'POST':
        
        try:
            file = request.files['file']
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                image_path_html = os.path.join(app.config['UPLOAD_FOLDER'], filename)
                file.save(image_path_html)
        except:
            image_path_html = ''
        
        prediction, prediction_prob = predict_from_image_path(image_path_html, model_vgg16, model_weights_path, class_dictionary)
        
        return render_template('index.html', image_path_html=image_path_html, prediction=prediction, prediction_prob=prediction_prob)



################################################################################################
#
#   API
#
################################################################################################
@app.route('/api', methods = ['GET','POST'])
def api():
    if request.method == 'POST':
        
        '''
        curl -i -H "Content-Type: multipart/form-data" -X POST -F 'file=@/tmp/themepark_01.jpeg' http://localhost:4444/api
        curl -i -H "Content-Type: application/json" -X POST -d '{"file":"Spectre"}' http://localhost:4444/api
        r = requests.post('http://localhost:4444/api', json={'image':'base64_encoded_image_string'})
        '''
        
        image_base64_encoded = re.sub('^data:image/.+;base64,', '', request.json['image'])
        
        prediction, prediction_prob = predict_from_base64_image(image_base64_encoded, model_vgg16, model_weights_path, class_dictionary)       
        
        response = {'prediction_label':prediction, 'prediction_prob':prediction_prob}
        
        return jsonify(response)



################################################################################################
#
#   Run App
#
################################################################################################

if __name__ == "__main__":
    #app.run(debug=True, threaded=False, host='0.0.0.0', port=4444)
    app.run(threaded=False, host='0.0.0.0', port=4444)


################################################################################################
#   
#   References:
#       
#       Encoding / Decoding
#       https://code.tutsplus.com/tutorials/base64-encoding-and-decoding-using-python--cms-25588
#       https://stackoverflow.com/questions/26070547/decoding-base64-from-post-to-use-in-pil
#
#
################################################################################################

#ZEND
