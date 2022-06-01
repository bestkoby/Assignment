--t2
Set Transaction Isolation Level Read UnCommitted
Select *
From Tea


--Lost Updates

Set Transaction Isolation Level Repeatable Read
Begin Tran
Declare @qty int
Select @qty = Quantity From Tea where id = 2
Set @qty = @qty - 15
Update Tea set Quantity = @qty Where id = 2
Commit


--Non repeatable reads

Set Transaction Isolation Level Repeatable Read
Begin Tran
Update Tea set Quantity = 200 Where id = 1
Commit

--Phantom reads

Set Transaction Isolation Level Serializable
Begin Tran
Insert Tea values (5, 'Kombucha', 100)
Commit

Select * From Tea