# Discovr
Graphical clusters of a variety of statistical analysis methods
   
    http://vaionex.com/discovr/


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

(- Bayes Random Tree)


Discovr Shiny App
--------------

The app serves as interactive tool to learn and understand
the discovr syntax.


Installation
--------------
    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("Kohze/Discovr")


Example
--------------

After installation and library() call of Discovr, type in:

    example(Discovr)