require("jsonlite")
require("RCurl")
require("ggplot2")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Titanic where pclass is not null"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_mmc2762', PASS='orcl_mmc2762', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

require(extrafont)
ggplot() +
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_continuous() +
  facet_grid(~PCLASS, labeller=label_both) +
  labs(title='Titanic') +
  labs(x="SEX", y=paste("FARE")) +
  layer(data=df,
    mapping=aes(x=SEX, y=as.numeric(as.character(FARE))),
    stat="boxplot", 
    stat_params=list(),
    geom="boxplot", 
    geom_params=list(color="black", fill="cyan"),
    position=position_dodge()
)
