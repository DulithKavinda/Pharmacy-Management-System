CREATE TRIGGER prevent_invalid_sale
BEFORE INSERT OR UPDATE ON SALES


FOR EACH ROW
DECLARE
  v_stock MEDICINE.stock_qty%TYPE;
BEGIN
  -- Get current stock of the medicine
  SELECT stock_qty INTO v_stock
   FROM MEDICINE
  WHERE medicine_id = :NEW.medicine_id;

  -- If requested quantity exceeds stock then raise error
  IF :NEW.quantity > v_stock THEN
    RAISE_APPLICATION_ERROR(-20003, 'Sale quantity exceeded in stock');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20004, 'Invalid medicine ID');
END;
/
