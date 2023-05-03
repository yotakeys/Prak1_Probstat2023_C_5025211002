# Prak1_Probstat2023_C_5025211002

### Identitas

    Nama: Keyisa Raihan Illah Setiadi
    NRP: 5025211002
    Kelas: Probabilitas dan Statistik (C)

### No 1
Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488.
Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran,
maka:

#### 1 A.
Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan
parameter yang sesuai.

##### Penyelesaian :
```
Distribusi yang sesuai adalah distribusi binomial, karena kemungkinannya hanya ada 2 yaitu Laki laki/ tidak laki laki
Lalu karena terdapat lebih dari 1 maka termasuk distribusi Binomial bukan bernouli
Rumus -> P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)
```
#### 1 B.
Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin lakilaki?

##### Penyelesaian : 
Untuk mengetahui probabilitas suatu titik pada distribusi binomial, kita bisa menggunakan fungsi `dbinom(x, size, prob)` pada bahasa R. Kita hanya perlu memasukkan nilai titik (x) yang ingin dicari, banyak percobaan (size), dan juga probabilitas keberhasilan (prob)
```R
x <- 3
p <- 0.488
size <- 10
ans <- dbinom(x=x, size=size, prob=p)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233845114-1c25821e-3fe2-481b-b873-086f45f42784.png">

#### 1 C.
Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin
laki-laki?

##### Penyelesaian :
Untuk mengetahui probabilitas dalam interval dari titik ke sebelah kirinya titik tersebut, ktia bisa menggunakan fungsi `pbinom(q,size,prob)` pada bahasa R. Parameternya ada `q` yaitu titik batas maksimal, `size` yaitu banyak percobaan, dan `prob` yaitu probabilitas keberhasilan suatu titik. karena yang diminta adalah probabilitas bahwa kurang dari 3 bayi berkelamin laki laki, maka batas maksimal `q` yang dimasukkan adalah 2, bukan 3 dikarenakan 3 tidak include.
```R
q <- 2
p <- 0.488
size <- 10
ans <-  pbinom(q=q, size=size, prob=p)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233845497-a1485c63-2173-4389-ab9a-aedc2a4d666f.png">


#### 1 D.
Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin
laki-laki?
##### Penyelesaian :
sama seperti 1C., bedanya kita ingin mengetahui probabilitas di sebelah kanan titik, oleh karena itu kiat perlu menambahkan parameter `lower.tail=FALSE` ke fungsi `pbinom`. dengan begitu hasilnya akan sama dengan `1 - pbinom(bagian kiri pada 1C.)`.
```R
q <- 2
p <- 0.488
size <- 10
left <- FALSE
ans <- pbinom(q=q, size=size, prob=p, lower.tail=left)
ans
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233845790-a8ae2c9e-2b2f-41c9-a73a-7743d4d8f888.png">

#### 1 E.
Berapa nilai harapan dan simpangan baku banyak bayi laki-laki?
##### Penyelesaian :
Pada distribusi binomial nilai harapan adalah `n*p` atau banyak percobaan dikalikan probabiltitas keberhasilan suatu percobaan. Lalu untuk simpangan baku, dikarenakan varian distribusi binomial adalah `n*p*q` atau nilai harapan dikali dengan probabilitas tidak berhasil suatu percobaan, maka simpangan baku nya adalah akar dari varians yaitu `sqrt(n*p*(1-p))`
```R
n <- 10
p <- 0.488
nilai_harapan <- n*p
nilai_harapan
simpangan_baku <- sqrt(n*p*(1-p))
simpangan_baku
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233845830-50ce5f6c-d3a7-48d6-a5bf-b7861b9fbda2.png">

#### 1 F.
Gambarkan histogram pendistribusian banyak bayi laki-laki.
##### Penyelesaian :
kita hanya perlu memanggil fungsi plot(), dengan array 1-10 sebagai X, dan probabilitas tiap X  dengan `dbinom` sebagai Y
```R
n <- 0:10
size <- 10
p <- 0.488
plot(n, dbinom(x=n, size=size, prob=p), 
     type='h',
     main='Distribusi Binomial',
     xlab='Banyak bayi laki-laki',
     ylab='Probabilitas'
     )
```
##### Output (`Dapat dilihat pada plot kanan bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846045-45a1f4d0-bb1f-43c9-8d97-8c34ad547059.png">


### No 2
Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik
ban dalam 20 tahun ke depan adalah 1,8.

#### 2 A.
Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan
distribusi dengan parameter yang sesuai.

##### Penyelesaian : 
```
Distribusi yang sesuai adalah poison, dikarenakan terjadi pada lingkup 
ruang dan waktu tertentu
Rumus -> P(X=k) = e^(-1.8) (1.8^k / k!)
```

