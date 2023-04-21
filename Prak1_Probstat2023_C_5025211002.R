
# Nama  : Keyisa Raihan Illah Setiadi
# NRP   : 5025211002
# Kelas : Probabilitas dan Statistik (C)

# No 1
# Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488.
# Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran,
# maka:

# Poin 1a.
# Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan
# parameter yang sesuai.
# Jawab : 
# Distribusi yang sesuai adalah distribusi binomial, karena kemungkinannya hanya ada 2 yaitu Laki laki/ tidak laki laki
# Lalu karena terdapat lebih dari 1 maka termasuk distribusi Binomial bukan bernouli
# Rumus -> P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)

# Poin 1b.
# Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin lakilaki?
# Jawab : 
x <- 3
p <- 0.488
size <- 10
ans <- dbinom(x=x, size=size, prob=p)
ans

# Poin 1c.
# Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin
# laki-laki?
# Jawab : 
q <- 2
p <- 0.488
size <- 10
ans <-  pbinom(q=q, size=size, prob=p)
ans

# Poin 1d.
# Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin
# laki-laki?
# Jawab : 
q <- 2
p <- 0.488
size <- 10
left <- FALSE
ans <- pbinom(q=q, size=size, prob=p, lower.tail=left)
ans

# Poin 1e.
# Berapa nilai harapan dan simpangan baku banyak bayi laki-laki?
# Jawab : 
n <- 10
p <- 0.488
nilai_harapan <- n*p
nilai_harapan
simpangan_baku <- sqrt(n*p*(1-p))
simpangan_baku

# Poin 1f.
# Gambarkan histogram pendistribusian banyak bayi laki-laki.
# Jawab : 
n <- 0:10
size <- 10
p <- 0.488
plot(n, dbinom(x=n, size=size, prob=p), 
     type='h',
     main='Distribusi Binomial',
     xlab='Banyak bayi laki-laki',
     ylab='Probabilitas'
     )

# No 2
# Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik
# ban dalam 20 tahun ke depan adalah 1,8

# Poin 2a.
# Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan
# distribusi dengan parameter yang sesuai.
# Jawab : 
# Distribusi yang sesuai adalah poison, dikarenakan terjadi pada lingkup 
# ruang dan waktu tertentu
# Rumus -> P(X=k) = e^(-1.8) (1.8^k / k!)

# Poin 2b.
# Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja
# pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas
# berdasarkan distribusi yang telah dipilih.
# Jawab : Kejadianya tergolong tidak biasa, namun bukan yang sangat jarang
# Karena kemungkinan terjadinya tergolong tidak terlalu jauh dengan
# kemungkinan terjaidnya pada daerah dekat dengan lambda, yaitu->
x <- 0
lambda <- 1.8
ans <- dpois(x=x,lambda=lambda)
ans

# Poin 2c.
# Berapa peluang paling banyak 4 kematian akibat kanker tulang?
# Jawab : 
q <- 4
lambda <- 1.8
ans <- ppois(q=q, lambda=lambda)
ans

# Poin 2d.
# Berapa peluang lebih dari 4 kematian akibat kanker tulang?
# Jawab : 
q <- 4
lambda <- 1.8
left <- FALSE
ans <- ppois(q=q, lambda=lambda, lower.tail=left)
ans

# Poin 2e.
# Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar
# deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?
# Jawab : 
nilai_harapan <- lambda <- 1.8
nilai_harapan
standar_deviasi <- sqrt(lambda)
standar_deviasi

# Poin 2f.
# Gambarkan histogram pendistribusian banyak banyak kematian akibat kanker
# tulang untuk pekerja pabrik ban.
# Jawab : 
n <- 0:10
lambda <- 1.8
plot(n, dpois(n, lambda=lambda),
     type='h',
     main='Poisson Distribution',
     ylab='Probabilitas',
     xlab ='Banyak kematian'
     )

# Poin 2g.
# Gunakan simulasi untuk memeriksa hasil sebelumnya.
n <- 10
lambda <- 1.8
set.seed(123456789)
ans = rpois(n=n, lambda=lambda)
ans

# Poin 2h.
# Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda.
# Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda.
# Jawab :
# Pada simulasi dengan set.seed(123456789) agar reproducible dengan jumlah simulasi n = 10
# Didapat hasil [2,2,2,2,4,4,1,4,1,1], dari hasil simulasi tersebut dapat kita lihat hasil 
# yang muncul cukup beragam, namun tidak terlalu jauh dari nilai lambda/mean yaitu 1.8
# karena kemungkinan terbesar kematian terjadi terletak pada daerah dekat lambda/ range 0-5
# Seperti jawaban 2d, kejadian kematian = 4 bukanlah hal yang biasa, namun tidak jarang terjadi
# dibuktikan dengan kemunculan yang cukup sering pada simulasi (walaupun tergantung seed pada simulasi)
# jumlah kematian yang biasa terjadi terletak pada angka 1 atau 2 (setelah dibandingkan dengan beberapa seed lain)

# No 3
# Diketahui nilai x = 3 dan v = 10. Tentukan:

# Poin 3a.
# Fungsi probabilitas dari distribusi Chi-Square
# Jawab : 
x <- 2
v <- 10
ans <- dchisq(x=x, df=v)
ans

# Poin 3b.
# Histogram dari distribusi Chi-Square dengan 500 data acak.
# Jawab : 
set.seed(123456789)
n <- 500
v <- 10
hist(rchisq(n, v), xlab = "X", ylab = "Probabilitas", main = "Histogram Chi-Square")

# Poin 3c.
# Nilai rataan (μ) dan varian (σ²) dari distribusi Chi-Square
# Jawab : 
rataan <- v <- 10
rataan
varian = 2 * v
varian
