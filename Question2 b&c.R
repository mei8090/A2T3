# Question 2b

# install packages required
install.packages("devtools")
devtools::install_github("DougLuke/UserNetR")
library(UserNetR)
install.packages("statnet")
library(statnet)
install.packages("sna")
library(sna)

data(Bali)
get.vertex.attribute(Bali,"vertex.names")

# mar- to set the margin sizes in the following order: bottom, left, top, and right
op <- par(mar = c(0,0,0,0))
# the automatic labels are based on information stored in the vertex.names
plot(Bali,displaylabels=TRUE,label.cex=0.8,pad=0.4,label.col="darkblue")


#Question 2c

#replacing the names with their roles using text stored in the role vertex attribute
rolelab <- get.vertex.attribute(Bali,"role")
plot(Bali,usearrows=FALSE,label=rolelab,displaylabels=T,label.col="darkblue")

