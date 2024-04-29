-------------------------------------------------------------------------
------------------------IMAGE--C-R-U-D--PROCEDURES-----------------------
-------------------------------------------------------------------------
SET SERVEROUTPUT ON SIZE UNLIMITED;
SET SERVEROUTPUT ON;
--________________________________________________________________________________________--

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */               
 /* READ procedure in table for all the images en pantalla principal*/               
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- Define a nested table type to hold the result set
CREATE OR REPLACE TYPE ImageResultSetRecord AS OBJECT (
    IMAGE_ID int,
    person_name VARCHAR2(300),
    person_last_name VARCHAR2(300),
    figure_url VARCHAR2(1000),
    use_licence VARCHAR2(2000), ------
    image_date VARCHAR2(15),
    taken_image_date VARCHAR2(15),
    taxon_name VARCHAR2(300)
);
/
CREATE OR REPLACE TYPE ImageResultSetTable AS TABLE OF ImageResultSetRecord;
-- Create a function to return the result set as a nested table
CREATE OR REPLACE FUNCTION SELECT_IMAGES_PANTALLA_PRINCIPAL
RETURN ImageResultSetTable
IS
    image_result_set ImageResultSetTable := ImageResultSetTable();
BEGIN
    FOR rec IN (
        SELECT 
            image.id as iimage_id,
            person.name as person_name, 
            person.LAST_NAME as person_last_name,
            FIGURE_URL,
            USE_LICENSE as u_licence,
            image_date,
            TAKEN_IMAGE_DATE,
            TAXON_name
        FROM 
            image
            JOIN person ON person.id = image.person_id
            JOIN figure ON figure.ID = image.FIGURE_ID
            join taxon on taxon.id = image.TAXON_ID
    ) LOOP
        -- Append each record to the nested table
        image_result_set.EXTEND;
        image_result_set(image_result_set.LAST) := ImageResultSetRecord(
            rec.iimage_id,
            rec.person_name,
            rec.person_last_name,
            rec.FIGURE_URL,
            rec.u_licence,
            rec.image_date,
            rec.TAKEN_IMAGE_DATE,
            rec.TAXON_name
        );
    END LOOP;
    -- Return the populated nested table
    RETURN image_result_set;
END;

/* ASÍ SE LLAMA: */
SELECT * FROM TABLE(SELECT_IMAGES_PANTALLA_PRINCIPAL);






--________________________________________________________________________________________--

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * */               
 /* READ procedure in table for une image dado in image.id*/               
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
----- para devolver los datos en una tabla de imagen_observation

-- Define a nested table type to hold the result set
CREATE OR REPLACE TYPE ImageObservationRecord AS OBJECT (
    id NUMBER,
    use_license VARCHAR2(100),
    person_name VARCHAR2(300), -- person_id NUMBER,
    person_last_name VARCHAR2(300),
    gc_latitude NUMBER,
    gc_longitude NUMBER,
    image_owner_name VARCHAR2(300),--image_owner_id NUMBER,
    figure_url VARCHAR2(10000),--figure_id NUMBER,
    image_date VARCHAR2(15),
    taken_image_date VARCHAR2(15),
    taxon_name VARCHAR2(300),--taxon_id NUMBER,
    complete_taxonomy varchar2(2000),
    taxon_common_name VARCHAR(300),
    OBSERVATION_ID NUMBER,
    OBSERVATION_NOTE VARCHAR2(4000)
);

CREATE OR REPLACE TYPE ImageObservationTable AS TABLE OF ImageObservationRecord;
drop TYPE ImageObservationTable;
-- Create a function to return the result set as a nested table
CREATE OR REPLACE FUNCTION SELECT_IMAGE_OBSERVATIONS_TABLE(p_image_id IN NUMBER)
RETURN ImageObservationTable
IS
    image_observation_table ImageObservationTable := ImageObservationTable();
    complete_taxonomy varchar(2000);-- := complete_taxon_path(taxon_id);
