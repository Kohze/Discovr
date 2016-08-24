
# Discovr

GSOC Page - This repository was created during GSOC 2016. As all commits were done for GSOC by the same user this page represents the best overview over the project. A summary of the GSOC project can be at the website below. 

    http://vaionex.com/discovrWB/

--------------

Graphical clusters of a variety of statistical methods in R. 

The discovr package enables a fast and efficient way to test the most common statistical analysis methods. It therefore allows users to quickly check method specific indicators for the viability of a given method. Thereby, it reduces the trial and error approach R user yet approach most datasets.

During the development we saw the possibility of a rich d3 interactive interface to connect the different tests. Therefore we created a costumized D3 htmlwidget from scratch. 

To have an instant access to all data, the future package is integrated to allow a parallel processing of all statistical tests.

--------------

####The htmlwidget d3 plot can be found here: 

    https://github.com/Kohze/Discovr_graphics


Overview
--------------

###The main module:

    disc(x, method = "unPaired", preset = NULL)

with x as data.frame or data.table. Method is either "paired" or "unPaired".

The main module generates the interactive graphical cluster as plot. By clicking on each of the dots the bubble chart appears for the respective test. The colored lines indicate the output of the test, and the most preferable test to conclude. Green stands for preferable, grey for neutral, red for not applyable. By hoovering over the dots the name of each test related to the dot is displayed on the right area. 

![alt tag](http://vaionex.com/Discovr/disc1.gif)

Here are 3 examples of bubble plots. The bubble size is related to the test output of each test set. By hoovering over the bubbles the exact value is visible as tooltip. To generate those bubbles the D3.pack() routine is used. 

![alt tag](http://vaionex.com/Discovr/DSC03137.jpg)


###The data module:

    disc.data(x, method = "unPaired", preset = NULL)

The data module allows to extract all the data frames the main module graphic output relies on. It will output a list of data frames. (the f.test is here shown as example - all other tests are also available)    

![alt tag](http://vaionex.com/Discovr/disc-data.JPG)


###The shapiro module:

    disc.normal(x)

The shapiro module quickly applies a normality test on all columns and adds a TRUE / FALSE as information next to it.    

![alt tag](http://vaionex.com/Discovr/disc-normal.JPG)

Presets
--------------

Presets for the following methods are available

- FRAP
- FACS


Statistical Tests 
--------------

- Welchs T.Test
- Student T.Test
- Shapiro Wilks Test
- Correlation Test
- Anova Test
- Wilcoxon Test
- Principal Component Analysis
- F-test
- glm AIC summary


Installation
--------------

    if (!require("devtools")) install.packages("devtools")

    install.packages("jsonlite")
    install.packages("future")
    install.packages("Rcpp")
    devtools::install_github('ramnathv/htmlwidgets')
    devtools::install_github("Kohze/Discovr_graphics")
    devtools::install_github("Kohze/Discovr")

Example
--------------

After installation and library() call of Discovr, type in:

    disc(mtcars)


Comming Next
--------------    

- coloring for each bubble depending on significance level
- adding other interactive plot ideas and features with d3

Known Issues
--------------

 - On the mac Rstudio version the htmlwidget is not displayed in correct dimensions yet. 