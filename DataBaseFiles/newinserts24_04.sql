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
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Anthocerotophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Bryophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Charophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Chlorophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Cycadophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Ginkgophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Glaucophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Gnetophyta', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Lycopodiophyta (Lycophyta)', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Magnoliophyta (Anthophyta)', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Marchantiophyta (Hepatophyta)', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Pinophyta (Coniferophyta)', 22);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Polypodiophyta (Monilophyta)', 22);

------------animalia-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Porifera', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Coelenterata (Cnidaria)', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Platyhelminthes', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Nematoda', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Annelida', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Arthropoda', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Mollusca', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Echinodermata', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Hemichordata', 21);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Chordata', 21);

------------fungi-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Ascomycota',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Basidiomycota',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Blastocladiomycota',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Chytridiomycota',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Glomeromycota',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Microsporidia',23);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Neocallimastigomycota',23);

------------protist-phylum-------------------------------------------------------------------------------
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Euglenozoa', 27);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Alveolata', 27);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Stramenopiles (Heterokonta)', 27);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Rhizaria', 27);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Amoebozoa', 27);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Chromalveolata', 27);

------------archea-phylum-----------------------------------------------------------------------------
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Euryarchaeota', 25);

------------bacteria-phylum---------------------------------------------------------------------------
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Firmicutes', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Proteobacteria', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Actinobacteria', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Bacteroidetes', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Cyanobacteria', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Spirochetes', 26);
INSERT INTO phylum(name, KINGDOM_ID) VALUES ('Chlamydiae', 26);



select * from phylum;
------------class----------------------------------------------------------------------------------
------------chordata-------------------------------------------------------------------------------
INSERT INTO class(name, PHYLUM_ID) VALUES ('Aves', 243);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Fish', 243);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Reptilia', 243);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Mammalia', 243);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Amphibia', 243);

------------Phylum-mollusca------------------------------------------------------------------------
INSERT INTO class(name, PHYLUM_ID) VALUES ('Monoplacophora', 240);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Polyplacophora', 240);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Bivalvia', 240);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Gastropoda', 240);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Cephalopoda', 240);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Scaphopoda', 240);
------------Phylum-Ascomycota----------------------------------------------------------------------
INSERT INTO class(name, PHYLUM_ID) VALUES ('Dothideomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Eurotiomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Leotiomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Pezizomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Sordariomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Saccharomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Taphrinomycetes', 244);
INSERT INTO class(name, PHYLUM_ID) VALUES ('Laboulbeniomycetes', 244);


select * from class;



------------orden-----------------------------------------------------------------------------------
------------aves------------------------------------------------------------------------------------
INSERT INTO orden(name, CLASS_ID) VALUES ('Passeriformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Anseriformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Galliformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Columbiformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Accipitriformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Strigiformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Falconiformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Charadriiformes', 21);
INSERT INTO orden(name, CLASS_ID) VALUES ('Psittaciformes', 21);

------------fish------------------------------------------------------------------------------------
INSERT INTO orden(name, CLASS_ID) VALUES ('Salmoniformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Perciformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Siluriformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Cypriniformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Gadiformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Scorpaeniformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Pleuronectiformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Tetraodontiformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Anguilliformes', 23);
INSERT INTO orden(name, CLASS_ID) VALUES ('Clupeiformes', 23);
------------reptilia---------------------------------------------------------------------------------
INSERT INTO orden(name, CLASS_ID) VALUES ('Squamata', 24);
INSERT INTO orden(name, CLASS_ID) VALUES ('Testudines', 24);
INSERT INTO orden(name, CLASS_ID) VALUES ('Crocodilia', 24);
INSERT INTO orden(name, CLASS_ID) VALUES ('Rhynchocephalia', 24);
-------------Mammalia--------------------------------------------------------------------------------
INSERT INTO orden(name, CLASS_ID) VALUES ('Rodentia', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Chiroptera', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Carnivora', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Primates', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Artiodactyla', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Cetacea', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Perissodactyla', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Lagomorpha', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Soricomorpha', 25);
INSERT INTO orden(name, CLASS_ID) VALUES ('Proboscidea', 25);
------------Amphibia----------------------------------------------------------------------------------
INSERT INTO orden(name, CLASS_ID) VALUES ('Anura', 26);
INSERT INTO orden(name, CLASS_ID) VALUES ('Caudata', 26);
INSERT INTO orden(name, CLASS_ID) VALUES ('Gymnophiona',26);



