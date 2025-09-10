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

/* Insert Into  Tablo_adi(Attribute1, Attribute2...) Values(De�er1, De�er2...),(...),(...);*/

INSERT INTO books(title, author, genre, price, stock, published_year, added_at) 
VALUES('Kay�p Zaman�n �zinde','M. Proust','Roman',129.90,25,1913,'2025-08-20'), 
('Simyac�','Paulo Coelho','Roman',89.50,40,1988,'2025-08-21'),
('Sapiens','Harari','Tarih',159.90,18,2011,'2025-08-25'),
('�nce Memed','Y. Kemal','Roman',99.90,12,1955,'2025-08-22'),
('K�rl�k','J. Saramago','Roman',119.00,7,1995,'2025-08-28'),
('Dune','F. Herbert','Bilim',149.00,30,1965,'2025-09-01'),
('Hayvan �iftli�i','G. Orwell','Roman',79.90,55,1945,'2025-08-23'),
('1984','G. Orwell','Roman',99.00,35,1949,'2025-08-24'),
('Nutuk','M. K. Atat�rk','Tarih',139,20,1927,'2025-08-27'),
('K���k Prens','A. de Saint-Exup�ry','�ocuk',69.90,80,1943,'2025-08-26'),
('Ba�lang��','D. Brown','Roman',109.00,22,2017,'2025-09-02'),
('Atomik Al��kanl�klar','J. Clear','Ki�isel Geli�im',129.00,28,2018,'2025-09-03'),
('Zaman�n K�sa Tarihi','S. Hawking','Bilim',119.50,16,1988,'2025-08-29'),
('�eker Portakal�','J. M. de Vasconcelos','Roman',84.90,45,1968,'2025-08-30'),
('Bir �dam Mahk�munun Son G�n�','V. Hugo','Roman',74.90,26,1829,'2025-08-31') --1900 ile 2025 aras� oldu�undan k�t�phaneye giremedi

--TUM KITAPLAR :
SELECT * FROM books ORDER BY book_id ASC; -- !!!! Hocam, birden fazla y�r�tt���m i�in kitaplar �o�alm��t� bende tabloyu silmi�tim soldan ve yeniden y�r�tm��t�m. 
-- Fakat id'ler resetlenmemi� san�r�m sebebi nedir?

--SORGU 1 :
SELECT title, price, author FROM books ORDER BY price ASC; -- ASC = Ascending (artan s�ra) , DESC = Descending (azalan s�ra)

--SORGU 2 :
SELECT * FROM books WHERE genre ='Roman' ORDER BY title ASC;
/* - SQL'de b�y�k k���k harf duyarl�l��� yok (ROMAN yazarsan da sorun olmaz)
 - E�erki N'roman' yazarsan, alfabe format� de�i�ir.(e�er roman yerine �yk� yazacaksan hata vermesin diye.) (mesela ASCII -> UTF-8). N = National (yerli harfler i�in)
 - '*' i�areti t�m attribute lar� otomatik se�mek i�in kullan�l�r. */

--SORGU 3 :
SELECT * FROM books WHERE price BETWEEN 80 AND 120;

--SORGU 4 :
SELECT title, stock FROM books WHERE stock < 20;

--SORGU 5 :
SELECT * FROM books WHERE title LIKE '%zaman%';/* LIKE = zaman kelimesini i�erenler (% = karakter var.(0 veya daha fazla)(B�y�k ve k���k harfe duyarl� de�il.)) */

--SORGU 6 :
SELECT * FROM books WHERE genre IN ('Bilim','Roman');/* IN = Genre's� parantez i�indeki de�erlerden biri olanlar� se�. */

--SORGU 7 :
SELECT * FROM books WHERE published_year > 2000 ORDER BY published_year DESC;

--SORGU 8 :
SELECT * FROM books WHERE added_at >= DATEADD(DAY,-10,GETDATE()); 
-- GETDATE() = g�ncel tarihi ve zaman� al�r , DATEADD(type,amount,date) = istenen miktar ve cinsteki zaman� verilen tarihe ekler

--SORGU 9 :
SELECT TOP 5 * FROM books ORDER BY price DESC; -- LIMIT = MySQL, PoStgreSQL (SELECT * FROM ... LIMIT 5 ...) ; TOP = SQL Server (SELECT TOP 5 * FROM ....)
-- LIMIT �al��mad� hocam. O y�zden TOP kulland�m.

--SORGU 10 :
SELECT * FROM books WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;

-- Okudu�unuz i�in te�ekk�rler Hocam!