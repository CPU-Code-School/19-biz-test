--Reports:
--1. A daily printout every morning including the Inventory in stock, style, color, size,
--date purchased, price purchased, date sold, price sold, and the date and time record of that printout to refer if i had to give a hardcopy to my partner.
select b.style, b.color, b.size, b.datepurchased, b.pricepurchased, b.Datesold, b.pricesold, b.DateTimeSaved
from BombShell b 
--2. Printout of sku, style, color, size, date purchase, price purchase, date sold, price sold
select BombShellId, b.style, b.color, b.size, b.datepurchased, b.pricepurchased, b.datesold, b.pricesold
from BombShell b 
--3. which style is giving me most profit 
select Profit = max(b.pricesold - b.pricepurchased), b.style
from BombShell b 
group by b.style
--4. which size sells the most
select top (1) b.size, count(b.datesold) 
from BombShell b 
group by b.size 
--5. avg how long does it take for inventory to be sold per color each week
select HowQuickSell = avg(datediff(DAY, b.datepurchased, b.Datesold))
from BombShell b 
where datediff(DAY, b.datepurchased, b.Datesold) <= 7
group by b.color, b.datepurchased, b.Datesold