select * from orden;






--------------------------------------------------------------------------------------------------------
-------------family-------------------------------------------------------------------------------------
-------------crocordilie--------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Crocodylidae', 91);
INSERT INTO family(name, ORDEN_ID) VALUES ('Alligatoridae', 91);
INSERT INTO family(name, ORDEN_ID) VALUES ('Gavialidae', 91);
------------carnivora------------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Canidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Felidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Ursidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Mustelidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Procyonidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Hyaenidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Otariidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Phocidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Odobenidae', 95);
INSERT INTO family(name, ORDEN_ID) VALUES ('Ailuridae', 95);
------------primates-----------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Hominidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Cercopithecidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Callitrichidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Hylobatidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Lemuridae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Lorisidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Atelidae', 96);
INSERT INTO family(name, ORDEN_ID) VALUES ('Tarsiidae', 96);
------------Lagomorpha--------------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Ochotonidae ', 100);
INSERT INTO family(name, ORDEN_ID) VALUES ('Leporidae', 100);
------------caudata-------------------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Ambystomatidae', 104);
INSERT INTO family(name, ORDEN_ID) VALUES ('Plethodontidae', 104);
INSERT INTO family(name, ORDEN_ID) VALUES ('Salamandridae', 104);
------------rodentia-----------------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Muridae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Cricetidae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Sciuridae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Castoridae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Heteromyidae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Dipodidae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Erethizontidae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Geomyidae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Myocastoridae', 93);
INSERT INTO family(name, ORDEN_ID) VALUES ('Octodontidae', 93);
-------------Chiroptera-------------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Pteropodidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Vespertilionidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Rhinolophidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Phyllostomidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Molossidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Emballonuridae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Megadermatidae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Nycteridae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Miniopteridae', 94);
INSERT INTO family(name, ORDEN_ID) VALUES ('Rhinopomatidae', 94);
------------Passeriformes----------------------------------------------------------------------------------
INSERT INTO family(name, ORDEN_ID) VALUES ('Acanthisittidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Aegithalidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Alaudidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Bombycillidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Certhiidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Corvidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Estrildidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Fringillidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Hirundinidae', 80);
INSERT INTO family(name, ORDEN_ID) VALUES ('Muscicapidae', 80);


select * from family;
------------genus--------------------------------------------------------------------------------------
--------221--Crocodylidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Crocodylus', 221);
--------256--Octodontidae-family------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Aconaemys', 256);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Octodon', 256);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Octomys', 256);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Tympanoctomys', 256);
--------225--Felidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Leopardus', 225);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Panthera', 225);
--------224--Canidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Canis', 224);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Atelocynus', 224);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Cerdocyon', 224);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Chrysocyon', 224);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Speothos', 224);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Lycalopex ', 224);
--------274--Fringillidae-family-------------------------------------------------------------------------
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Hesperiphona', 274);
INSERT INTO genus(name, taxon_ancestor_id) VALUES ('Viridonia sagittirostris', 274);


select * from genus;
------------species--------------------------------------------------------------------------------------
--------14--Hesperiphona-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Hesperiphona vespertina', 14, 'Pepitero norteño');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Hesperiphona abellei', 14, 'Pepitero encapuchado');
--------8--Canis-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Aureus', 8, 'Chacal dorado');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Latrans', 8, 'Coyote');
--------9--Atelocynus-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Microtis', 9, 'Perro de monte');
--------10--Cerdocyon-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Thous', 10, 'Zorro cangrejero');

INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Sechurae', 13, 'Perro de monte de Sechura');
--------2--Aconaemys-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Fuscus', 2, 'Tunduco común');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Porteri', 2, 'Rata de los pinares');
--------3--Octodon-genus-------------------------------------------------------------------------
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Bridgesi', 3, 'Degú de Bridges');
INSERT INTO species(name, taxon_ancestor_id, common_name) VALUES ('Degus', 3, 'Ratón cola de pincel');


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