BEGIN
    FOR image_info IN (
        SELECT image.id as i_id, 
               USE_LICENSE as, 
               PERSON.name as person_name, 
               person.LAST_NAME as person_last_name, 
               GEOGRAPHIC_COORDENATES.LATITUDE as gc_latitude, 
               GEOGRAPHIC_COORDENATES.LONGITUDE as gc_longitude, 
               IMAGE_OWNER.name as image_owner_name, 
               figure_url, 
               IMAGE_DATE,
               COMMON_SPECIES_NAME, 
               TAKEN_IMAGE_DATE, 
               TAXON_ID, taxon_name,
               OBSERVATION.ID as OBSERVATION_ID, 
               NOTE as OBSERVATION_NOTE
          FROM image 
          JOIN OBSERVATION ON OBSERVATION.IMAGE_ID = image.id
          JOIN GEOGRAPHIC_COORDENATES ON GEOGRAPHIC_COORDENATES.ID = image.GEOGRAPHIC_COORDENATES_ID
          JOIN FIGURE  on FIGURE.ID = image.FIGURE_ID
          JOIN PERSON ON PERSON.ID = IMAGE.PERSON_ID
          JOIN IMAGE_OWNER ON IMAGE_OWNER.ID = IMAGE.IMAGE_OWNER_ID
          JOIN taxon on taxon.id = image.TAXON_ID
         WHERE image.id = p_image_id
    ) LOOP
        complete_taxonomy := complete_taxon_path(image_info.taxon_id);
        -- Append each record to the nested table
        image_observation_table.EXTEND;
        image_observation_table(image_observation_table.LAST) := ImageObservationRecord(
            image_info.i_id,
            image_info.USE_LICENSE,
            image_info.person_name,
            image_info.person_last_name,
            image_info.gc_latitude,
            image_info.gc_longitude,
            image_info.image_owner_name,
            image_info.figure_url,
            image_info.IMAGE_DATE,
            image_info.TAKEN_IMAGE_DATE,
            image_info.taxon_name,
            complete_taxonomy,
            image_info.COMMON_SPECIES_NAME,
            image_info.OBSERVATION_ID,
            image_info.OBSERVATION_NOTE
        );
    END LOOP;
    
    -- Return the populated nested table
    RETURN image_observation_table;
END;
/


/* ASÍ SE LLAMA: */
SELECT * FROM TABLE(SELECT_IMAGE_OBSERVATIONS_TABLE(21)); -- Replace 20 with the desired image_id
/* 
SELECT_IMAGE_OBSERVATIONS_TABLE(id_de_una_imagen) recive el ID de una imagen y devuelve todos sus datos
 */
select * FROM IMAGE;








--________________________________________________________________________________________--
  /* * * * * * * * * * * * * * * * * * * * * * * * */               
 /* CREATE procedure for a NEW image & observacion*/               
/* * * * * * * * * * * * * * * * * * * * * * * * */
-------create--insertar-image-and-observation----------------------------------------------


CREATE OR REPLACE PROCEDURE create_new_image_and_observation (
    new_taken_image_date in varchar2,
    new_image_date in varchAR2,
    new_person_id in int,
    new_latitude in varchar2,
    new_longitude in varchar2,
    new_image_owner_name in varchar2,
    new_taxon_name in VARCHAR, --new_taxon_id in INT, 
    new_use_licence in varchar2,
    new_figure_url in varchar2,
    new_observation_note in varchar2
)
IS
new_image_owner_ID INT;
new_figure_id INT;
new_geographic_coordenates_id INT;
new_image_id INT;
new_TAXON_ID int;
BEGIN
--____________________________________________________________--
    ----insert into GEOGRAPHIC_COORDENATES 
    BEGIN
        INSERT INTO GEOGRAPHIC_COORDENATES (LATITUDE, LONGITUDE)
        SELECT new_latitude, new_longitude
        FROM DUAL
        WHERE NOT EXISTS (
            SELECT 1
            FROM GEOGRAPHIC_COORDENATES gc
            WHERE gc.LATITUDE = new_latitude AND
            gc.LONGITUDE = new_longitude
        );
        COMMIT;
            DBMS_OUTPUT.PUT_LINE('GEOGRAPHIC_COORDENATES inserted successfully.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error inserting GEOGRAPHIC_COORDENATES: ' || SQLERRM);
                ROLLBACK;

    END;
    ----  select the GEOGRAPHIC_COORDENATES ID
    BEGIN
        SELECT id
        into new_geographic_coordenates_id
        FROM GEOGRAPHIC_COORDENATES GC
        WHERE GC.LATITUDE = new_latitude AND GC.LONGITUDE = new_longitude;
    END;
--____________________________________________________________--
    ---- insert the image owner
    BEGIN
        INSERT INTO IMAGE_OWNER (name)
        SELECT new_image_owner_name
        FROM DUAL
        WHERE NOT EXISTS (
            SELECT 1
            FROM IMAGE_OWNER ii
            WHERE ii.name = new_image_owner_name
        );
        COMMIT;
            DBMS_OUTPUT.PUT_LINE('IMAGE_OWNER inserted successfully.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error inserting IMAGE_OWNER: ' || SQLERRM);
                ROLLBACK;

    END;
    ---- select the image owner id
    BEGIN
        SELECT id
        into new_IMAGE_OWNER_id
        FROM IMAGE_OWNER im
        WHERE im.name = new_image_owner_name;
    END;
