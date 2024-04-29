/*_____________________________________________________________________________________________________________________________________*/  
/* * * * * * * * * * * * * * * * * * * */               /* se llama así: * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* UPDATE procedure for identification */               /* BEGIN update_identification(                                                */
/* * * * * * * * * * * * * * * * * * * */               /* identification.id,quality_level,OBSERVATION_ID,identification_date); END;/  */

create or REPLACE procedure update_identification(
    u_identification_id in int,
    u_quality_level in int,
    u_observation_id in int,
    u_identification_date in varchar2
)
IS
BEGIN
    if u_quality_level is not null THEN
        UPDATE identification
        SET QUALITY_LEVEL = u_quality_level
        WHERE id = u_identification_id;
        commit;
    
    end if;

    if u_observation_id is not null THEN
        UPDATE identification
        SET OBSERVATION_ID = u_observation_id
        WHERE id = u_identification_id;
        commit;
    end if;

    if u_identification_date is not null THEN
        UPDATE identification
        SET IDENTIFICATION_DATE = u_identification_date
        WHERE id = u_identification_id;
    end if;
END;
/

BEGIN update_identification(
    5,
    null,
    7,
    null
);
END;
/



  /* * * * * * * * * * * * * * * * * * * */               /* se llama así: * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 /* DELETE procedure for identification */               /* BEGIN delete_identification(identification.id); end;                        */
/* * * * * * * * * * * * * * * * * * * */


create or replace procedure delete_identification(
    d_identification_id in int
)
is
BEGIN
    DELETE FROM identification
    WHERE identification.id = d_identification_id;
END;
/

BEGIN delete_identification(21); 
end;
/



/*_____________________________________________________________________________________________________________________________________*/  
/* * * * * * * * * * * * * * * * * * * */               
/* UPDATE procedure for image,         */
/* observation, figure,                */
/* geographic_coordenates & image_owner*/               
/* * * * * * * * * * * * * * * * * * * */    

-- funcion auxiliar que retorna el image_owner_id
CREATE OR REPLACE FUNCTION return_image_owner_id(
    image_owner_name in varchar2
) RETURN INT 
IS
r_image_owner_id INT;
BEGIN
    BEGIN
    SELECT ID INTO r_image_owner_id
    FROM IMAGE_OWNER
    WHERE IMAGE_OWNER.NAME = image_owner_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            r_image_owner_id := NULL;
    END;
    
    IF r_image_owner_id is null THEN 
        BEGIN
            INSERT INTO IMAGE_OWNER(NAME)
            VALUES(image_owner_name);
            COMMIT;
        END;
        BEGIN
            SELECT ID INTO r_image_owner_id
            FROM IMAGE_OWNER
            WHERE IMAGE_OWNER.NAME = image_owner_name;
        END;
        DBMS_OUTPUT.PUT_LINE('OwnerId: ' || r_image_owner_id);
        return r_image_owner_id;
    END IF;
    return r_image_owner_id;
END;
/
/* --para probar que funciona
SET SERVEROUTPUT ON SIZE UNLIMITED;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('OwnerId: ' || return_image_owner_id('GG'));
end;
/
select * from IMAGE_OWNER;
 */




-- funcion auxiliar que retorna el image_owner_id
CREATE OR REPLACE FUNCTION return_figure_id(
    u_figure_url in varchar2
) RETURN INT 
IS
r_figure_id INT;
BEGIN
    BEGIN
    SELECT ID INTO r_figure_id
    FROM FIGURE
    WHERE FIGURE.FIGURE_URL = u_figure_url;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            r_figure_id := NULL;
    END;
    
    IF r_figure_id is null THEN 
        BEGIN
            INSERT INTO FIGURE(FIGURE_URL)
            VALUES(u_figure_url);
            COMMIT;
        END;
        BEGIN
            SELECT ID INTO r_figure_id
            FROM FIGURE
            WHERE FIGURE.FIGURE_URL = u_figure_url;
        END;
        --DBMS_OUTPUT.PUT_LINE('OwnerId: ' || r_figure_id);
        return r_figure_id;
    END IF;
    return r_figure_id;
END;
/
/* --para probar que funciona
SET SERVEROUTPUT ON SIZE UNLIMITED;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('return_figure_id: ' || return_figure_id('https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/retro-sunset-vintage-funny-humor-big-little-penis-dick-wearing-christmas-hat-and-sunglasses-mounir-khalfouf.jpg'));
end;
/
select * from FIGURE;
 */




-- funcion auxiliar que retorna la geographic_coordenates_id
CREATE OR REPLACE FUNCTION return_geographic_coordenates_id(
    u_latitude in varchar2, u_longitude in VARCHAR2
) RETURN INT 
IS
r_gc_id INT;
BEGIN
    BEGIN
    SELECT ID INTO r_gc_id
    FROM GEOGRAPHIC_COORDENATES
    WHERE GEOGRAPHIC_COORDENATES.LATITUDE = u_latitude AND
    GEOGRAPHIC_COORDENATES.LONGITUDE = u_longitude;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            r_gc_id := NULL;
    END;
    
    IF r_gc_id is null THEN 
        BEGIN
            INSERT INTO GEOGRAPHIC_COORDENATES(
                LATITUDE, LONGITUDE
            )
            VALUES(u_latitude, u_longitude);
            COMMIT;
        END;
        BEGIN
            SELECT ID INTO r_gc_id
            FROM GEOGRAPHIC_COORDENATES
            WHERE GEOGRAPHIC_COORDENATES.LATITUDE = u_latitude AND
            GEOGRAPHIC_COORDENATES.LONGITUDE = u_longitude;
        END;
        --DBMS_OUTPUT.PUT_LINE('OwnerId: ' || r_gc_id);
        return r_gc_id;
    END IF;
    return r_gc_id;
