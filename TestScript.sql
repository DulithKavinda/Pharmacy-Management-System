SET SERVEROUTPUT ON;

-- Test 1
/*
DECLARE
  v_stock NUMBER;
BEGIN
  v_stock := pharmacy_pkg.get_stock(1); -- Existing medicine ID
  DBMS_OUTPUT.PUT_LINE('Stock for medicine ID 1: ' || v_stock);
END;
/
*/


-- Test 2
/*
BEGIN
  pharmacy_pkg.make_sale(p_customer_id => 1, p_medicine_id => 1, p_quantity => 2);
   DBMS_OUTPUT.PUT_LINE('Sale completed succesfully');
END;
/
*/


-- Test 3
/*
BEGIN
  pharmacy_pkg.make_sale(p_customer_id => 2, p_medicine_id => 2, p_quantity => 999);
  DBMS_OUTPUT.PUT_LINE('Sale not succeed');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
*/

-- Test 4
/*
BEGIN
  pharmacy_pkg.make_sale(p_customer_id => 3, p_medicine_id => 999, p_quantity => 1);
  DBMS_OUTPUT.PUT_LINE('sale not succeed');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('error occurred: ' || SQLERRM);
END;
/
*/

-- Trigger Test 1
BEGIN
  INSERT INTO SALES (medicine_id, customer_id, quantity, total_price)
  VALUES (-1, 1, 999, 9999);
EXCEPTION
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE('Trigger error: ' || SQLERRM);
END;
/

