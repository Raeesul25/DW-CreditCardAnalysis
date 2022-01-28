-- Stored Procedure for DimAccount --

CREATE PROCEDURE [dbo].[UpdateDimAccount]
@AccountID varchar(10),
@DistrictSK int,
@Freq varchar(50),
@startDate date
AS
BEGIN
if not exists (select AccountSK
from dbo.DimAccount
where AlternativeAccountID = @AccountID)
BEGIN
insert into dbo.DimAccount
(AlternativeAccountID, DistrictSK, Frequency, StartedDate, InsertDate, ModifiedDate)
values
(@AccountID, @DistrictSK, @Freq, @startDate, GETDATE(), GETDATE())
END;
if exists (select AccountSK
from dbo.DimAccount
where AlternativeAccountID = @AccountID)
BEGIN
update dbo.DimAccount
set DistrictSK = @DistrictSK,
Frequency = @Freq,
StartedDate = @startDate,
ModifiedDate = GETDATE()
where AlternativeAccountID = @AccountID
END;
END;


-- Stored Procedure for DimCard --

CREATE PROCEDURE [dbo].[UpdateDimCard]
@CardID varchar(10),
@DispositionKey int,
@Type varchar(25),
@IssuedDate date
AS
BEGIN
if not exists (select CardSK
from dbo.DimCard
where AlternativeCardID = @CardID)
BEGIN
insert into dbo.DimCard
(AlternativeCardID, DispositionSK, CardType, IssuedDate, InsertDate, ModifiedDate)
values
(@CardID, @DispositionKey, @Type, @IssuedDate, GETDATE(), GETDATE())
END;
if exists (select CardSK
from dbo.DimCard
where AlternativeCardID = @CardID)
BEGIN
update dbo.DimCard
set DispositionSK = @DispositionKey,
CardType = @Type,
IssuedDate = @IssuedDate,
ModifiedDate = GETDATE()
where AlternativeCardID = @CardID
END;
END;


-- Stored Procedure for DimDisposition --

CREATE PROCEDURE [dbo].[UpdateDimDisposition]
@DispositionID varchar(10),
@AccountKey int,
@ClientKey int,
@Type varchar(25)
AS
BEGIN
if not exists (select DispositionSK
from dbo.DimDisposition
where AlternativeDispositionID = @DispositionID)
BEGIN
insert into dbo.DimDisposition
(AlternativeDispositionID, AccountSK, ClientSK, DispositionType, InsertDate, ModifiedDate)
values
(@DispositionID, @AccountKey, @ClientKey, @Type, GETDATE(), GETDATE())
END;
if exists (select DispositionSK
from dbo.DimDisposition
where AlternativeDispositionID = @DispositionID)
BEGIN
update dbo.DimDisposition
set AccountSK = @AccountKey,
ClientSK = @ClientKey,
DispositionType = @Type,
ModifiedDate = GETDATE()
where AlternativeDispositionID = @DispositionID
END;
END;


-- Stored Procedure for DimDistrict --

CREATE PROCEDURE [dbo].[UpdateDimDistrict]
@DistrictID int,
@City varchar(50),
@State varchar(50),
@Region varchar(50)
AS
BEGIN
if not exists (select DistrictSK
from dbo.DimDistrict
where AlternativeDistrictID = @DistrictID)
BEGIN
insert into dbo.DimDistrict
(AlternativeDistrictID, City, State, Region, InsertDate, ModifiedDate)
values
(@DistrictID, @City, @State, @Region, GETDATE(), GETDATE())
END;
if exists (select DistrictSK
from dbo.DimDistrict
where AlternativeDistrictID = @DistrictID)
BEGIN
update dbo.DimDistrict
set City = @City,
State = @State,
Region = @Region,
ModifiedDate = GETDATE()
where AlternativeDistrictID = @DistrictID
END;
END;


-- Stored Procedure for DimLoan --

Create PROCEDURE [dbo].[UpdateDimLoan]
@LoanID varchar(10),
@AccountSK int,
@DistrictSk int,
@Amount numeric(18, 2),
@Duration int,
@Payments numeric(18, 2),
@Status varchar(5),
@LoanDate date,
@Purpose varchar(50)
AS
BEGIN
if not exists (select LoanSK
from dbo.DimLoan
where AlternativeLoanID = @LoanID)
BEGIN
insert into dbo.DimLoan
(AlternativeLoanID, AccountSK, DistrictSK, Amount, Duration, Payments, Status, Loan_date,
 Purpose, InsertDate, ModifiedDate)
values
(@LoanID, @AccountSK, @DistrictSk, @Amount, @Duration, @Payments, @Status, @LoanDate, 
@Purpose, GETDATE(), GETDATE())
END;
if exists (select LoanSK
from dbo.DimLoan
where AlternativeLoanID = @LoanID)
BEGIN
update dbo.DimLoan
set AccountSK = @AccountSK,
DistrictSK = @DistrictSk,
Amount = @Amount,
Duration = @Duration,
Payments = @Payments,
Status = @Status,
Loan_date = @LoanDate,
Purpose = @Purpose,
ModifiedDate = GETDATE()
where AlternativeLoanID = @LoanID
END;
END;


-- Stored Procedure for DimPermanentOrder --

CREATE PROCEDURE [dbo].[UpdateDimPermanentOrder]
@OrderID int,
@AccountSK int,
@Bankto varchar(10),
@AccountTo int,
@Amount numeric(18, 0),
@ordertype varchar(100)
AS
BEGIN
if not exists (select OrderSK
from dbo.DimPermanentOrder
where AlternativeOrderID = @OrderID)
BEGIN
insert into dbo.DimPermanentOrder
(AlternativeOrderID, AccountSK, Bank_to, Account_to, Amount, OrderType, InsertDate, ModifiedDate)
values
(@OrderID, @AccountSK, @Bankto, @AccountTo, @Amount, @ordertype, GETDATE(), GETDATE())
END;
if exists (select OrderSK
from dbo.DimPermanentOrder
where AlternativeOrderID = @OrderID)
BEGIN
update dbo.DimPermanentOrder
set AccountSK = @AccountSK,
Bank_to = @Bankto,
Account_to = @AccountTo,
Amount = @Amount,
OrderType = @ordertype,
ModifiedDate = GETDATE()
where AlternativeOrderID = @OrderID
END;
END;