--____________________________________________________________--
    ---- select the taxon id para insertarlo en image
    BEGIN
        SELECT id
        into new_taxon_id
        FROM taxon t
        WHERE t.TAXON_NAME = new_taxon_name;
    END;
--____________________________________________________________--
    ---- insert the figure url then
    BEGIN
        INSERT INTO figure (FIGURE_URL)
        SELECT new_figure_url
        FROM DUAL
        WHERE NOT EXISTS (
            SELECT 1
            FROM figure
            WHERE FIGURE_URL = new_figure_url
        );
        COMMIT;
            DBMS_OUTPUT.PUT_LINE('FIGURE inserted successfully.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error inserting FIGURE: ' || SQLERRM);
                ROLLBACK;

        END;
    ----  select the figure ID
    BEGIN
        SELECT id
        into new_figure_id
        FROM figure ff
        WHERE ff.FIGURE_URL = new_figure_url;
    END;    
--____________________________________________________________--
    ---- insert the principal (image)
    BEGIN
        INSERT INTO IMAGE(
            IMAGE_DATE,
            USE_LICENSE,
            PERSON_ID,
            TAXON_ID,
            GEOGRAPHIC_COORDENATES_ID,
            IMAGE_OWNER_ID,
            FIGURE_ID,
            TAKEN_IMAGE_DATE)
        VALUES (
            new_image_date,
            new_use_licence,
            NEW_PERSON_ID,
            NEW_TAXON_ID,
            NEW_GEOGRAPHIC_COORDENATES_ID,
            NEW_IMAGE_OWNER_ID,
            NEW_FIGURE_ID,
            NEW_TAKEN_IMAGE_DATE);
        
        COMMIT;
        
        DBMS_OUTPUT.PUT_LINE('IMAGE inserted successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting IMAGE: ' || SQLERRM);
            ROLLBACK;
    END;
    ---- select the image id
    BEGIN
        SELECT id
        into new_image_id
        FROM image ii
        WHERE ii.FIGURE_ID = new_figure_id AND
        ii.USE_LICENSE = new_use_licence AND
        ii.GEOGRAPHIC_COORDENATES_ID = new_geographic_coordenates_id AND
        ii.IMAGE_OWNER_ID = new_image_owner_ID AND
        ii.PERSON_ID = new_person_id AND 
        ii.TAXON_ID = new_taxon_id;
    END; 
--____________________________________________________________--
    ----insert into observation 1st
    BEGIN
        INSERT INTO observation(note, IMAGE_ID) 
        values (new_observation_note, new_image_id);
        COMMIT;
            DBMS_OUTPUT.PUT_LINE('observation inserted successfully.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error inserting observation: ' || SQLERRM);
                ROLLBACK;

    END;

END;
/

/* ASÍ SE LLAMA: esos son ejemplos */

BEGIN
    create_new_image_and_observation(
    '22-12-2023',
    '26-12-2023',
    22,
    '10.089521609961039',
    '-84.34531593167441',
    'Melvin',
    'Hominidae',
    'mi foto',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Gorilla_gorilla_gorilla12.jpg/500px-Gorilla_gorilla_gorilla12.jpg',
    'Lo vi en una expedicion'
    );
END;
/



select * from figure;
select * from image;
select * from taxon;












select * from image;







--__________________________________________________________________________________________________
------ FUNCION PARA SELECCIONAR TODO EL PATH DE UN TAXON



SET SERVEROUTPUT ON SIZE UNLIMITED;

CREATE OR REPLACE FUNCTION complete_taxon_path(
    taxon_id IN INT
) 
RETURN VARCHAR2 IS
    complete_taxon_actual_path VARCHAR2(2000);
BEGIN
    SELECT "Path" INTO complete_taxon_actual_path
    FROM (
        SELECT id, TAXON_ANCESTOR_ID, level,
               SYS_CONNECT_BY_PATH(taxon_name, '|') AS "Path"
        FROM TAXON
        WHERE ID = taxon_id -- Use the input parameter instead of hardcoding the ID
        CONNECT BY PRIOR id = taxon_ancestor_id
        ORDER BY level DESC
    )
    WHERE ROWNUM = 1;
    --DBMS_OUTPUT.PUT_LINE('Complete taxon path: ' || complete_taxon_actual_path);
    RETURN complete_taxon_actual_path; -- Add the RETURN statement to return the result
END;
/


/* BEGIN
    --result_path := complete_taxon_path(109); -- Replace 109 with the desired taxon_id
    DBMS_OUTPUT.PUT_LINE('Complete taxon path: ' || complete_taxon_path(123));
END;
/ */