#### 2 B.
Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja
pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas
berdasarkan distribusi yang telah dipilih.
##### Penyelesaian :
Kejadianya tergolong tidak biasa, namun bukan yang sangat jarang Karena kemungkinan terjadinya tergolong tidak terlalu jauh dengan kemungkinan terjaidnya pada daerah dekat dengan lambda, untuk mencari probabilitasnya kita hanya perlu menggunakan fungsi `dpois(x, lambda)`, dengan x adalah titik yang ingin dicari, dan lambda adalah tingkat keberhasilan rata rata.
```R
x <- 4
lambda <- 1.8
ans <- dpois(x=x,lambda=lambda)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/235758320-ee45332c-75b5-4bed-a009-4e768245091b.png">

#### 2 C.
Berapa peluang paling banyak 4 kematian akibat kanker tulang?
##### Penyelesaian : 
Untuk mencari peluang interval pada distribusi poisson, kita hanya perluu memanggil fungsi `ppois(q, lambda)`, dengan q adalah batas kanan, dan lambda adalah rata rata keberhasilan
```R
q <- 4
lambda <- 1.8
ans <- ppois(q=q, lambda=lambda)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846450-9d96a082-9952-4bb8-bcf2-0477a373b969.png">

#### 2 D.
Berapa peluang lebih dari 4 kematian akibat kanker tulang?
##### Penyelesaian : 
Sama seperti 2C. bedanya karena yang diinginkan adalah daerah kanan titik, maka perlu ditambahkan parameter `lower.tail=FALSE`.
```R
q <- 4
lambda <- 1.8
left <- FALSE
ans <- ppois(q=q, lambda=lambda, lower.tail=left)
ans
```

##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846563-f8717121-9e15-4fca-acbc-07606bdfe2eb.png">

#### 2 E.
Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar
deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?
##### Penyelesaian : 
nilai harapan pada distribusi poisson adalah sama dengan rata rata keberhasilan / lambda, sednagkan standar deviasinya akan sama dengan akar dari nilai harapan/varians tersebut
```R
nilai_harapan <- lambda <- 1.8
nilai_harapan
standar_deviasi <- sqrt(lambda)
standar_deviasi
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846660-66240889-0a6f-4cac-a068-5ecb24206d48.png">

#### 2 F.
Gambarkan histogram pendistribusian banyak banyak kematian akibat kanker
tulang untuk pekerja pabrik ban
##### Penyelesaian : 
untuk menggambarkan histogramnya kita hanya perlu menggunakan fungsi `plot()` dengan x merupakan titik kejadian (untuk kasus ini saya nyatakan 1 -10, karena diatas 6, probabilitas sudah 0), sedangkan probabilitas titik tersebut dengan `dpois()` sebagai y
```R
n <- 0:10
lambda <- 1.8
plot(n, dpois(n, lambda=lambda),
     type='h',
     main='Poisson Distribution',
     ylab='Probabilitas',
     xlab ='Banyak kematian'
     )
```
##### Output (`Dapat dilihat pada plot kanan bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846788-eb58deb9-58ea-4295-aff1-678b8f3e5e97.png">

#### 2 G.
Gunakan simulasi untuk memeriksa hasil sebelumnya.
##### Penyelesaian : 
untuk membuat simulasi, kita hanya perlu memanggil fungsi `rpois(n, lambda)`, dengan n merupakan banyak simulasi yang ingin dibuat (pada contoh ini saya isi 10), agar hasilnya tak berubah rubah tiap kali di run/panggil , kita gunakan `set.seed()`
```R
n <- 10
lambda <- 1.8
set.seed(123456789)
ans = rpois(n=n, lambda=lambda)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233846928-96d096bc-209c-454c-9312-bbaa48b278df.png">


#### 2 H.
Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda.
Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda.
##### Penyelesaian : 
```
Pada simulasi dengan set.seed(123456789) agar reproducible dengan jumlah simulasi n = 10
Didapat hasil [2,2,2,2,4,4,1,4,1,1], dari hasil simulasi tersebut dapat kita lihat hasil 
yang muncul cukup beragam, namun tidak terlalu jauh dari nilai lambda/mean yaitu 1.8.
Sehingga kejadian pada 2D atau kematian diatas 4 jarang terjadi, tetapi bukanya tidak mungkin,
Pada beberapa kali percobaan random lainya, dapat ditemukan kematian yang lebih banyak dari 4
sekitar pada 5-7 kematian, tapi tentu saja kemungkinannya sangat kecil.
```

### No 3
Diketahui nilai x = 3 dan v = 10. Tentukan:

#### 3 A.
Fungsi probabilitas dari distribusi Chi-Square
##### Penyelesaian : 
untuk mencari fungsi probabilitas dengan diketahui x dan v nya maka kita hanya perlu menggunakan fungsi `dchisq(x, df)`
```R
x <- 2
v <- 10
ans <- dchisq(x=x, df=v)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233847111-03d6ee0c-5cee-4400-b4fa-29d2681c81b4.png">


