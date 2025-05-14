CREATE PACKAGE pharmacy_pkg IS
  -- Public procedure to handles sale
  PROCEDURE make_sale(p_customer_id IN NUMBER, p_medicine_id IN NUMBER, p_quantity IN NUMBER);

  -- Public Function for return current stock of a medicine
   FUNCTION get_stock(p_medicine_id IN NUMBER) RETURN NUMBER;
END pharmacy_pkg;
/


CREATE PACKAGE BODY pharmacy_pkg IS

  -- Private Procedur to  updates stock
  PROCEDURE update_stock(p_medicine_id IN NUMBER, p_quantity IN NUMBER) IS
  BEGIN
    UPDATE MEDICINE
     SET stock_qty = stock_qty - p_quantity
    WHERE medicine_id = p_medicine_id;
  END update_stock;

  -- Public function to return available stock
  FUNCTION get_stock(p_medicine_id IN NUMBER) RETURN NUMBER IS
    v_stock MEDICINE.stock_qty%TYPE;
  BEGIN
    SELECT stock_qty INTO v_stock
    FROM MEDICINE
    WHERE medicine_id = p_medicine_id;

    RETURN v_stock;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RETURN -1;
  END get_stock;

  -- Public procedure to do a sale
  PROCEDURE make_sale(p_customer_id IN NUMBER, p_medicine_id IN NUMBER, p_quantity IN NUMBER) IS
    v_stock NUMBER;
    v_price MEDICINE.price%TYPE;
     v_total_price NUMBER(8,2);
  BEGIN
    -- Check available stock
    v_stock := get_stock(p_medicine_id);

    IF v_stock < 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Medicine not found.');
    ELSIF v_stock < p_quantity THEN
      RAISE_APPLICATION_ERROR(-20002, 'Insufficient stock.');
    END IF;

    -- Get medicine price
    SELECT price INTO v_price
    FROM MEDICINE
    WHERE medicine_id = p_medicine_id;

    -- Calculate total price
    v_total_price := v_price * p_quantity;

    -- Insert into sales table
    INSERT INTO SALES (medicine_id, customer_id, quantity, total_price)
    VALUES (p_medicine_id, p_customer_id, p_quantity, v_total_price);

    -- Update stock using privat procedure
    update_stock(p_medicine_id, p_quantity);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
       RAISE;
  END make_sale;

END pharmacy_pkg;
/
