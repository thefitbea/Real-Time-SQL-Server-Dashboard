use realtimedata;
delete from realtime_sales_demo;
declare @pid int = 0;
declare @units int = 0;
declare @price money = 0;

while (1=1)
begin
	waitfor delay '00:00:00';

	set @pid = rand()*3+1;
	set @units = rand()*10+1;
		if @pid = 1
			set @price = 10.85 * @units;
		else if @pid = 2
			set @price = 5.99 * @units;
		else if @pid = 3
			set @price = 8.5 * @units;

	insert into realtime_sales_demo values (getdate(),@pid,@units,@price);
end

select * from realtime_sales_demo;