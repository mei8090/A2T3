# Question 2a

install.packages("WDI")
library(WDI)
WDIsearch("gdp.*capita.*PPP")
WDIsearch("CO2.*capita")
library(tidyverse)

wdi_data <- WDI(indicator=c("NY.GDP.PCAP.PP.KD","EN.ATM.CO2E.PC"),start=2010,end=2010,extra=TRUE)
wdi_data = as_tibble(wdi_data)
wdi <- wdi_data %>% rename(GDPpercap=NY.GDP.PCAP.PP.KD,Emit_CO2percap=EN.ATM.CO2E.PC)

install.packages("maps")
library(maps)
dat_map <- map_data("world")
install.packages("countrycode")
library(countrycode)

dat_map$ccode<- countrycode(dat_map$region,origin="country.name",destination="wb")
wdi$ccode <- countrycode(wdi$country,origin="country.name",destination="wb")
merged <- full_join(dat_map, wdi, by="ccode")

ggplot(merged,aes(x=long,y=lat,group=group,fill=Emit_CO2percap))+geom_polygon()
