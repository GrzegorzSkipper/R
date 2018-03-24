install.packages("caroline")
library(caroline)
install.packages("devtools")
library(devtools)
install.packages('rstudio/shiny')
install_github('rstudio/shiny')

wnioski_csv <- read.table(file = "DataLimit100.csv",sep=",", dec=".", header=TRUE)
head(wnioski_csv)

install.packages("openxlsx")
library("openxlsx")
wnioski_xlsx <- read.xlsx(xlscFile = "DataLimit100.xlsx", sheet = 1)
head(wnioski_xlsx)

#XML instalowanko
install.packages("XML")
install.packages("RCurl")

library("XML")
install.packages("bitops")
library("bitops")
library("RCurl")

xData <- getURL(link)

link <- "http://www.x-rates.com/table/?from=USD&amount=1"
dxData <- getURL(link)
dane_z_html <- readHTMLTable(xData, stringsAsFactors = FALSE)
length(dane_z_html)






install.packages("rjson")
library("rjson")
json_link <-"http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json"
kraje <- fromJSON(file="http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json")
kraje

lenght (kraje[[2]][[3]]$name)




install.packages("RPostgreSQL")
install.packages("postgresql-server-dev-X.Y")
library("postgresql-server-dev-X.Y")
install.packages("RPostgreSQL")
library("RPostgreSQL")
drv <- dbDriver("PostgreSQL")

con <- dbConnect(drv, dbname = "postgres", host = "localhost", port = 5433, user = "postgres", password = "admin")
dbExistsTable(con, "wnioski")

dbDisconnect(drv, dbname = "postgres", host = "localhost", port = 5433, user = "postgres", password = "admin")

wnioski_db <- dbGetQuery(con, "SELECT * from wnioski")

install.packages("dplyr")
library("dplyr")
przefiltrowane <- filter(wnioski_db, wnioski_db$kanal == 'bezposredni')

posortowane <- arrange(przefiltrowane, partner, desc(data_utworzenia))
podsumowanie <- summary(posortowane)
podsumowanie

#AGREGOWANIE
posortowane %>% #tłumacząc: weź mój data frame i wykonaj co następuje po znaczku %>%
  #w summarise definiujemy kolejne agregaty 
  summarise(sr_rekomp = mean(posortowane$kwota_rekompensaty), #sr_rekomp- to nawa kolumny i bedie liona srednia
            med = median(posortowane$kwota_rekompensaty)) #następnie liczymy medianę z kolumny kwota rekom

#AGREGOWANIE
posortowane %>% #tłumacząc: weź mój data frame i wykonaj co następuje po znaczku %>%
  #w summarise definiujemy kolejne agregaty 
  summarise(sr_rekomp = mean(posortowane$kwota_rekompensaty), #sr_rekomp- to nawa kolumny i bedie liona srednia
            med = median(kwota_rekompensaty)) #następnie liczymy medianę z kolumny kwota rekom

#BŁĄD
#GRUPOWANIE
#gdy mamy data frame - możemy %>% wskazujemy że chcemy wykonać na nim operację
posortowane %>%  #weź sobie posortowane i co nstęouje:
  group_by(posortowane$typ_wniosku) %>% #wskazujemy by grupował 
  summarise(sr_rekomp = mean(posortowane$kwota_rekompensaty),
            med = median(posortowane$kwota_rekompensaty), liczba=n()) #liczba=n() to taki sqloqy count

#GRUPOWANIE
#gdy mamy data frame - możemy %>% wskazujemy że chcemy wykonać na nim operację
posortowane %>%  #weź sobie posortowane i co nstęouje:
  group_by(posortowane$typ_wniosku) %>% #wskazujemy by grupował 
  summarise(sr_rekomp = mean(kwota_rekompensaty),
            med = median(posortowane$kwota_rekompensaty), liczba=n()) #liczba=n() to taki sqloqy count


df_stany_wnioskow <- wnioski_db %>%
  group_by(wnioski_db$stan_wniosku) %>% #
  summarise(liczba_rekordow=n(),sum(kwota_rekompensaty)) #suma rekordów i suma kwoty rekompensaty

length(df_stany_wnioskow) #wynik tego to [1] 3 - to oznacza że jest jeden obiekt w którym są 3 kolumny

#funkcja wczytująca dane - najlepiej ją sobie gdzieś zapisac
pobierz_dane <- function(typ_wejscia, link) {
  if(identical(typ_wejscia,"csv")) {
    dane <- read.table(file = as.character(link),sep=",", dec=".", header=TRUE)
  } else if(identical(typ_wejscia,"xlsx")) {
    library(openxlsx)
    dane <- read.xlsx(xlsxFile = as.character(link), sheet = 1)
  } else if(identical(typ_wejscia,"html")) {
    library(XML) #wczytujemy pakiety
    library(RCurl)
    xData <- getURL(link) # pobieramy dane
    dane <- readHTMLTable(xData, stringsAsFactors = FALSE) # probujemy sparsowac HTMl do tabeli
  } else if(identical(typ_wejscia,"json")) {
    library("rjson") # uaktywniamy konieczne pakiety
    dane <- fromJSON(file=link) # wczytujemy JSON
  } else if(identical(typ_wejscia,"db")) {
    library("RPostgreSQL")
    drv <- dbDriver("PostgreSQL")
    con <- dbConnect(drv, dbname = "pg_2", host = "localhost", port = 5432,
                     user = "postgres", 
                     password = "postgres") # to nie jest dobra praktyka na haslo, powinno byc w zmiennych srodowiskowych
    dane <- dbGetQuery(con, paste0("SELECT * from ",link))
  }
  return(dane)
}



for (i in 1:10) print (i)

liczba <- 0
  while(liczba < 10) {
    print (liczba)
    liczba <- liczba +1
  
  }

x<-1
ifelse(x<10, "male", "duze")





#Zadanie 1 napisać funckję która bedzie liczyła pierwiastek z X i Y
wylicz_wartosc <- function(x,y) {
  print(x)
  print(y)
  print(sqrt(x^2+y^2))
  
  print(("zakoncyzłem pracę"))
  return (sqrt(x^2+y^2)) #return jest po to by wskazać funkcji co zwrócić inaczej funkcja zwraca ostatnią wartość z print
  
}

# liczymy pierwiastek
essa <-wylicz_wartosc(3, 2)

essa



#kod od piotrka 
pobierz_dane <- function(typ_danych, link)
{
  switch (typ_danych,
          csv = as.data.frame(read.table(file = link, header = TRUE, sep = ",", dec = ".")) %>% return(),
          html = as.data.frame(readHTMLTable(getURL(link), stringsAsFactors = FALSE)[[1]]) %>% return(),
          json = as.data.frame(fromJSON(file = link)) %>% return(),
          db =
          {
            drv <- dbDriver("PostgreSQL")
            con <- dbConnect(drv, dbname = "pg_2", host = "localhost", port = 5432, user = "postgres", password = "")
            dbExistsTable(con, "wnioski")
            wnioskiaa <- dbGetQuery(con, "SELECT * from wnioski")
            return(as.data.frame(wnioskiaa))
          })
}

df_csv <- pobierz_dane('csv', "dane.csv")
typeof(df_csv)
class(df_csv)

df_xslx <- pobierz_dane('html', "http://www.x-rates.com/table/?from=USD&amount=1")
df_json <- pobierz_dane('json', "http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json")
df_sql <- pobierz_dane('db', NULL)