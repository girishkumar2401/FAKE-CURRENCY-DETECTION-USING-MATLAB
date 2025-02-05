# Fake Currency Detection using MATLAB

## Introduction
This project aims to detect counterfeit currency using image processing techniques in MATLAB. The system analyzes various features of currency notes such as texture, color, and security patterns to differentiate between genuine and fake notes.

## Features
- **Image Preprocessing:** Converts the currency note image to grayscale, enhances contrast, and removes noise.
- **Feature Extraction:** Extracts key characteristics such as edges, texture, watermark, and serial number.
- **Comparison with Database:** Matches extracted features with a dataset of genuine notes.
- **Classification:** Uses machine learning or predefined thresholds to classify the note as real or fake.
- **Result Display:** Displays the status of the currency note along with processed images.

## Requirements
- MATLAB (R2020a or later recommended)
- Image Processing Toolbox
- Computer Vision Toolbox (optional but recommended for advanced feature extraction)
- A dataset of genuine and fake currency images

## Installation
1. Clone or download the repository.
2. Open MATLAB and set the working directory to the project folder.
3. Ensure that all required toolboxes are installed.

## Usage
1. Run `main.m` in MATLAB.
2. Upload an image of the currency note.
3. The system will process the image and display whether the note is genuine or fake.

## Dataset Preparation
- Collect high-resolution images of genuine and fake currency.
- Store them in separate folders (`genuine/` and `fake/`).
- Ensure images are properly labeled for training and testing.

## Methods Used
- **Preprocessing:** Gaussian filtering, edge detection (Canny), and thresholding.
- **Feature Extraction:** Histogram analysis, texture features (GLCM), and ORB/SIFT keypoints.
- **Classification:** SVM, KNN, or a simple threshold-based approach.

## Results
- Displays processed images with detected security features.
- Provides confidence level in classification.
- Saves results for further analysis.

## Limitations
- Performance depends on image quality and lighting conditions.
- May require a large dataset for better accuracy.

## Future Enhancements
- Implement deep learning for improved classification.
- Enhance dataset with more variations of fake currency.
- Develop a mobile-friendly version using MATLAB Mobile or Python-based alternatives.



## License
This project is licensed under the MIT License.

## Acknowledgments
- MATLAB Documentation
- Image Processing Toolbox Community
- Open-source datasets for currency analysis

