select * from purchase
select * from redemption

------------------Creating tables----------------------

create table purchase (
					   journal_date varchar(100),
					   purchase_date TIMESTAMP,
					   expiry_date	TIMESTAMP,
					   bond_number char(50),
	                   purchaser char(200),
					   political_party char(100),
					   denominations int ,
					   issue_branch_code varchar(100),	
					   issue_teller  varchar(100),
	                   status char(10)
                      );
					  
					 
create table redemption(
                       encashment_date	Timestamp,
					   bond_number varchar(100),
					   political_party char(100),
					   denominations	int,
					   account_no_of_political_party	varchar(100),
					   pay_branch_code	char(100),
					   pay_teller varchar(100)
					);

