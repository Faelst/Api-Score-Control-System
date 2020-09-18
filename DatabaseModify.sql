
create table technicals (
    id int(10) not null,
    name varchar(255) DEFAULT NULL,
    street varchar(255) DEFAULT NULL,
    neighborhood varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    status int default 1,
    email varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    phone2 varchar(255) DEFAULT NULL,
    erp_people_id int(10) DEFAULT null,
    deleted int(10) default 0,
    create_date timestamp DEFAULT CURRENT_DATE,
    PRIMARY KEY (id)
);

create table assignment_levels (
    id int(10) not null AUTO_INCREMENT,
    title varchar(255) DEFAULT NULL,
    score float(10) not null,
    active int(5) default 1,
	deleted int(5) NOT null DEFAULT 0,
    create_date timestamp DEFAULT CURRENT_DATE,
    PRIMARY KEY (id)
);

CREATE TABLE assignment_types (
    id int(10) not null AUTO_INCREMENT,
    title varchar(255) DEFAULT NULL,
    assignment_level_id int(10) not null,
    active int(5) default 1,
	deleted int(5) NOT null DEFAULT 0,
    create_date timestamp DEFAULT CURRENT_DATE,
    PRIMARY KEY (id),
);

CREATE TABLE assignment_type_levels (
	assignment_type_id int(10) not null,
    assignment_level_id int ('10') not null,
	FOREIGN KEY (assignment_type_id) REFERENCES assignment_types(id),
	FOREIGN KEY (assignment_level_id) REFERENCES assignment_levels(id)
)

CREATE TABLE services (
	id int(10) not null AUTO_INCREMENT,
    service_number int(10) not null,
    technical_id int(10) not null,
    user_id int(10) not null,
    city_id int(10) not null,
	assignment_type_id int(10) not null,
    assignment_level_id int(10) not null,
    issue_date timestamp default null default current_timestamp,
	execute_date date not null,
    descriotion_service varchar(255) DEFAULT NULL,
	dubbed_service int(2) default 0,
	deleted int(5) NOT null DEFAULT 0,
    create_date timestamp not null DEFAULT current_timestamp,
	erp_service_id int(10) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES usuario(id_usuario),
	FOREIGN KEY (technical_id) REFERENCES technicals(id),
    FOREIGN KEY (assignment_type_id) REFERENCES assignment_types(id),
    FOREIGN KEY (assignment_level_id) REFERENCES assignment_levels(id),
    FOREIGN KEY (city_id) REFERENCES cidade(id_cidade)
);