END;
/
/* --para probar que funciona
SET SERVEROUTPUT ON SIZE UNLIMITED;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('return_geographic_coordenates_id: ' || return_geographic_coordenates_id('10.089521609961039', '-84.34531593167441'));
end;
/
select * from geographic_coordenates;
 */


describe return_image_owner_id;
drop PROCEDURE UPDATE_observation_id;



create or replace procedure update_image_observation(
    u_image_id in int,-- OBLIGATORIO
    u_taken_image_date in varchar2,
    u_image_date in varchAR2,
    u_latitude in varchar2,-------------ocupa funcion
    u_longitude in varchar2,------------ocupa funcion
    u_image_owner_name in varchar2,-----ocupa funcion
    u_taxon_name in VARCHAR2, ----------
    u_use_licence in varchar2,
    u_figure_url in varchar2,-----------ocupa funcion
    u_observation_note in varchar2------ocupa funcion
)
IS
u_image_owner_ID INT;
u_figure_id INT;
u_geographic_coordenates_id INT;
u_observation_id INT;
u_taxon_id int;
BEGIN

    if u_taken_image_date is not null then
        UPDATE image
        SET TAKEN_IMAGE_DATE = u_taken_image_date
        WHERE id = u_image_id;
        commit;
    end if;

    if u_image_date is not null then
        UPDATE image
        SET IMAGE_DATE = u_image_date
        WHERE id = u_image_id;
        commit;
    end if;

    if u_taxon_name is not null then
        BEGIN
            select id into u_taxon_id
            from TAXON
            where TAXON.TAXON_NAME = u_taxon_name;commit;
        END;

        begin
            UPDATE image
            SET image.TAXON_ID = u_taxon_id
            WHERE image.id = u_image_id;
            commit;
        end;
    end if;
    
    if u_use_licence is not null then
        UPDATE image
        SET USE_LICENSE = u_use_licence
        WHERE id = u_image_id;
        commit;
    end if;

-- image_owner funcion
    if u_image_owner_name is not null then
        u_image_owner_ID := return_image_owner_id(u_image_owner_name);
        UPDATE image
        SET IMAGE_OWNER_ID = u_image_owner_ID
        WHERE id = u_image_id;
        commit;
    end if;
    
-- figure function
    if u_figure_url is not null then
        u_figure_id := return_figure_id(u_figure_url);
        UPDATE image
        SET image.FIGURE_ID = u_figure_id
        WHERE id = u_image_id;
        commit;
    end if;
    

-- observation function
    if u_observation_note is not null then
        UPDATE OBSERVATION
        SET OBSERVATION.note = u_observation_note
        WHERE image_id = u_image_id;
        commit;
    end if;

-- geographic_coordenates funcitons LATITUDE 
    IF u_latitude IS NOT NULL and u_longitude is not null THEN
        u_geographic_coordenates_id := return_geographic_coordenates_id(u_latitude, u_longitude);
        UPDATE image
        SET image.GEOGRAPHIC_COORDENATES_ID = u_geographic_coordenates_id
        WHERE image.id = u_image_id;
        COMMIT;
    END IF;

END;
/

select * from image;
select * from OBSERVATION;
select * from IMAGE_OWNER;
select * from FIGURE;
SELECT * FROM TAXON;

BEGIN update_image_observation(
    20, 
    null,
    null,
    null,
    null,
    null,
    'Bridgesi',
    null,
    null,
    null
);
end;
/



  /* * * * * * * * * * * * * * * * * * * * * */               
 /* DELETE procedure for image&observation  */               
/* * * * * * * * * * * * * * * * * * * * * */

create or replace PROCEDURE delete_image_observation(
    d_image_id in int
)
IS
d_observation_id INT;
BEGIN
    BEGIN
        select id into d_observation_id
        from OBSERVATION
        where OBSERVATION.IMAGE_ID = d_image_id;
    END;

    BEGIN
        DELETE FROM IDENTIFICATION
        WHERE IDENTIFICATION.OBSERVATION_ID = d_observation_id;
    END;

    BEGIN
        DELETE FROM OBSERVATION
        WHERE OBSERVATION.IMAGE_ID = d_image_id;
    END;

    BEGIN
        DELETE FROM image
        WHERE ID = d_image_id;
    END;

END;
/

-- para probar que sirva 
BEGIN delete_image_observation(17);
END;
/

select * from image;
select * from OBSERVATION;
select * from IDENTIFICATION;

select * from FIGURE;

alter table taxon modify( taxon_name not null);

describe IMAGE;
describe taxon;