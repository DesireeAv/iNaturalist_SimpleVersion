CREATE SEQUENCE TAXON_ANCESTOR_ID
START WITH 1
INCREMENT BY 1;


-------------------------------------------------------------------------
------------kingdom-----------------------------------------------------------------------------------------
INSERT INTO kingdom(name) VALUES ('Animalia');
INSERT INTO kingdom(name) VALUES ('Plantae');
INSERT INTO kingdom(name) VALUES ('Fungi');
INSERT INTO kingdom(name) VALUES ('Protist');
INSERT INTO kingdom(name) VALUES ('Archaea/Archaebacteria');
INSERT INTO kingdom(name) VALUES ('Bacteria/Eubacteria');
select * from kingdom;





------------phylum-------------------------------------------------------------------------------------------
------------plantae-phylum-----------------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Anthocerotophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Bryophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Charophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Chlorophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Cycadophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Ginkgophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Glaucophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Gnetophyta', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Lycopodiophyta (Lycophyta)', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Magnoliophyta (Anthophyta)', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Marchantiophyta (Hepatophyta)', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Pinophyta (Coniferophyta)', 2);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Polypodiophyta (Monilophyta)', 2);

------------animalia-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Porifera', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Coelenterata (Cnidaria)', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Platyhelminthes', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Nematoda', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Annelida', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Arthropoda', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Mollusca', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Echinodermata', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Hemichordata', 1);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Chordata', 1);

------------fungi-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Ascomycota',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Basidiomycota',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Blastocladiomycota',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Chytridiomycota',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Glomeromycota',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Microsporidia',3);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Neocallimastigomycota',3);

------------protist-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Euglenozoa', 4);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Alveolata', 4);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Stramenopiles (Heterokonta)', 4);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Rhizaria', 4);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Amoebozoa', 4);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Chromalveolata', 4);

------------archea-phylum-----------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Euryarchaeota', 5);

------------bacteria-phylum---------------------------------------------------------------------------
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Firmicutes', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Proteobacteria', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Actinobacteria', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Bacteroidetes', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Cyanobacteria', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Spirochetes', 6);
INSERT INTO phylum(name, TAXON_ANCESTOR_ID) VALUES ('Chlamydiae', 6);

select * from phylum;



------------class----------------------------------------------------------------------------------
------------chordata-------------------------------------------------------------------------------
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Aves', 29);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Fish', 29);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Reptilia', 29);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Mammalia', 29);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Amphibia', 29);

------------Phylum-mollusca------------------------------------------------------------------------
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Monoplacophora', 26);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Polyplacophora', 26);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Bivalvia', 26);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Gastropoda', 26);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Cephalopoda', 26);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Scaphopoda', 26);
------------Phylum-Ascomycota----------------------------------------------------------------------
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Dothideomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Eurotiomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Leotiomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Pezizomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Sordariomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Saccharomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Taphrinomycetes', 30);
INSERT INTO class(name, TAXON_ANCESTOR_ID) VALUES ('Laboulbeniomycetes', 30);


select * from class;



------------orden-----------------------------------------------------------------------------------
------------aves------------------------------------------------------------------------------------
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Passeriformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Anseriformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Galliformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Columbiformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Accipitriformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Strigiformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Falconiformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Charadriiformes', 51);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Psittaciformes', 51);

------------fish------------------------------------------------------------------------------------
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Salmoniformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Perciformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Siluriformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Cypriniformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Gadiformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Scorpaeniformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Pleuronectiformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Tetraodontiformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Anguilliformes', 52);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Clupeiformes', 52);
------------reptilia---------------------------------------------------------------------------------
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Squamata', 53);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Testudines', 53);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Crocodilia', 53);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Rhynchocephalia', 53);
-------------Mammalia--------------------------------------------------------------------------------
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Rodentia', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Chiroptera', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Carnivora', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Primates', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Artiodactyla', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Cetacea', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Perissodactyla', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Lagomorpha', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Soricomorpha', 54);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Proboscidea', 54);
------------Amphibia----------------------------------------------------------------------------------
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Anura', 55);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Caudata', 55);
INSERT INTO orden(name, TAXON_ANCESTOR_ID) VALUES ('Gymnophiona',55);



