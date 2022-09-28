###Super Group Sept 28, 2022###
  
###Convert Clip###
convert_clip <- function() {
  gsub("\\\\", "/", readClipboard())
}
convert_clip()

###Load Data###
test_data <- read.csv("C:/Users/nicho/OneDrive/Desktop/Life/Idaho/rcodeggplot/test_data.csv")


###Library Packages###
library(ggplot2)

###Super Basic Plot###
ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean))# +
#  geom_boxplot()

###Bare Minimum}
ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  geom_boxplot() +
  labs(
    x = "Diagnosis",
    y = "Average Radius (cm)",
    title = "Malignant Tumors Are On Average Larger")

###Getting There... with a Theme and Pretty Colors!}
library(ggthemes)

ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  geom_boxplot(fill = "violet") +
  labs(
    x = "Diagnosis",
    y = "Average Radius (cm)",
    title = "Malignant Tumors Are On Average Larger") +
  theme_minimal() ##+
#  theme_excel()

###Publication Ready?
gg_options <-  function(){
  theme_bw()+theme(
    panel.grid = element_blank(),
    strip.background = element_blank(),
    panel.background =  element_blank(),
    legend.title = element_blank(),
    legend.background =  element_blank(),
    legend.box.background = element_blank(),
    legend.key = element_blank(),
    plot.title=element_text(hjust=0.5))
}

ggplot(data = test_data,
       mapping = aes(x = diagnosis,
                     y = radius_mean)) +
  labs(
    x = "Diagnosis",
    y = "Average Radius (cm)",
    title = "Malignant Tumors Are On Average Larger") +
  geom_boxplot(fill = "violet", alpha = 0.5) +
  gg_options() #+ 
# geom_jitter(color="black", size=0.4, alpha=0.9)
