is.numeric(2)
2^3
2**3
2343455326343253245432543252**2243532452
234**234
34**2
sqrt(3)
5%/%3 # dzielenie bez reszty
5%%3 # dzielenie z resztą

# łańcuchy znków
is.character("yoł madafaka")
nchar("yoł madafaka")
nchar("yołmadafaka")
tolower("yoł madafaka")
toupper("yoł madafaka")
strtrim("yoł madafaka", 5)

paste("yoł madafaka", "gangsta")
paste("yoł madafaka", "gangsta", sep = "")
paste("yoł madafaka", "gangsta", sep = "__&%##_")

madafaka <- factor(c("jigga", "wigga", "nigga", "bronx", "bronx", "bronx"))
table(madafaka)


1==0
is.logical(1==0)
1|0 # czy jest różne
1>0
1<0
1<=0


#wektor
c(2,3,4,5,6,7)

is.vector(c(2,3,4,5,6,7))

seq(2, 200, by=2) #wektor o długości którą ustalamy

rep(1:3, times=3) # powiela od 1 do 3 3 razy

rep(1:3, each=3) #powiela każdy element n-krotnie

length(c(2,3,4,5,6,7)) 

sort(c(2,3,4,5,6,7))

rev(c(2,3,4,5,6,7))

table(c(2,3,4,5,6,7))

unique(c(2,3,4,5,6,7))

x <- c(2,3,4,5,6,7)
y <- c(4,2,7,9,5,3,5,7,9,0,0,0,1,2,3,3,2,4,5,6,6)


x[4]
y[-9]
x[2:4]
x[-(2:4)]
x[c(1,5)]
x[x==7]
x[x<4]
t <- c("bi", "si", "fi", "mi")
t[t%in% c("bi", "si")]

x <- c(4, 5, 6, 7)
y <- c(4, 5, 6, 7)
min(x)
max(y)
sum(y)
x+y

cbind(x,y)
rbind(x,y)


x <-matrix(1:4, ncol = 2)
y <-matrix(5:8, ncol = 2)
z <-matrix(1:28, nrow = 4)
z

t(x) # t to transpozycja

x+y
x/y
x*y
sqrt(x)
x%*%y



#LISTY
lista <-  list(imie=c("Jan", "Tomasz"),
               nazwisko="kowalski", wiek=23,
               czywzwiazku=T)

lista$imie

lista[1]

l <- list(x=1:5, y=c('a', 'b'))

l[[2]]


#ramki danych,

dt <-  data.frame(id=c(1,2,3), 
                  wiek=c(23,34,45),
                  czy.chlopiec=c(T,T,F))

class(dt)

dt[1:2, 1:3]

dt[,1:2] #




x <- c(seq(20,35))

x

y <- c(1,8,2,6,3,8,5,5,5,5)

sum(y)

roznica <- max(y)-min(y)
roznica

zad3 <- c(rep(4, times=8), rep(6, times=7), rep(3, times=10))

#Zadanie 4
rodzina <- data.frame(imie=c("Stefan", "Zbigniew", "Zenon", "Halinka"),
                      nazwisko=c("Konstyntanopolitanczykowicze"),
                      wiek=c(45, 18, 12, 43),
                      plecCzyKobieta=c(F,F,F,T),
                      miejsce_zamieszkania=c("Kozice_dolne", "Mielno", "Kozice_dolne","Kozice_dolne" ))
rodzina



#instrukcje warunkowe

x <- 3
y <- 4

if (x>y) print ("prawda") # IF działa tylko na jendym elemencie

new <- if (x<y) print ("prawda") else ("Fałsz")
new

ifelse(x>y, "Prawda", "Fałsz") #IFELSE działa wektorowo


# powtórka dla wektorów z większym zakresem X i Y
x <- 1:2
y <- 2:1

if (x>y) print ("prawda") # IF działa tylko na jendym elemencie

new <- if (x<y) print ("prawda") else ("Fałsz")
new

ifelse(x>y, "Prawda", "Fałsz") #IFELSE działa wektorowo


#

x <- 1
y <- x
if (x<y) {
  print("Prawda")
  print(1)
} else if (x==y) {
  print("To samo")
} else {
  print("Fałsz")
}





# pętle

for (i in 1:4) {
  print(i)
  
}

x <- c(1,3,5,6,8)

for (i in x) {
  print(i)
}



# WHILE - zapętla do czasu wykonania warunku

i <-  0
while (i<5) {
  cat(paste("juz", i , "\n"))
i <-  i+1
}

#Zadanie 5
imiona <-  c("Żdzichu", "Zenek", "Marian", "Franek", "Mirek")

for (imie in imiona) {
  print(paste("Nazywam się", imie))
}

for (imie in imiona[1:5]) {
  print(paste("Nazywam się", imie))
}


## Biblioteki

install.packages("UsingR", dependencies=T) #dependencies - czy chcemy dosintalować zalezności

library("UsingR")


help.search("weighted mean") #info o funkcji
help(package="dplyr")  #info o pakiecie

?mean # info o funkcji w skosób krótki ale musi być w złąadowanym pakiecie

?cancer


data("babyboom")

head(babyboom, 100)
tail(babyboom)

data("alltime.movies")
head(alltime.movies)




# ładowanie danych z CSV

read.csv(file,
         header=T,
         sep=",",
         quote="\"",
         dec=".",
         fill=T,
         comment.char = "", ...)



#zadanie 6.

dane <- read.csv("IndianLiverPatientDataset.csv", header=T, stringsAsFactor=T, sep=";")


#struktury danych sprawdza się tak"

str(dane)


#jeśli podejrzewamy że mamy puste pola to może zrobić tak:

dane

mean(dane$age)

sd(dane$age)

summary(dane$age)

summary(dane)

describe(dane$age)
describe(dane)

table(dane$gender) #podsumowanie konkretnych kategorii


#wizualizacje danych wykresiki"

boxplot(dane, col="green")

boxplot(dane$tot_proteins, col="blue")


#histogram wizualizacja

hist(dane$tot_proteins)

hist(dane$tot_proteins, col="red")


#scatterplot

plot(dane$age, dane$tot_bilirubin)

plot(dane$age, dane$albumin)


#korelacja

library(corrplot)



#Dane kategoryczne


barplot(table(dane$gender))



#ulepszanie wykresu - lepsze wykresiki w zalezności od 

plot(dane$age, dane$albumin)

plot(dane$age, dane$albumin,
     xlab="Wiek",
     ylab="Poziom Albuminy",
     main="Wiek vs. poziom albuminy",
     type="p", #h p 
     pch=15,
     col="blue",
     bty="l")




# Zadania
7. Stwórz wykres przedstawiający zależność pomiędzy dwoma wybranymi parametrami.


plot(dane$tot_proteins, dane$age,
     xlab="Białka",
     ylab="Wiek",
     main="Wiek vs. Białka",
     type="p",
     pch=20,
     col="green",
     bty="l")

8. Utwórz ramkę danych zawierającą zmienne: age, tot_proteins, ag_ratio zbadane u mężczyzn. Stwórz histogram dla każdej ze zmiennych, pomijając mężczyzn po 80 roku życia.

9. Z ramki mtcars utwórz ramkę mtcars6, która zawiera informację jedynie o samochodach z 6 cylindrami. Wyświetl tabelę zawierającą podstawowe statystki (dla ramki mtcars6)

mtcars6 <- mtcars[mtcars$cyl==6,]
summary(mtcars6)


?summary



Pakiety <- ("devtools", "xlsx")
