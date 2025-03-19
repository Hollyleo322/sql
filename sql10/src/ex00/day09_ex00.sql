CREATE TABLE person_audit(
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $fnc_trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit(type_event, row_id,name,age,gender,address)
        VALUES ('I', new.id, new.name, new.age, new.gender, new.address );
        RETURN new;
    END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');