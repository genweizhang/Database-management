create or replace PACKAGE BODY HW3_ORACLE AS
  /*private procedure to be used in this package body only*/
  PROCEDURE assert_notnull (tested_variable IN VARCHAR2)
  AS
  BEGIN 
        IF tested_variable IS NULL
        THEN
            --report value error if varialbe null
            RAISE VALUE_ERROR;
        END IF;
  END assert_notnull;
  
  /*procedure to add new customer*/
  PROCEDURE Add (cid_in IN NUMBER, 
                 cname_in IN VARCHAR2,
                 level_in IN VARCHAR2) 
  AS
  avgnumber NUMBER;
  number_of_order_in NUMBER;
  BEGIN
    --check what the customer level is: adult or children. Then assign the average 
    -- of the number of order from the same level to new customer's; if no such customer, 
    -- use the whole dataset average.
    IF level_in = 'Adult'
    THEN 
        select avg(Number_of_order)
        INTO avgnumber
        from customer
        group by level_
        having level_='Adult';
    ELSIF level_in='Children'
       THEN
        select avg(Number_of_order)
        into avgnumber
        from customer
        group by level_
        having level_='Children';
    ELSIF level_in='Unknown'
    THEN
        select avg(Number_of_order)
        into avgnumber
        from customer
        group by level_;
                       
    END IF;
    --assign the average of 'number of order' to new customer's number of order.
    number_of_order_in:=avgnumber;
    assert_notnull(cid_in);
    assert_notnull(cname_in);
    assert_notnull(level_in);
    --insert new customer data
    INSERT INTO customer(cid, cname, Number_of_order, level_)
    VALUES(cid_in, cname_in, number_of_order_in, level_in); 
   
  END add;

  /*procedure to list all books*/
  PROCEDURE list_customer AS
    cid_out NUMBER;
    cname_out VARCHAR2(50);
    number_of_order_out NUMBER;
    level_out VARCHAR2(20);
    
    CURSOR lb_cur is
        SELECT cid, cname, Number_of_order, level_
        FROM Customer;
  BEGIN
    -- TODO: Implementation required for procedure HW3_ORACLE.list_customer
    -- open the cursor
    OPEN lb_cur;
    --start the loop
    DBMS_OUTPUT.PUT_LINE('cid'||' '||'cname'||' '||'#_of_order'||' '||'level');
    LOOP 
        FETCH lb_cur INTO cid_out, cname_out, number_of_order_out, level_out;
        --exit when no more rows
        EXIT WHEN lb_cur%NOTFOUND;
        --print one row at a time
        DBMS_OUTPUT.PUT_LINE(cid_out||' '||cname_out||' '||number_of_order_out||' '||level_out);
    END LOOP;
    CLOSE lb_cur;
  END list_customer;

  PROCEDURE list_translator AS
    aid_out NUMBER;
    aname_out VARCHAR2(50);
    salary_out VARCHAR2(50);
    
    CURSOR lb_cur is
        SELECT aid, aname, salary
        FROM Translator;
  BEGIN
    -- TODO: Implementation required for procedure HW3_ORACLE.list_translator
    -- open the cursor
    OPEN lb_cur;
    --start the loop
    DBMS_OUTPUT.PUT_LINE('aid'||' '||'aname'||'  '||'salary');
    LOOP 
        FETCH lb_cur INTO aid_out, aname_out, salary_out;
        --exit when no more rows
        EXIT WHEN lb_cur%NOTFOUND;
        --print one row at a time
        DBMS_OUTPUT.PUT_LINE(aid_out||' '||aname_out||' '||salary_out);
    END LOOP;
    CLOSE lb_cur;
  END list_translator;

  /*update the salary of the translators*/
  PROCEDURE increase_salary(aname_in IN VARCHAR2) AS
  BEGIN
    assert_notnull(aname_in);
    update translator
    -- update translator's salary based on three different scenarios:
    -- 1. when the name equals to entered ones, increase salary by 10%
    -- 2. when translate 3 or more books, increase salary by 5%
    -- 3. All the rest, increase the salary by 2%.
    set salary=case
                when aname=aname_in then salary*1.1
                when aid in (select tid
                            from Book
                            group by tid
                            having count(tid)>=3) then salary*1.05
                ELSE salary*1.02
                END;
  END increase_salary;
  /*Quite the program*/
  PROCEDURE QUIT AS
  VAR_COUNT NUMBER;
  BEGIN
  VAR_COUNT:=0;
  LOOP
  EXIT WHEN VAR_COUNT=0;
  END LOOP;
  END QUIT;
  
END HW3_ORACLE;