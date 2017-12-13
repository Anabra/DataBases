select * from nikovits.cikk;

select * from nikovits.szallito;

select * from nikovits.projekt;

select * from nikovits.szallit;

select *
from nikovits.cikk C, nikovits.szallit SZ, nikovits.projekt P
where C.szin = 'piros'
  and P.helyszin = 'Pecs'
order by C.CKOD;

select /*+ USE_NL(C,SZ,P) NO_INDEX(C) NO_INDEX(SZ) NO_INDEX(P) */ sum(SZ.mennyiseg)
from 
nikovits.cikk    C  NATURAL JOIN 
nikovits.szallit SZ NATURAL JOIN 
nikovits.projekt P
where C.szin     = 'piros'
  and P.helyszin = 'Pecs';
  
  
  
select /*+ USE_NL(C,SZ,P) NO_INDEX(SZ) NO_INDEX(P) */ sum(SZ.mennyiseg)
from 
nikovits.cikk    C  NATURAL JOIN 
nikovits.szallit SZ NATURAL JOIN 
nikovits.projekt P
where C.szin     = 'piros'
  and P.helyszin = 'Pecs';
  
  
select * from dba_tab_partitions
where table_owner = 'SH'
  and table_name = 'SALES';
  
select * from DBA_PART_KEY_COLUMNS
where owner = 'SH';
  
select * from sh.products;

select * from DBA_IND_COLUMNS
where index_name = 'PRODUCTS_PROD_CAT_IX';
  
select /*+ USE_HASH_AGGREGATION INDEX(P PRODUCTS_PROD_CAT_IX) FULL(S) */ prod_category
from 
sh.products P NATURAL JOIN sh.sales S
where prod_category = 'Hardware'
group by prod_category;
  
  
select * from sh.sales;

select * from sh.customers;
  
  
select prod_id from sh.sales S
where exists 
(
 select /*+ FULL(c) */ * from sh.customers C 
 where cust_id = S.cust_id
)
group by prod_id
order by sum(amount_sold);



SELECT /*+ USE_HASH(E, D) */ ename FROM sila.emp E
WHERE EXISTS 
(
 SELECT /*+ full(dept) */ * 
 FROM  sila.dept D
 WHERE loc='DALLAS' and D.deptno = E.deptno
);

  
  
  