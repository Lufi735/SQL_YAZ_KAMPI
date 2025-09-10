CREATE TABLE books(
book_id INT PRIMARY KEY IDENTITY , /* Declare Unique ID */
title NVARCHAR(30) NOT NULL,
author NVARCHAR(30) NOT NULL,
genre NVARCHAR(30) ,
price DECIMAL(10,2) CHECK(price > 0) ,/* 10 digit and 2 floating digit */
stock INT CHECK(stock >= 0) ,
published_year INT CHECK(published_year BETWEEN 1900 AND 2025) ,/* CHECK(2025 >= published_year >= 1900) */
added_at DATE
);

/* Insert Into  Tablo_adi(Attribute1, Attribute2...) Values(Deðer1, Deðer2...),(...),(...);*/

INSERT INTO books(title, author, genre, price, stock, published_year, added_at) 
VALUES('Kayýp Zamanýn Ýzinde','M. Proust','Roman',129.90,25,1913,'2025-08-20'), 
('Simyacý','Paulo Coelho','Roman',89.50,40,1988,'2025-08-21'),
('Sapiens','Harari','Tarih',159.90,18,2011,'2025-08-25'),
('Ýnce Memed','Y. Kemal','Roman',99.90,12,1955,'2025-08-22'),
('Körlük','J. Saramago','Roman',119.00,7,1995,'2025-08-28'),
('Dune','F. Herbert','Bilim',149.00,30,1965,'2025-09-01'),
('Hayvan Çiftliði','G. Orwell','Roman',79.90,55,1945,'2025-08-23'),
('1984','G. Orwell','Roman',99.00,35,1949,'2025-08-24'),
('Nutuk','M. K. Atatürk','Tarih',139,20,1927,'2025-08-27'),
('Küçük Prens','A. de Saint-Exupéry','Çocuk',69.90,80,1943,'2025-08-26'),
('Baþlangýç','D. Brown','Roman',109.00,22,2017,'2025-09-02'),
('Atomik Alýþkanlýklar','J. Clear','Kiþisel Geliþim',129.00,28,2018,'2025-09-03'),
('Zamanýn Kýsa Tarihi','S. Hawking','Bilim',119.50,16,1988,'2025-08-29'),
('Þeker Portakalý','J. M. de Vasconcelos','Roman',84.90,45,1968,'2025-08-30'),
('Bir Ýdam Mahkûmunun Son Günü','V. Hugo','Roman',74.90,26,1829,'2025-08-31') --1900 ile 2025 arasý olduðundan kütüphaneye giremedi

--TUM KITAPLAR :
SELECT * FROM books ORDER BY book_id ASC; -- !!!! Hocam, birden fazla yürüttüðüm için kitaplar çoðalmýþtý bende tabloyu silmiþtim soldan ve yeniden yürütmüþtüm. 
-- Fakat id'ler resetlenmemiþ sanýrým sebebi nedir?

--SORGU 1 :
SELECT title, price, author FROM books ORDER BY price ASC; -- ASC = Ascending (artan sýra) , DESC = Descending (azalan sýra)

--SORGU 2 :
SELECT * FROM books WHERE genre ='Roman' ORDER BY title ASC;
/* - SQL'de büyük küçük harf duyarlýlýðý yok (ROMAN yazarsan da sorun olmaz)
 - Eðerki N'roman' yazarsan, alfabe formatý deðiþir.(eðer roman yerine öykü yazacaksan hata vermesin diye.) (mesela ASCII -> UTF-8). N = National (yerli harfler için)
 - '*' iþareti tüm attribute larý otomatik seçmek için kullanýlýr. */

--SORGU 3 :
SELECT * FROM books WHERE price BETWEEN 80 AND 120;

--SORGU 4 :
SELECT title, stock FROM books WHERE stock < 20;

--SORGU 5 :
SELECT * FROM books WHERE title LIKE '%zaman%';/* LIKE = zaman kelimesini içerenler (% = karakter var.(0 veya daha fazla)(Büyük ve küçük harfe duyarlý deðil.)) */

--SORGU 6 :
SELECT * FROM books WHERE genre IN ('Bilim','Roman');/* IN = Genre'sý parantez içindeki deðerlerden biri olanlarý seç. */

--SORGU 7 :
SELECT * FROM books WHERE published_year > 2000 ORDER BY published_year DESC;

--SORGU 8 :
SELECT * FROM books WHERE added_at >= DATEADD(DAY,-10,GETDATE()); 
-- GETDATE() = güncel tarihi ve zamaný alýr , DATEADD(type,amount,date) = istenen miktar ve cinsteki zamaný verilen tarihe ekler

--SORGU 9 :
SELECT TOP 5 * FROM books ORDER BY price DESC; -- LIMIT = MySQL, PoStgreSQL (SELECT * FROM ... LIMIT 5 ...) ; TOP = SQL Server (SELECT TOP 5 * FROM ....)
-- LIMIT çalýþmadý hocam. O yüzden TOP kullandým.

--SORGU 10 :
SELECT * FROM books WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;

-- Okuduðunuz için teþekkürler Hocam!