#### 3 B.
Histogram dari distribusi Chi-Square dengan 500 data acak.
##### Penyelesaian : 
untuk menampilkan histogram dengan 500 data acak kita hanya perlu menggunakan fungsi `hist()` , lalu untuk menghasilkan data acakanya kita hanya perlu memanggil fungsi `rchisq(n, v)` dengan n adalah jumlah data acak yang diinginkan, agar hasil yang dihasilkan sama kita menggunakan `set.seed()`
```R
set.seed(123456789)
n <- 500
v <- 10
hist(rchisq(n, v), xlab = "X", ylab = "Jumlah", main = "Histogram Chi-Square")
```
##### Output (`Dapat dilihat pada plot kanan bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233847267-946ed94c-5db7-45d7-af65-7399c2a49bbd.png">

#### 3 C.
Nilai rataan (μ) dan varian (σ²) dari distribusi Chi-Square
##### Penyelesaian : 
pada distribusi chi-square, rataan akan sama dengan derajak kebebasanya atau v, sedangkan untuk varianya akan sama dengan `2*v`
```R
rataan <- v <- 10
rataan
varian <- 2 * v
varian
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233847361-cd9468ce-690c-4737-b216-8a4d2c5c348a.png">

### No 4
Diketahui data bangkitan acak sebanyak 100 dengan mean = 45 dan sd = 5.
Tentukan:

#### 4 A.
Fungsi probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung z-scorenya
dan plot data bangkitan acaknya dalam bentuk grafik. Petunjuk (gunakan
fungsi plot()).
##### Penyelesaian : 
Untuk membuat data acaknya kita hanya perlu menggunakan `rnorm()`, lalu untuk z-score nya sebenarnya kaan otomatis terlihat pada bagian variables pada R-studio untuk array data tersebut, namun dapat dihitung dengan rumus `data-mean/sd` untuk setiap data array. lalu untuk probabilitas pada P(X1 <= x <= X2) dapat dihitung dengan `pnorm()` untuk X2 dikurangi dengan `pnorm()` pada X1, yang X1 dan X2 nya di dapat dari acak dengan fungsi `runif()` tetapi beda batasan. Terakhir, untuk plot kita hanya perlu memnaagil fungsi `plot(data)` untuk mengeplot data acak tadi.
```R
set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
data
summary(data)
z_scores <- (data-mean(data))/sd(data)
z_scores
probs <- pnorm(runif(1, mean, max(data)), mean, sd) - pnorm(runif(1, min(data), mean), mean, sd)
probs
plot(data)
```

##### Output (`Dapat dilihat pada console kiri bawah dan plots kanan bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233847573-0c337731-5644-4cad-af42-49c28ff9353a.png">


#### 4 B.
Gambarkan histogram dari distribusi Normal dengan breaks 50
##### Penyelesaian : 
untuk menggambarkan histogram kita hanya perlu memanggil fungsi `hist()` dari data tersebut, dengan breaks yang diinginkan
```R
set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
breaks = 50
hist(data, breaks, main = "Histogram distribusi normal")
```
##### Output (`Dapat dilihat pada plots kanan bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233848017-ac06b3c4-1413-4497-96ac-24bd20976d0a.png">


