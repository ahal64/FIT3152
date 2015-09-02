library(scales)
library(ggplot2)
qplot(promotion_type,sales_unit,
      fill=category_name,
      geom='bar',
      data=marketingData,
      stat="identity")+scale_y_continuous(labels = comma)

qplot(promotion_type,sales_unit,
      fill=category_name,
      geom='bar',
      data=marketingData,
      stat="identity",position="identity")+scale_y_continuous(labels = comma)

alignText<-theme(axis.text.x = element_text(angle=90, vjust=1))
qplot(category_name,sales_unit,
      fill=promotion_type,
      weight=sales_velocity,
      geom='bar',
      data=marketingData,
      stat="identity",position="identity")+alignText


+scale_y_continuous(labels = comma)



qplot(promotion_type,
     sales_velocity,
     geom='bar',
     fill=marketingData$category_name,
     data=marketingData,
     stat="identity",position="identity")+scale_y_continuous(labels = comma)