select * from orden;






--------------------------------------------------------------------------------------------------------
-------------family-------------------------------------------------------------------------------------
-------------crocordilie--------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Crocodylidae', 91);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Alligatoridae', 91);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Gavialidae', 91);
------------carnivora------------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Canidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Felidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Ursidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Mustelidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Procyonidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Hyaenidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Otariidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Phocidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Odobenidae', 95);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Ailuridae', 95);
------------primates-----------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Hominidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Cercopithecidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Callitrichidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Hylobatidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Lemuridae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Lorisidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Atelidae', 96);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Tarsiidae', 96);
------------Lagomorpha--------------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Ochotonidae ', 100);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Leporidae', 100);
------------caudata-------------------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Ambystomatidae', 104);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Plethodontidae', 104);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Salamandridae', 104);
------------rodentia-----------------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Muridae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Cricetidae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Sciuridae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Castoridae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Heteromyidae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Dipodidae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Erethizontidae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Geomyidae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Myocastoridae', 93);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Octodontidae', 93);
-------------Chiroptera-------------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Pteropodidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Vespertilionidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Rhinolophidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Phyllostomidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Molossidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Emballonuridae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Megadermatidae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Nycteridae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Miniopteridae', 94);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Rhinopomatidae', 94);
------------Passeriformes----------------------------------------------------------------------------------
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Acanthisittidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Aegithalidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Alaudidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Bombycillidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Certhiidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Corvidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Estrildidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Fringillidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Hirundinidae', 70);
INSERT INTO family(name, TAXON_ANCESTOR_ID) VALUES ('Muscicapidae', 70);


select * from family;


------------genus--------------------------------------------------------------------------------------
--------221--Crocodylidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Crocodylus', 106);
--------256--Octodontidae-family------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Aconaemys', 141);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Octodon', 141);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Octomys', 141);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Tympanoctomys', 141);
--------225--Felidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Leopardus', 110);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Panthera', 110);
--------224--Canidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Canis', 109);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Atelocynus', 109);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Cerdocyon', 109);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Chrysocyon', 109);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Speothos', 109);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Lycalopex ', 109);
--------274--Fringillidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Hesperiphona', 159);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Viridonia sagittirostris', 159);

select * from genus;


------------species--------------------------------------------------------------------------------------
--------14--Hesperiphona-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Hesperiphona vespertina', 175, 'Pepitero norteño');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Hesperiphona abellei', 175, 'Pepitero encapuchado');
--------8--Canis-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Aureus', 169, 'Chacal dorado');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Latrans', 169, 'Coyote');
--------9--Atelocynus-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Microtis', 170, 'Perro de monte');
--------10--Cerdocyon-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Thous', 171, 'Zorro cangrejero');

--------2--Aconaemys-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Fuscus', 163, 'Tunduco común');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Porteri', 163, 'Rata de los pinares');
--------3--Octodon-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Bridgesi', 164, 'Degú de Bridges');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Degus', 164, 'Ratón cola de pincel');


select * from SPECIES;

---- CREO QUE OCUPO INSERTAR PLANTAS DE CR !!!!!!!!!!!!!!!!!!!!!1----------------------------
select * from country;


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------PERSON--------------------------------------------------------------------------
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Desireé', 'Avilés', '100 mts al estadio, Sarchí Norte, Sarchí, Alajuela', 41);
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Emmanuel', 'Rojas', '200 mts al mall, San Ramón, Alajuela', 41);
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Roberta', 'Salazar', '700 mts oeste al Empire State, New York', 178);
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Suzana', 'Oria', '120 mts al estadio, Sarchí Norte, Sarchí, Alajuela', 41);

INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Spiderman', 'Del Jesús', '30 mts norte a la iglesia de San Ramón, Alajuela', 41);
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('Henry', 'Cavil', 'house 312, complex 9, South Kensington, London', 186);
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
INSERT INTO person(name, last_name, address, COUNTRY_ID) VALUES ('', '', '', );
select * from PERSON;