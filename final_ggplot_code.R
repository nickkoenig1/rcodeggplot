###Super Group Sept 28, 2022###
###Author: Nick Koenig###
###Contact: koen2388@vandals.uidaho.edu###
  
###Convert Clip / Flips The Slash if Needed###
convert_clip <- function() {
  gsub("\\\\", "/", readClipboard())
}
convert_clip()

###Load Data###
test_data <- read.csv("C:/Users/nicho/OneDrive/Desktop/Life/Idaho/rcodeggplot/test_data.csv")


###Library Packages###
library(ggplot2)

###Super Basic Plot###
ggplot(data = test_data, #Calls the Data
       mapping = aes(x = diagnosis, #X-Axis Data Source
                     y = radius_mean)) + #Y-Axis Data Source
  geom_boxplot()

###Bare Minimum}
ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  geom_boxplot() +
  labs(
    #X-Axis Label
    x = "Diagnosis", 
    #Y-Axis Label
    y = "Average Radius (cm)", 
    #Adds Title Un-Centered
    title = "Malignant Tumors Are On Average Larger")
    

###Getting There... with a Theme and Pretty Colors!###
library(ggthemes)

ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  #Fills Boxplot with Violet
  geom_boxplot(fill = "orange") +
  labs(
    x = "Diagnosis",
    y = "Average Radius (cm)",
    title = "Malignant Tumors Are On Average Larger") +
  #Add the Minimal Theme
  theme_minimal() ##+
#  theme_excel()

###Publication Ready?###

#GG Options for Beautiful GG Plot Makes You Not Basic
gg_options <-  function(){
  theme_bw()+theme(
    #No Grid
    panel.grid = element_blank(),
    #No Lines
    strip.background = element_blank(),
    #No Gray Background
    panel.background =  element_blank(),
    #No Legend Title
    legend.title = element_blank(),
    #No Legend Background
    legend.background =  element_blank(),
    #No Legend Box Background
    legend.box.background = element_blank(),
    #No Legend Key
    legend.key = element_blank(),
    #Plot Title in the Middle
    plot.title=element_text(hjust=0.5))
}

ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  labs(
    x = "Diagnosis",
    y = "Average Radius (cm)",
    title = "Malignant Tumors Are On Average Larger") +
  #Makes the Boxplot Fill 50%
  geom_boxplot(fill = "orange", alpha = 0.5) +
  #Adds in Option Function Above
  gg_options() + 
  #Adds Points Randomly In Box Plot
 geom_jitter(color="black", size=0.4, alpha=0.9)
