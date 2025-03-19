COMMENT ON TABLE person_discounts IS 'One is the ways to increase quantity of orders is personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'Primary key of person_discounts';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key for connection with person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key for connection with pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'Personal discount in percents';