CREATE TABLE dubbed_services (
	id int(10) not null auto_increment,
    service_id int(5) not null,
    technical_id int(5) not null,
    follow_type_code int(5) not null,
    follow_type_desc varchar(255) DEFAULT NULL,
    deleted int(5) NOT null DEFAULT 0,
    create_date timestamp not null DEFAULT current_timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (service_id) REFERENCES services(id),
    FOREIGN KEY (technical_id) REFERENCES technicals(id)   
);
----------------------------------- Insert dos tecnicos 
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (49,"Bruno Weber dos Santos","Rua Cruzeiro","Cidade Nova","Pindamonhangaba",1,"joaorodriguesvivas@gmail.com","","",49);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (61,"Ricardo Vitalino","Rua Noruega","Residencial Pasin","Pindamonhangaba",1,"matheus.marinho@vivastelecom.com.br","","",61);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (216,"LEANDRO ANTÔNIO DE LIMA","JACI ANDREOLI","VILA NAIR","Campos do Jordão",1,"belabsantos@hotmail.com","(12)99608-2045","(12)99608-2045",216);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (4757,"ELBERTH SILVA NUNES","r Benedito Garboci","Jd. Conquista","Jacareí",1,"joaorodriguesvivas@gmail.com","(12)98815-4475","(12)98830-5548",4757);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (8945,"WESLEY HENRIQUE BARRETO CASTELANI","Rua Benedito Mário da Silva","Campinas","Pindamonhangaba",1,"joaorodriguesvivas@gmail.com","","(12)99624-8718",8945);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (10427,"WANDERSON JAMES OLIVEIRA MAGALHÃES","Viela Projetada 128","Vila Inglesa","Campos do Jordão",1,"joao.rodrigues@vivastelecom.com.br","","(12)98812-7102",10427);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (15039,"PAULO MARCIO COSTA DE LIMA","condelaque Chaves de Andrade","Bela Vista","Campos do Jordão",1,"joao.rodrigues@vivastelecom.com.br","","(12)99761-1837",15039);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (19266,"I-DOUGLAS DOS SANTOS VIEIRA","PEDRO PAULO","DESCANSOPOLIS","Campos do Jordão",1,"joao.rodrigues@vivastelecom.com.br","","(12)996412380",19266);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (19615,"GUSTAVO CARDOSO FERNANDES","Av. Dom Pedro I","Parque dos Príncipes","Jacareí",1,"matheus.marinho@vivastelecom.com.br","","(12)99988-8777",19615);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (37928,"Rafael Augusto Silvério","Rua Aloisio do Amaral Campos","Jardim Esperança","Jacareí",1,"rafael.silverio@vivastelecom.com.br","(12)981708474","(12)981708474",37928);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (40289,"GUILHERME TORRES PAZETTO","Rua Paulo Madureira Lebrão","Vila Alexandrina","São José dos Campos",1,"tec08.vivas@gmail.com","","(12)97406-4284",40289);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (41487,"DAVID TORQUATO DA SILVA","Vitalino Soares Leite","Jardim Santa Marina","Jacareí",1,"matheus.marinho@vivastelecom.com.br","(12)98834-4425","(12)98809-3269",41487);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (42914,"João Vitor do Amaral Pereira","Rua Alfredo Marcondes","Jardim Santa Cecília","Pindamonhangaba",1,"joaorodriguesvivas@gmail.com","(12)97411-9058","",42914);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (43065,"WESLEY CARDOSO COSTA ","Rua Belmiro Andrade","Jardim Oriente","São José dos Campos",1,"joaorodriguesvivas@gmail.com","","",43065);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (43810,"IGOR DE CASSIO MELO MARIA","Rua Pastor José Rodrigues de Almeida","Parque Shangri-lá","Pindamonhangaba",1,"rafael.silverio@vivastelecom.com.br","(12)99746-8394","(12)99767-5415",43810);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (45599,"WASHINGTON WESLEY DA SILVA","Rua Príncipe Pedro III de Alcântara","Parque dos Príncipes","Jacareí",1,"joaorodriguesvivas@gmail.com","(12)97406-8105","",45599);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (46596,"ESCRITÓRIO PINDA MOREIRA CESAR","Avenida Dom Pedro I","Parque dos Príncipes","Jacareí",1,"estoque@vivasinternet.com.br","(12)3570-0007","",46596);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (46770,"LUCAS WADA","Rua Professor Cesídio Ambrogi","Jardim Independência","Taubaté",1,"joaorodriguesvivas@gmail.com","(12)3426-9711","(12)99186-6836",46770);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (53949,"CELIO CLAUDIO 390.593.468-07","Rua Neusa Maria Silvestre de Paula","Loteamento Pinus de Iriguassu II","Caçapava",1,"joao.rodrigues@vivasinternet.com.br","(12)11111-1111","",53949);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (57077,"JOSE AUGUSTO BARBOSA DA SILVA 04291872461","Rua Nivaldo Veríssimo Santos","Residencial Bosque dos Ipês","São José dos Campos",1,"agustobssilva@gmail.com","","",57077);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (57094,"ELISEU DE MOURA JUNIOR 33200492830","Rua Aparecida","Jardim das Indústrias","Jacareí",1,"atendimento@vivasinternet.com.br","","",57094);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (57100,"DIOGENES MARIANO DE PAULA 39895948859","Rua Regina Alves dos Santos","Campo dos Alemães","São José dos Campos",1,"joao.rodrigues@vivastelecom.com.br","","",57100);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (57104,"GUSTAVO CARDOSO FERNANDES 41329412800","Rua José Castrioto","Parque Nova Esperança","São José dos Campos",1,"","","",57104);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (57142,"WESLEY CARLOS RODRIGO DE ABREU ","Rua Maria Roseclair de Oliveira","Campo dos Alemães","São José dos Campos",1,"weslwycarlos1@outlook.com","","",57142);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (63276,"ALISSON RODRIGO DOS SANTOS VIEIRA","Rua Professor Demétrio Cabral","Conjunto Residencial Araretama","Pindamonhangaba",1,"joao.rodrigues@vivasinternet.com.br","","",63276);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (63903,"Gabriel Leandro da Silva","Rua costa Rica 43 cep 13256-725","","Campos do Jordão",1,"joao.rodrigues@vivasinternet.com.br","","",63903);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (63904,"Eduardo Tomé","Rua verginio belgine 1467 bairro Santo Antônio ","","Campos do Jordão",1,"joao.rodrigues@vivasinternet.com.br","","",63904);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (65567,"PABLO ALVES DA SILVA","Rua Aristóteles Fernandes de Oliveira","Conjunto Residencial Araretama","Pindamonhangaba",1,"joao.rodrigues@vivastelecom.com.br","","",65567);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (68601,"Luciano de Oliveira Ferreira.","Rua.manoel César Ribeiro","","",1,"joao.rodrigues@vivastelecom.com.br","","",68601);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (70355,"Alberoni Amaurilio Queiroz","Rua Múcio Rodolpho, 235","","Campos do Jordão",1,"joao.rodrigues@vivastelecom.com.br","","",70355);
INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (71864,"Patrique Hernandes Pereira","R. Ariovaldo Saul, 240.","","",1,"joao.rodrigues@vivastelecom.com.br","","",71864);

