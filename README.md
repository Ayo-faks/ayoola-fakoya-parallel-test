# Parallel Segmentation test

I started out extracting frames using pixellib from the video to use as training and evaluation dateset.

I labeled the dataset as TeamA and TeamB with VGG annotator.

I trained and evaluated using maskrcnn library.


# Improvements that can be made.

I can train for a longer epoch to improve accuracy.

I can use framework and cloud services like mediapipe, sagemaker, MLflow, roboflow, plainsight to efficiently train, track, build a pipeline and monitor the model and experiments.

I can make the code cleaner.

To test and make inference on the sample video, run the following command:

```
   download model from https://drive.google.com/file/d/1ARidM3rYrJhYVvt1hJfHbYSFU05Be8_N/view?usp=sharing and put it in the same directory as this file
   pip install requirements.txt
   python3 custom.py inference_parallel --weights=mask_rcnn_coco.h5 --video=deepsort_30sec.mp4


