setwd("D:/Mario/Escritorio/datasets/rectangleconsDATA")

library(univariateML)

library(tibble)

data3 <- na.omit(read_tsv("3.tsv"))
data4 <- na.omit(read_tsv("4.tsv"))
data5 <- na.omit(read_tsv("5.tsv"))
data8 <- na.omit(read_tsv("8.tsv"))
data9 <- na.omit(read_tsv("9.tsv"))
data11 <- na.omit(read_tsv("11.tsv"))
data13 <- na.omit(read_tsv("13.tsv"))
data15 <- na.omit(read_tsv("15.tsv"))
data17 <- na.omit(read_tsv("17.tsv"))
data20 <- na.omit(read_tsv("20.tsv"))
data23 <- na.omit(read_tsv("23.tsv"))
data24 <- na.omit(read_tsv("24.tsv"))
data26 <- na.omit(read_tsv("26.tsv"))
data28 <- na.omit(read_tsv("28.tsv"))
data30 <- na.omit(read_tsv("30.tsv"))
data35 <- na.omit(read_tsv("35.tsv"))
data37 <- na.omit(read_tsv("37.tsv"))
data38 <- na.omit(read_tsv("38.tsv"))
data46 <- na.omit(read_tsv("46.tsv"))
data48 <- na.omit(read_tsv("48.tsv"))
data50 <- na.omit(read_tsv("50.tsv"))
data55 <- na.omit(read_tsv("55.tsv"))
data57 <- na.omit(read_tsv("57.tsv"))
data64 <- na.omit(read_tsv("64.tsv"))
data69 <- na.omit(read_tsv("72.tsv"))
data73 <- na.omit(read_tsv("73.tsv"))
data74 <- na.omit(read_tsv("74.tsv"))
data76 <- na.omit(read_tsv("76.tsv"))
data86 <- na.omit(read_tsv("86.tsv"))
data92 <- na.omit(read_tsv("92.tsv"))
data93 <- na.omit(read_tsv("93.tsv"))
data95 <- na.omit(read_tsv("95.tsv"))
data111 <- na.omit(read_tsv("111.tsv"))
data115 <- na.omit(read_tsv("115.tsv"))
data116 <- na.omit(read_tsv("116.tsv"))
data117 <- na.omit(read_tsv("117.tsv"))
data118 <- na.omit(read_tsv("118.tsv"))
data123 <- na.omit(read_tsv("123.tsv"))
data124 <- na.omit(read_tsv("124.tsv"))
data126 <- na.omit(read_tsv("126.tsv"))
data127 <- na.omit(read_tsv("127.tsv"))
data129 <- na.omit(read_tsv("129.tsv"))
data130 <- na.omit(read_tsv("130.tsv"))
data132 <- na.omit(read_tsv("132.tsv"))
data134 <- na.omit(read_tsv("134.tsv"))
data136 <- na.omit(read_tsv("136.tsv"))
data138 <- na.omit(read_tsv("138.tsv"))
data139 <- na.omit(read_tsv("139.tsv"))
data140 <- na.omit(read_tsv("140.tsv"))
data145 <- na.omit(read_tsv("145.tsv"))
data146 <- na.omit(read_tsv("146.tsv"))
data154 <- na.omit(read_tsv("154.tsv"))
data157 <- na.omit(read_tsv("157.tsv"))
data158 <- na.omit(read_tsv("158.tsv"))
data159 <- na.omit(read_tsv("159.tsv"))
data164 <- na.omit(read_tsv("164.tsv"))
data165 <- na.omit(read_tsv("165.tsv"))
data169 <- na.omit(read_tsv("169.tsv"))
data171 <- na.omit(read_tsv("171.tsv"))
data172 <- na.omit(read_tsv("172.tsv"))
data179 <- na.omit(read_tsv("179.tsv"))
data182 <- na.omit(read_tsv("182.tsv"))
data184 <- na.omit(read_tsv("184.tsv"))
data187 <- na.omit(read_tsv("187.tsv"))
data193 <- na.omit(read_tsv("193.tsv"))
data195 <- na.omit(read_tsv("195.tsv"))
data199 <- na.omit(read_tsv("199.tsv"))
data200 <- na.omit(read_tsv("200.tsv"))
data201 <- na.omit(read_tsv("201.tsv"))
data202 <- na.omit(read_tsv("202.tsv"))
data206 <- na.omit(read_tsv("206.tsv"))
data207 <- na.omit(read_tsv("207.tsv"))
data208 <- na.omit(read_tsv("208.tsv"))
data210 <- na.omit(read_tsv("210.tsv"))
data213 <- na.omit(read_tsv("213.tsv"))
data215 <- na.omit(read_tsv("215.tsv"))
 

dataFull <- rbind(data3,data4,data5,data8,data9,data11,data13,data15,
                 data17, data20, data23, data24, data26, data28, data30,
                 data35, data37, data38, data46, data48, data50, data55,
                 data57, data64, data69, data73, data74, data76, data86,
                 data92, data93, data95, data111, data115, data116, data117,
                 data118, data123, data124, data126, data127, data129, data130,
                 data132, data134, data136, data138, data139, data140, data145,
                 data146, data154, data157, data158, data159, data164, data165,
                 data169, data171, data172, data179, data182, data184, data187,
                 data193, data195, data199, data200, data201, data202, data206,
                 data207, data208, data210, data213, data215)


dataFull <- rbind(data3,data4,data5,data8,data9,data11,data13,data15,
                  data17, data20, data23)

dataFull <- rbind(data3,data4,data5,data8,data9,data11,data13,data15,
                  data17, data20, data23, data24, data26, data28, data30,
                  data35, data37, data38, data46, data48, data50, data55,
                  data57, data64, data69, data73, data74, data76, data86,
                  data92, data93, data95, data111, data115, data116, data117,
                  data118, data123, data124, data126, data127, data129, data130,
                  data132, data134, data136, data138, data139, data140, data145,
                  data146, data154, data157, data158, data159, data164, data165,
                  data169, data171, data172, data179, data182, data184, data187,
                  data193, data195, data199, data200, data201, data202, data206,
                  data207, data208, data210, data213, data215)



write_tsv(dataFull,"D:/Mario/Escritorio/datasets/rectangleconsDATA/dataGeneral55.tsv")