----------------------------------- Insert dos tecnicos 


--- Inserir Tipos de OS ------
INSERT INTO assignment_types(title) VALUES ('Instalação');
INSERT INTO assignment_types(title) VALUES ('Manutenção');
INSERT INTO assignment_types(title) VALUES ('Retirada');
INSERT INTO assignment_types(title) VALUES ('Vistoria');
INSERT INTO assignment_types(title) VALUES ('Treinamento N/R');
INSERT INTO assignment_types(title) VALUES ('Acordo');
--- Inserir Tipos de OS ------


--- Inserir instalação ------
INSERT INTO assignment_levels( title, score ) VALUES ('Até 150m', 1.0);
INSERT INTO assignment_levels( title, score ) VALUES ('151m a 300m', 1.5);
INSERT INTO assignment_levels( title, score ) VALUES ('301m a 400m', 2.0);
INSERT INTO assignment_levels( title, score ) VALUES ('401m a 500m', 2.5);
INSERT INTO assignment_levels( title, score ) VALUES ('501m a 600m', 3.0);

INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (1,1);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (1,2);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (1,3);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (1,4);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (1,5);
--- Inserir instalação ------


----- inserir Manutenção ---- 
INSERT INTO assignment_levels( title, score ) VALUES ('Troca de Equipamentos', 0.5);
INSERT INTO assignment_levels( title, score ) VALUES ('Configuração de Equipamento', 0.5);
INSERT INTO assignment_levels( title, score ) VALUES ('Cabeamento Interno', 0.5);
INSERT INTO assignment_levels( title, score ) VALUES ('Cabeamento Externo', 0.5);
INSERT INTO assignment_levels( title, score ) VALUES ('Cabeamento completo', 1.0);

INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (2,6);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (2,7);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (2,8);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (2,9);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (2,10);
--------- inserir Manutenção ---- 


--------- inserir Vistoria -------
INSERT INTO assignment_levels( title, score ) VALUES ('Troca de Residencial', 0.2);

INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (3,11);
--------- inserir Vistoria -------

------ retirada -----
INSERT INTO assignment_levels( title, score ) VALUES ('Normal', 0.5);
INSERT INTO assignment_levels( title, score ) VALUES ('Acordo', 1);

INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (4,12);
INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (4,13);
------ retirada -----

-- Treinamento ---
INSERT INTO assignment_levels( title, score ) VALUES ('Treinamento', 5.0 );

INSERT INTO assignment_type_levels(assignment_type_id, assignment_level_id) VALUES (5,14);
-- Treinamento ---



