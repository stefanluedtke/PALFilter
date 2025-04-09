# Filtering PAL signals from FPOD data

This small R package allows you to distinguish PAL signals from actual harbor porpoises in F-POD data. 
The package contains an XGBoost model which was trained on clicktrains of PALs and F-POD data that were manually annotated.
It assumes that the clicktrain data is available in a specific format. An example of this format is contained in the package and can be loaded with `data(pal.sample)`. 

You can install the package using devtools:
```
library(devtools)
install_github("stefanluedtke/PALFilter")
```

Here's a basic usage example of the package: 
```
library(PALFilter)

#use the trained XGBoost model to predict probabilities for each sample
#(click train) of coming from a porpoise (and not from a PAL)
data(pal.sample)
preds <- porpoiseProb.xgb(pal.sample)

#we can use these probabilities, for example, to only keep samples that
#are porpoises with a high probability
THRESH = 0.8
pal.filtered = pal.sample[preds >=0.8,]
```

Note that this is a machine learning approach that does not guarantee that all data will be classified correctly. 
Notably, the less similar your data is from the original training data of the model, the higher the chance for misclassifications.
Thus, it is highly recommended to check the performance of the model on your data: Annotate part of your data manually, run the model and check the accuracy, sensitivity and specificity. 
In case the pre-trained model does not perform satisfactory, you can annotate part of your data manually and train your own ML model on that data.
