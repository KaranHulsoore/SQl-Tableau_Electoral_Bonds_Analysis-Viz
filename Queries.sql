select * from purchase
select * from redemption
---Total number of electoral bonds purchased and redeemed:
SELECT 
    (SELECT COUNT(bond_number) FROM purchase) AS total_purchased,
    (SELECT COUNT(bond_number) FROM redemption) AS total_redeemed;
    --- Another Way
SELECT
  COUNT(distinct bond_number) AS total_purchased
FROM purchase
union all
SELECT
  COUNT(distinct bond_number) AS total_redeemed
FROM redemption;
---Total amount of electoral bonds purchased and redeemed:
SELECT 
    (SELECT SUM(denominations) FROM purchase) AS total_purchased_amount,
    (SELECT SUM(denominations) FROM redemption) AS total_redeemed_amount;

---List of political parties and the total amount of bonds purchased by each:
SELECT 
    political_party, 
    SUM(denominations) AS total_purchased_amount
FROM 
    purchase
GROUP BY 
    political_party;
  ---Another Way---
  SELECT p.political_party, SUM(r.denominations) AS total_redeemed_amount
FROM purchase p
JOIN redemption r ON p.bond_number = r.bond_number
GROUP BY p.political_party;
---List of purchasers who have purchased bonds along with the total amount they have purchased:
SELECT 
    purchaser, 
    SUM(denominations) AS total_purchased_amount
FROM 
    purchase
GROUP BY 
    purchaser;
---List of political parties and the total number of bonds redeemed by each:
SELECT 
    political_party, 
    COUNT(*) AS total_redeemed_count
FROM 
    redemption
GROUP BY 
    political_party;

---List of political parties and the total amount of bonds redeemed by each:
SELECT 
    political_party, 
    SUM(denominations) AS total_redeemed_amount
FROM 
    redemption
GROUP BY 
    political_party;

---List of purchasers who have redeemed bonds along with the total amount they have redeemed:
SELECT
  political_party,
  SUM(denominations) AS total_amount_redeemed
FROM redemption
GROUP BY political_party;
---Average time taken for bonds to be redeemed after purchase.
SELECT 
    AVG(EXTRACT(epoch FROM (redemption.encashment_date - purchase.purchase_date)) / 86400) AS average_days_to_redeem
FROM 
    purchase
JOIN 
    redemption ON purchase.bond_number = redemption.bond_number;
	
--- Find the branches that issued the most electoral bonds.
SELECT 
    issue_branch_code,
    COUNT(*) AS total_issued
FROM 
    purchase
GROUP BY 
    issue_branch_code
ORDER BY 
    total_issued DESC
LIMIT 10;
___Total parties received Bonds:
SELECT COUNT(DISTINCT political_party) AS total_parties_received_bonds
FROM (
    SELECT political_party FROM purchase
    UNION
    SELECT political_party FROM redemption
) AS parties;


