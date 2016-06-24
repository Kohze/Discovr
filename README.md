# Discovr
Graphical clusters of a variety of statistical analysis methods (work in progress)

The discovr package will enable a fast and efficient way to test the most common statistical analysis methods. It will therefore allow users to quickly check method specific indicators for the viability of a given method. Thereby, it will reduce the trial and error approach R user yet approach most datasets. At the same time, it will increase the use of the full spectrum of statistical methods.

#Note: We are now designing a costumized d3.js output with our own d3.js syntax. The next major update there is expected at the 30th of june.

Overview
--------------
   
    http://vaionex.com/discovr/

![alt tag](http://vaionex.com/rob/Discovr/output_14G9Da.gif)

note: The gif only shows 6 heatmap fields - the end result will have ~20-25. Additionally the interactive map will not display the row/column but the related test for each heatmap field. 

Syntax
--------------

    disc(x, method = "unpaired", preset = NULL, style = "heatmap")

with x as data.frame or data.table. Method is either "paired" or "unpaired".


Style
--------------

Different graphical styles will be available

- Heatmap
- Ternary Plot
- Cleveland Dot Plot


Presets
--------------

Presets for the following methods are available

- FRAP
- FACS


Statistical Tests 
--------------

- Welchs T.Test
- Shapiro Wilks Test
- Correlation Test
- Anova Test
- Chi Square Test
- Wilcoxon Test
- Mann-Whitney U test
- Principal Component Analysis
- F-test

(- Bayes Random Tree)


Discovr Shiny App
--------------

The app serves as interactive tool to learn and understand
the discovr syntax. (work in progress)


Installation
--------------
    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("Kohze/Discovr")


Example
--------------

After installation and library() call of Discovr, type in:

    example(Discovr)