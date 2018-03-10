DROP TABLE IF EXISTS res_users;
DROP TABLE IF EXISTS history_users;

CREATE TABLE res_users (
nombre text NOT NULL
);

CREATE TABLE history_users(
nombre text NOT NULL,
fechaOperacion DATE NOT NULL,
texto text NOT NULL
);


INSERT INTO res_users (nombre) VALUES ('PEPE1');
INSERT INTO res_users (nombre) VALUES ('PE2323PE1');
INSERT INTO res_users (nombre) VALUES ('PE23PE1');
INSERT INTO res_users (nombre) VALUES ('PEPE1345');


CREATE OR REPLACE FUNCTION RESPALDAR() RETURNS TRIGGER AS $JAVIFUNC$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO history_users(nombre, fechaOperacion, texto) VALUES (old.nombre, CURRENT_DATE, 'borrado usuario ' || old.nombre);
            RETURN old;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO history_users(nombre, fechaOperacion, texto) VALUES (OLD.nombre, CURRENT_DATE, 'actualizado usuario ' || OLD.nombre);
            RETURN OLD;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO history_users(nombre, fechaOperacion, texto) VALUES (NEW.nombre, CURRENT_DATE, 'insertado usuario ' || NEW.nombre);
            RETURN NEW;
        END IF;
    END;
$JAVIFUNC$ LANGUAGE plpgsql;

CREATE TRIGGER respaldo
BEFORE INSERT OR UPDATE OR DELETE ON res_users
    FOR EACH ROW EXECUTE PROCEDURE RESPALDAR();