#### 4 C.
Nilai varian (σ²) dari hasil data bangkitan acak distribusi Normal
##### Penyelesaian : 
carian dari distribusi normal adalah standar deviasi data dikuadratkan
```R
set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
varian = sd(data) ^ 2
varian
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233848293-7dc57069-d713-4ac7-af3e-450cf838a20f.png">

### No 5
Kerjakanlah menggunakan distribusi T-Student

#### 5 A.
Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan
6 derajat kebebasan?
##### Penyelesaian : 
untuk mengetahui probabilitas kiri interval dari distribusi T-student kira hanya perlu memanggil fungsi `pt(q, df)` pda R, dengan q adalah batas kanan, dan df adalah derajat kebebasan
```R
q <- -2.34
df <- 6
ans <- pt(q=q, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233850114-bb4bf613-5cd8-4a7f-8498-77333b8f8944.png">

#### 5 B.
Berapa probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6
derajat kebebasan?
##### Penyelesaian :
Hampir sama seperti no 5A, bedanya pada batas dan yang dicarai adalah interval kanan, sehingga perlu menambahkan parameter `lower.tail=FALSE`
```R
q <- 1.34
df <- 6
left = FALSE
ans <- pt(q=q, df=df, lower.tail = left)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233850249-74b61750-8f66-4f6e-b740-f16b7290eb16.png">

#### 5 C.
Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau
lebih besar dari 1,23 dengan 3 derajat kebebasan?
##### Penyelesaian : 
Karena yang diinginkan adalah kurang dari -1,23 dan lebih dari 1,23, dikarenakan probabilitas T-student yang simetris antara kanan dan kiri, maka hasilnya dapat dihitung dari -1,23 ke kiri di kali 2 (`2 * p(-takhingga<x<-1.23`)
```R
q <- -1.23
df <- 3
ans <- 2 * pt(q=q, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233850357-11fc3a6d-ef94-4879-bcd7-508f9d170b97.png">

#### 5 D.
Berapa probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94
dan 0,94 dengan 14 derajat kebebasan?
##### Penyelesaian : 
Hampir sama seperti 5 C, bedanya adalah pada titik x nya dan pada soal kali ini yang dicari adalah yang didalam dari interval tersebut, sehingga untuk mengihtungnya hanya perlu `1 - p(probabilitas diluar kanan/kiri)` atau sama dengan `1 - (2 * p(-takhingga<x<-0.94)`
```R
q <- -0.94
df <- 14
ans <- 1 - ( 2 * pt(q=q, df=df))
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233850550-5c1f26ab-3afe-4f57-808b-16c7c6fd3204.png">

#### 5 E.
Berapa nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333
satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut?
##### Penyelesaian : 
Kebalikan dari soal soal sebelumnya, kali ini yang dicari adalah titik / nila t-score nya jika diketahui derajat kebebasan dan luasan/ probabilitasnya. Untuk mengetahui hal tersebut dapat menggunakan fungsi `qt(x, df)`, dengan x adalah luasan probabilitasnya. dalam kasus ini nilai x nya adalah 0.0333
```R
x <- 0.0333
df <- 5
ans <- qt(x, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233851099-b63e930a-e592-42ed-a10b-0cb3a91bdab1.png">



#### 5 F.
Berapa nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125
satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut?
##### Penyelesaian : 
Hampir sama seperti soal 5E. namun dalam kasus ini nilai x nya adalah `1-0.125` karena 0.125 adalah luasan dikanan, maka untuk mencari t score nya kita hanya perlu mencari t score yang luasan di kirinya `= 1 - luasan kanan`
```R
x <- 1 - 0.125
df <- 25
ans <- qt(x, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233851006-4208cbc7-45b2-44ce-b70c-4e8f433edab2.png">

#### 5 G.
Berapa nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75
satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari
nilai t-score tersebut?
##### Penyelesaian : 
hampir sama dengan soal 5E dan 5F, bedanya dalam kasus ini `0.75 + ((1-0.75)/2)` karena 0.75 adalah luasan dalam interfal t score tersebut dengan negatifnya. sehingga kita dapat mengetahui t scorenya dengan menambahkan luasan tersebut dengan luasan pada interval kirinya/sampai tak hingga. nilai pada bagian kirinya akan sama dengan `(1-{luasan dalam}) /2` karena luasan dalam tidak mencakup bagian kanan setelah t score, dan bagian kiri sebelum negatif t scorenya. sehingga luasan total dari t score hingga full ke kiri adalah `0.75 + ((1-0.75)/2)`
```R
x <- 0.75 + ((1-0.75)/2)
df <- 11
ans <- qt(x, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233851202-7813e586-7612-44aa-bbbd-5ae00365919d.png">


#### 5 H.
Berapa nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333
satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan
negatif dari nilai t-score tersebut?
##### Penyelesaian : 
Hampir sama dengan 5G. bedanya pada kasusini luasan yang diketahui adalah di luar t score dan negatifnya, yaitu t score sampai tak hingga dan juga mines tak hingga samapai negatif t score. sehingga untuk mengetahui t scorenya ktia hanya perlu mengetahui luasan t score ke kiri, yaitu dengan cara `1 - (0.0333/2)`, karena 0.0333 adalah luasan pada kedua sisi pojok, maka perlu dibagi 2 untuk mengetahui luasan dikanannya saja. setelah mengetahui luasan kanan, kita tinggal mengurangi 1 dengan luasan kanan tersebut untuk mengetahui luasa dari t score hingga ke kiri / mines tak hingga
```R
x <- 1 - (0.0333/2)
df <- 23
ans <- qt(x, df=df)
ans
```
##### Output (`Dapat dilihat pada console kiri bawah`) :
<img width="960" alt="image" src="https://user-images.githubusercontent.com/85614845/233851224-9a888c09-3c3f-4f42-aceb-dbf6a9b91437.png">
