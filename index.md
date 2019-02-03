---
title: DDP Final Project
subtitle: Electric power plants in the U.S.
author: Jaime Leal
date: February 02, 2019
output: ioslides_presentation
---



## Application overview
<div style='text-align: center;'>
    <img height=200px src='./overview.png' />
</div>
The application shows the locations of the electric power plants in the United States segmented by their primary energy source.

### How to use it

**Input** : From the dropdown list on the right, select the primary energy source.

**Output** : The interactive map diplays each location of a power plant with a circle. 
If the markers are near each other they are grouped as a cluster. To see each individual location, zoom in.


## Data source
The U.S. Energy Information Administration has a dataset of 8940 electric power plants in the U.S. There is information about the location of each plant, its capacity and primary source.


```r
# x = "https://www.eia.gov/maps/map_data/PowerPlants_US_EIA.zip"
# download.file(x,"PowerPlants_US.zip")
# unzip("PowerPlants_US.zip","PowerPlants_US_201810.dbf")
power_plants <- foreign::read.dbf("PowerPlants_US_201810.dbf")
print(dim(power_plants))
```

```
## [1] 8940   31
```

```r
print(as.character(unique(power_plants$PrimSource)))
```

```
##  [1] "hydroelectric"  "natural gas"    "coal"           "nuclear"       
##  [5] "petroleum"      "pumped storage" "geothermal"     "biomass"       
##  [9] "wind"           "other"          "batteries"      "solar"
```


## Map: clusters 1/2
<div style='text-align: center;'>
    <img width=100% src='./map1.png' />
</div>

The interactive map diplays each location of a power plant with a blue circle. 
The markers that are near each other are grouped as a cluster. In this case there are three main clusters...


## Map: clusters 2/2
<div style='text-align: center;'>
    <img width=100% src='./map2.png' />
</div>

... to see each individual location, zoom in.