-----------------------------------------------------
----- DEVUELVE la taxonomia completa EN UNA TABLA;
CREATE OR REPLACE TYPE CompleteTaxonPathTable AS OBJECT (
    c_complete_taxon_path varchar(2000)
);

CREATE OR REPLACE TYPE TaxonPathTable AS TABLE OF CompleteTaxonPathTable;

create or replace function return_taxon_table(
    taxon_id in int
) return TaxonPathTable
IS
actual_table TaxonPathTable := TaxonPathTable();
function_taxon_path varchar(2000) := complete_taxon_path(taxon_id);
begin
    actual_table.EXTEND;
    actual_table(actual_table.last) := CompleteTaxonPathTable(
        function_taxon_path
    );
    return actual_table;
end;
/
--se llama así: reemplazaldp el 123 con una variable
select * from table(return_taxon_table(186));























--__________________________________________________________________________________________________
-- procedure para CREAR identificaciones


create or REPLACE procedure new_identification(
        new_quality_level in int,
        new_OBSERVATION_ID in INT,
        new_PERSON_ID in int,
        new_IDENTIFICAION_DATE in VARCHAR2
)
IS
BEGIN
    insert into IDENTIFICATION(
        quality_level,
        OBSERVATION_ID,
        IDENTIFICATION_PERSON_ID,
        IDENTIFICAtION_DATE)
    values(
        new_quality_level,
        new_OBSERVATION_ID,
        new_PERSON_ID,
        new_IDENTIFICAION_DATE
    );
END;
/

BEGIN new_identification(
    9,
    28,
    3,
    '19-04-2024'
);
end;
/


select * from identification;

select * from OBSERVATION;


--__________________________________________________________________________________________________
-- procedure para mostrar identificaciones de una pbservacion en particular

SET SERVEROUTPUT ON SIZE UNLIMITED;

CREATE OR REPLACE TYPE IdentificationRecordType AS OBJECT (
    IDENTIFICATION_id int,
    person_id int,
    quality_level INT,
    person_name VARCHAR2(100),
    identification_date varchar2(15)
);

CREATE OR REPLACE TYPE IdentificationTableType AS TABLE OF IdentificationRecordType;
/
CREATE OR REPLACE FUNCTION show_all_identifications(
    s_observation_id IN INT
) RETURN IdentificationTableType 
IS
    identification_table IdentificationTableType := IdentificationTableType();
BEGIN
    FOR rec IN (
        SELECT identification.id as ident_id, 
                quality_level,
                IDENTIFICATION_PERSON_ID,
               person.name AS person_name,
               identification_date
        FROM identification 
        JOIN person ON identification.identification_person_id = person.id
        JOIN observation ON observation.id = observation_id
        WHERE observation.id = s_observation_id
    ) LOOP
        identification_table.EXTEND;
        identification_table(identification_table.LAST) := 
        IdentificationRecordType(
            rec.ident_id,
            rec.IDENTIFICATION_PERSON_ID,
            rec.quality_level, 
            rec.person_name, 
            rec.identification_date);
    END LOOP;

    RETURN identification_table; -- Return the variable containing the table, not the type
END;
/



SELECT * FROM TABLE(show_all_identifications(5));



-- HACER LOS MODOFY DE ABSOLUTAMENTE TODO








DESCRIBE PERSON;

/* devuelve todos los datos de una persona dada un person.ID en una tabla: */
CREATE OR REPLACE TYPE CompletePersonInfo AS OBJECT (
    id int,
    name varchar2(300),
    last_name varchar2(300),
    address varchar2(3000),
    country_id int,
    email varchar(300)

);

CREATE OR REPLACE TYPE PersonInfo AS TABLE OF CompletePersonInfo;

create or replace function return_person_table(
    i_person_id in int
) return PersonInfo
IS
    actual_table PersonInfo := PersonInfo();
    r_id int;
    r_name varchar2(300);
    r_last_name varchar2(300);
    r_address varchar2(3000);
    r_country_id int;
    r_email varchar(300);
begin
    BEGIN
        SELECT id, name, LAST_NAME, ADDRESS, COUNTRY_ID, EMAIL
        INTO     r_id,r_name,r_last_name,r_address,r_country_id,r_email
        FROM person
        WHERE person.id = i_person_id;
    end;
    actual_table.EXTEND;
    actual_table(actual_table.last) := CompletePersonInfo(
        r_id,
        r_name,
        r_last_name,
        r_address,
        r_country_id,
        r_email
    );
    return actual_table;
end;
/
--se llama así: reemplazaldp el 123 con una variable
select * from table(return_person_table(2));

