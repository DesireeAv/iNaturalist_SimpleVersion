# Funciones CRUD (Create, Read, Update and Delete) de todas las tablas necesarias

Lista de tablas involucradas:

- `IMAGE`
- `OBSERVATION`
- `IMAGE_OWNER`
- `FIGURE`
- `GEOGRAPHIC_COORDENATES`
- `IDENTIFICATION`
- `PERSON`
- `TAXON`

---
## Funciones para las tablas: 
#### `IMAGE`, `OBSERVATION`, `IMAGE_OWNER`, `FIGURE`, `PERSON`, `TAXON`, y `GEOGRAPHIC_COORDENATES`

- ## Create:
Está en el archivo Create&ReadProcedures.sql en la línea 180, [link para esa función](Create&ReadProcedures.sql#L180).

Recibe una fecha de tomada la imagen, la fecha en la que se subió la imagen, el ID de la persona que lo está subiendo, la latitud y longitud donde fué tomada la imagen, el dueño de la imagen, el nombre del taxon que se observa en la imagen, la licencia de uso, el link de la imagen y las notas de la nueva observación.

```sql
create_new_image_and_observation (
    new_taken_image_date varchar2,
    new_image_date varchAR2,
    new_person_id int,
    new_latitude varchar2,
    new_longitude varchar2,
    new_image_owner_name varchar2,
    new_taxon_name VARCHAR, 
    new_use_licence varchar2,
    new_figure_url varchar2,
    new_observation_note varchar2
)
```
Se llama la función de esta manera: (Ejemplo)
```sql
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
```

- ## Read:
Está en el archivo Create&ReadProcedures.sql en la línea 180, [link para esa función](Create&ReadProcedures.sql#L80).

Recibe los valores 
```sql
SELECT_IMAGE_OBSERVATIONS_TABLE(p_image_id IN NUMBER)
```
Se llama la función de esta manera: Se cambia el 21 por el ID de la imagen a la cual queremos verle todos los datos
```sql
SELECT * FROM TABLE(SELECT_IMAGE_OBSERVATIONS_TABLE(21));
```

- ## Update:
Está en el archivo Update&DeleteProcedures.sql en la línea 218, [link para esa función](Update&DeleteProcedures.sql#L218).

Recibe los valores **opcionales**: una fecha de tomada la imagen, la fecha en la que se subió la imagen, el ID de la persona que lo está subiendo, la latitud y longitud donde fué tomada la imagen, el dueño de la imagen, el nombre del taxon que se observa en la imagen, la licencia de uso, el link de la imagen y las notas de la nueva observación.
```sql
update_image_observation(
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
```
Se llama la función de esta manera: Se cambia el 21 por el ID de la imagen la cual queremos verle toda la imformación
```sql
SELECT * FROM TABLE(SELECT_IMAGE_OBSERVATIONS_TABLE(21));
```

- ## Delete:
Está en el archivo Update&DeleteProcedures.sql en la línea 340, [link para esa función](Update&DeleteProcedures.sql#L340).


Recibe los valores 
```sql
delete_image_observation(
    d_image_id in int
)
```
Se llama la función de esta manera: Se cambia el 17 por el ID de la imagen que se quiera eliminar 
```sql
BEGIN delete_image_observation(17);
END;
```



---
## Funciones para la tabla: 
#### `IDENTIFICATION`

- ## Create:
Está en el archivo Create&ReadProcedures.sql en la línea 476, [link para esa función](Create&ReadProcedures.sql#L476).

Recibe los valores de la calidad de la observación y su ID, el ID de la persona que realiza la identificación y la fecha que se hizo.
```sql
new_identification(
        new_quality_level in int,
        new_OBSERVATION_ID in INT,
        new_PERSON_ID in int,
        new_IDENTIFICAION_DATE in VARCHAR2
)
```
Se llama la función de esta manera: (Ejemplo)
```sql
BEGIN new_identification(
    9,
    28,
    3,
    '19-04-2024'
);
end;
```

- ## Read:
Está en el archivo Create&ReadProcedures.sql en la línea 529, [link para esa función](Create&ReadProcedures.sql#L529).

Recibe el ID de la observación la cuál queremos verle todas las identificaciones que se le han hecho.
```sql
show_all_identifications(
    s_observation_id IN INT
)
```
Se llama la función de esta manera: Se cambia el 5 por el ID de la observación
```sql
SELECT * FROM TABLE(show_all_identifications(5));
```

- ## Update:
Está en el archivo Update&DeleteProcedures.sql en la línea 6, [link para esa función](Update&DeleteProcedures.sql#L6).

Recibe los valores opcionales de la calidad de la observación y su ID, el ID de la persona que realiza la identificación y la fecha que se hizo.
```sql
update_identification(
    u_identification_id in int,
    u_quality_level in int,
    u_observation_id in int,
    u_identification_date in varchar2
)
```

Se llama la función de esta manera: (Ejemplo) 
```sql
BEGIN update_identification(
    5,
    null,
    7,
    null
);
END;
```

- ## Delete:
Está en el archivo Update&DeleteProcedures.sql en la línea 53, [link para esa función](Update&DeleteProcedures.sql#L53).


Recibe el ID de la identificación que se quiera eliminar
```sql
delete_identification(
    d_identification_id in int
)
```
Se llama la función de esta manera: Se cambia el 21 por el ID de la identificación que se quiera eliminar
```sql
BEGIN delete_identification(21); 
end;
```

---
## Informe propuesto que involucra al menos cuatro tablas:
Este es la vista en la pantalla principal de todas las observaciones existentes en el sistema, este informe involucra las tablas:
#### `IMAGE`, `PERSON`, `FIGURE` y `TAXON`
Está en el archivo Create&ReadProcedures.sql en la línea 26, [link para esa función](Create&ReadProcedures.sql#L26).

Este hace un loop sobre todas las observaciones existentes y devuelve un informe con el ID de la imagen, el nombre y apellido de la persona dueña de la observación,la imagen como tal,la licencia de uso, las fechas en que la imagen fue tomada y subida a la plataforma y el nombre del taxón.

Esta se llama así:
```sql
SELECT * FROM TABLE(SELECT_IMAGES_PANTALLA_PRINCIPAL);
```
