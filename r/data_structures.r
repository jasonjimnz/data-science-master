# alberto.fernandez.isabe@urjc.es
# Crear secuencias
seq(1,6)
# Crear secuencias siguiendo un patron
seq(1,6, by=0.5)
# Crear secuencias de x números
seq(1,6, length=10)

# Repetir una secuencia x veces
rep(1,5)
# Repetir un vector x veces
rep(c(1,2),5)
# Repetir una secuencia a partir de una secuencia
rep(1:4,2)
# Iterear entre una secuencia 
rep(1:3, c(1,4,5))

# Vector con valores faltantes
x_na <- c(1,2,3,NA,4,5)
# Ver si existe un valor faltante NA
x_isna <- is.na(x_na)
# Factores
estudiantes.origen <- c("getafe","mostoles","leganes","madrid","parla")
# Longitud
length(estudiantes.origen)
# Como un fator
festudiantes <- as.factor(estudiantes.origen)
# Funciones level y summary
levels(festudiantes)
summary(festudiantes)
# Función tapply, aplica una funcion en cada grupo de componentes del primer argumento con la del segundo utilizando una funcion
# Para que funcione ambos argumentos tienen que tener la misma longitud
estudiantes.altura <- c(1.53,1.65,1.64,1.74,1.90)
tapply(estudiantes.altura, estudiantes.origen, mean)
# Factores ordenados
nivel.ingles <- c("medio", "bajo", "medio", "alto", "medio")
fnivel.ingles = ordered(nivel.ingles, levels=c("bajo", "medio", "alto"))
fnivel.ingles

# Matrices

# matrix(data,row,col)

matrix(1:6) # Matriz 6,1
matrix(1:6, nrow=2) # Matriz 2 ,3
matrix(1:6, nrow=2, byrow=1)

# summary en una matriz da información min, max, media, mediana, etc

# Dataframe, lista de listas, una matriz tiene que tener siempre los mismos tipos de datos, en un dataframe cada lista tiene un tipo
# de dato
# data.frame(data1,data2)
# attach accede a los nombres de variables de un dataframe, lista ó entorno
# deatach anula los accesos

# merge mezcla todos los valores no repetidos si all=TRUE si está all=FALSE (por defecto) los repetidos

# Setear todos los valores NA, 
# Media sin tener en cuenta los NA
mean(airquality[airquality$Month == 7,]$Ozone, na.rm = TRUE)
# Mayor temperatura y ozono

# Operador %>% lanza una función sobre un iterable (matriz, dataframe, etc...)

length(airquality[airquality$Ozone<100&airquality$Temp>90,]$Month)

# tidy r
# Cada variable forma una columna
# Cada observación forma una fila
# Cada tipo de unidad de observación es una tabla
# gather() toma varias columnas y las devuelve clave-valor
# spread() toma dos columnas clave valor y las seapara
# separate() toma una columna y las separa
# unite() toma dos columnas y las unen

# dply
# select() seleciona variables
# filter() ver observacones en las que no coincidde con un valor
# group_by() agrupa
# summarise() ejecuta funciones y devuelve valores de una columna
# arrange() permite ordenar
# inner_join()
df2 <- head(mtcars)
filter(df2,wt < 2.5)
df4 <- head(mtcars)
summarise(df4, mean = mean(disp))

df5 <- head(mtcars)
arrange(df5, wt , hp) # Ordena dataset por las columnas introducidas


# joins
inner_join(band_members, band_instruments, by="name")
left_join(band_members, band_instruments, by="name")
right_join(band_members, band_instruments, by="name")
full_join(band_members, band_instruments, by="name")
# Datos que coinciden en el segundo dataset y muestra los del primero
semi_join(band_members, band_instruments, by="name")
# Datos que no coinciden en el segundo dataset y muestra los del primero
anti_join(band_members, band_instruments, by="name")

# Mutate mutate()
df6 <- head(mtcars)
mutate(df6, cyl_sqr = cyl * cyl) # Añade nueva columna
mutate(df6, cyl_sqr = NULL) # Elimina la columna nombrada


set.seed(1)
stocks <- data.frame(time = as.Date('2009-01-01') + 0:9,
                     Walmart = rnorm(10, 20, 1), Target = rnorm(10, 20, 2),
                     Walgreens = rnorm(10, 20, 4))
# Generar clave valor para stock y precio
s2 <- gather(stocks, key=stock, value=price, "Walmart", "Walgreens")
# Devolver el cambio al valor anterior
s3 <- spread(s2, key=stock, value=price)
# Anidar gather, group by, summarise
stocks %>% gather(key=stock, value=price, "Walmart","Walgreens") %>% group_by(key=stock) %>% summarise(min = min(price), max = max(price))