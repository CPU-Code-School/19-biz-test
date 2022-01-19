use BombShellDB
go
drop table if exists BombShell
go
create table dbo.BombShell(
    BombShellId int  not null identity primary key,
    DateTimeSaved datetime default getdate(),
    Style varchar(10) not Null
      constraint ck_Shell_Style_must_be_elbow_or_wrist check(Style in('Elbow','wrist')),
    Color varchar(10) not null
        constraint ck_Shell_Color_must_be_white_or_black_or_nude check(Color in('white','black','nude')),
    Size varchar(10) not null
       constraint ck_Shell_Size_must_be_small_or_medium_or_large check(Size in('small', 'medium', 'large')), 
    DatePurchased date not null
        constraint ck_bombshell_date_purchased_cannot_be_blank check(DatePurchased <> ''),
    PricePurchased int not null
        constraint ck_BombShell_price_purchased_must_be_higher_than_zero check(pricepurchased > 0),
    DateSold date,
    PriceSold decimal(4,2)
        constraint ck_BombShell_price_sold_must_be_higher_than_zero check(pricesold > 0),
        constraint ck_Bombshell_price_sold_must_be_bigger_than_price_purchased check(pricesold > pricepurchased),
        constraint ck_BombShell_Date_Sold_must_be_after_Date_purchased check(datesold > datepurchased),
        constraint ck_DateSold_and_PriceSold_are_both_null_or_both_not_null check((datesold is null and pricesold is null)
            or (datesold is not null and pricesold is not null))

)
