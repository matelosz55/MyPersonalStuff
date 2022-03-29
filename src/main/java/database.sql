USE mdata;

CREATE TABLE `cinemas` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
                           `address` text COLLATE utf8_polish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `name`, `address`) VALUES
                                                    (1, 'Luna', 'ul. Marszałkowska 28'),
                                                    (2, 'Silver Screen Puławska', 'Centrum Europlex - ul. Puławska 17'),
                                                    (3, 'Iluzjon Filmoteki Narodowej', 'ul. Narbutta 50a'),
                                                    (4, 'Etnokino', 'Ul. Kredytowa 1, Warszawa'),
                                                    (5, 'Multikino Złote Tarasy', 'ul. Złota 59'),
                                                    (6, 'Kinoteka', 'pl. Defilad 1'),
                                                    (7, 'Cinema City Promenada', 'ul. Ostrobramska 75C'),
                                                    (8, 'Praha', 'ul. Jagielloñska 26'),
                                                    (9, 'Alchemia', 'ul. Jezuicka 4'),
                                                    (10, 'Muranów', 'ul. Zamenhofa 1'),
                                                    (11, 'Femina', 'al. Solidarności 115');

CREATE TABLE `movies` (
                          `id` int(11) NOT NULL,
                          `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
                          `description` text COLLATE utf8_polish_ci,
                          `rating` decimal(4,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


INSERT INTO `movies` (`id`, `title`, `description`, `rating`) VALUES
                                                                  (1, 'Zbuntowana (2015)', 'Beatrice Prior konfrontuje się z wewnętrznymi demonami i kontynuuje walkę przeciwko ogromnemu sojuszowi, który może spowodować rozpad społeczeństwa.', '7.00'),
                                                                  (2, 'Seks, miłość i terapia (2014)', 'Lambert, seksoholik starający się zerwać z nałogiem, zatrudnia wiecznie niezaspokojoną nimfomankę.', '5.00'),
                                                                  (3, 'Ex Machina (2015)', 'Po wygraniu konkursu programista jednej z największych firm internetowych zostaje zaproszony do posiadłości swojego szefa. Na miejsce okazuje się, że jest częścią eksperymentu. ', '8.00'),
                                                                  (4, 'Sils Maria (2014)', 'Wybitna aktorka podczas kilku dni spędzonych w Alpach ze swoją asystentką na nowo odkrywa siebie. ', '7.21'),
                                                                  (5, 'Chappie (2015)', 'Dwóch gangsterów kradnie policyjnego androida, by wykorzystać go do swoich celów. ', '8.32'),
                                                                  (6, 'Kopciuszek (2015)', 'Po śmierci ojca zła macocha Elli zamienia dziewczynę w służącą. Los Kopciuszka odmieni dopiero Dobra Wróżka.', '8.00'),
                                                                  (7, 'Sąsiady (2014)', 'Ksiądz odwiedza po kolędzie kamienicę, odkrywając tajemnice jej lokatorów. ', '3.15'),
                                                                  (8, 'Złota klatka (2013)', 'Sara, nastolatka z Gwatemali, wyrusza w niebezpieczną podróż do Los Angeles w poszukiwaniu lepszego życia.', '9.00'),
                                                                  (9, 'Body/Ciało (2015)', 'Cyniczny prokurator i jego cierpiąca na anoreksję córka próbują odnaleźć się po tragicznej śmierci najbliższej osoby.', '6.00'),
                                                                  (10, 'Fru! (2014)', 'Ptaszek, który nigdy wcześniej nie wychylił dzioba poza rodzinne gniazdo, zostaje przez pomyłkę przewodnikiem stada.', '5.00'),
                                                                  (11, 'Disco Polo (2015)', 'Młodzi muzycy z prowincji w błyskawiczny sposób zdobywają szczyty list przebojów.', '2.00'),
                                                                  (12, 'Asteriks i Obeliks: Osiedle Bogów (2014)', 'Juliusz Cezar decyduje się na budowę dzielnicy mieszkaniowej dla właścicieli rzymskich i nazywa ją Osiedlem Bogów.', '9.00');


SELECT COUNT(id) FROM tickets;
select AVG(price) from tickets;
select * from payments where id > 2 order by id desc limit 5;
select sum(quantity) from tickets  where price > 23.15;
select * from movies where title like 'A%';

CREATE TABLE IF NOT EXISTS clients(
                                      id INT PRIMARY KEY AUTO_INCREMENT,
                                      name VARCHAR(100),
                                      surname VARCHAR(100)
);

create table if not exists client_address(
    id int(10) auto_increment primary key,
    city varchar(20) not null,
    street varchar(20) not null,
    house_nr varchar(10),
    foreign key (id) references clients(id)
);

create table if not exists clients_table(
    client_id int(10),
    address_id int(10),
    foreign key (id) references clients(id),
    foreign key (id) references client_address(id),
    primary key (client_id,address_id)
);

insert into client_address(city,street,house_nr) values ('Krakow','Strusia',2),('Katowice','Giszowiec',4);
insert into clients(name, surname) VALUES ('Marek','Nowak'),('Tadeusz','Kucharczyk');

alter table payment add constraint foreign key (id) references tickets(id);


CREATE TABLE IF NOT EXISTS images(
                                     id int unsigned auto_increment primary key,
                                     offer_id int unsigned,
                                     src varchar(100),
                                     dimension varchar(10),

                                     foreign key (offer_id) references offers(id)


);

CREATE TABLE IF NOT EXISTS users_companies(
                                              id int unsigned auto_increment primary key,
                                              user_id int unsigned unique,
                                              name varchar(30),
                                              nip int,
                                              street varchar(50),
                                              street_nr mediumint,
                                              phone char(9),
                                              post_code char(9),
                                              capital decimal(7,2),
                                              rate decimal(5,4),
                                              created_at datetime,

                                              foreign key (user_id) references users(id)
);

CREATE TABLE IF NOT EXISTS `users` (
                                       `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                       `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
                                       `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
                                       `password` char(64) COLLATE utf8_polish_ci NOT NULL,
                                       `salt` varchar(32) COLLATE utf8_polish_ci NOT NULL,
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=101 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `salt`) VALUES
                                                                    (1, 'Leonard Adamczyk', 'martyna.jankowski@gmail.com', '4c605bf1620978c6691f5780012878c8c240606c23d9d7696cf97d89147681a3', '59c13a'),
                                                                    (2, 'Jerzy Mazur', 'olga93@wp.pl', 'd3311d68281f4fc611b489a235ee1a24cebf29a65004b1657a60f4f00bc8580c', 'f3d3d7'),
                                                                    (3, 'Bartek Sikorski', 'rozalia.kowalski@kaczmarczyk.info', '18ca4c974775b3a248d4a832f61374e57d65c38aa0bdf978e58f68efed93fa0e', '3f5637'),
                                                                    (4, 'Urszula Wróbel', 'blanka.wojcik@ziolkowski.pl', 'cda7a8d4f35c5a3e30580ab863054345d360b9c0915ff6036bf39a71326f1d91', '858c86'),
                                                                    (5, 'Patrycja Tomaszewska', 'wiktoria.olszewska@onet.pl', '7dd63993cb8923d393a634149cd5ab4eb7a28444a7427433c1a7143a1d0a495f', 'c36540'),
                                                                    (6, 'Krystyna Sobczak', 'julia.glowacka@yahoo.com', 'edb37b8953ff961cd115ec3bb9efbe8ad03518e71608187691acb78b662af008', 'faec22'),
                                                                    (7, 'Amelia Jakubowska', 'kmichalska@interia.pl', '0c8a61bb00d6ada92c61dfef72cc2da83e1eb09152a21ca7c943831ff928f0ff', '16f6c3'),
                                                                    (8, 'Klaudia Gajewska', 'eryk89@yahoo.com', '2447002747478040961225c318c52d99cbd06b41ed6142924eb965301211a8ad', 'f782b8'),
                                                                    (9, 'Lena Król', 'kazmierczak.tomasz@yahoo.com', 'acb3faeaa686a001071cdcb1e4b64f55e6fa7814548a0fb091ae67524131a132', '03fe7e'),
                                                                    (10, 'Patrycja Borowska', 'fjakubowska@gazeta.pl', '44da6b1913d8ab3f6a16c73d70b4a256b9cfb54eb83dc946120846ce4c496570', '8be41b'),
                                                                    (11, 'Kaja Czerwiński', 'katarzyna56@olszewska.com', '6a173b4e62a65b71d353c3b1be3e95e6c452a125e4ccd673e86cc77a016e04b7', '78d630'),
                                                                    (12, 'Antoni Laskowski', 'anita.nowak@yahoo.com', 'ca034f323d6573d860a57cd45b482bef74a09313a8b1973c6ddd84511f68e959', 'f4cd40'),
                                                                    (13, 'Karol Ostrowski', 'wilk.jagoda@kolodziej.pl', 'b664969b1fff8940575125395412adb28102c53c29a860d3a9c89ac51e7222cc', 'c5e7e8'),
                                                                    (14, 'Nadia Lewandowska', 'maciejewski.fryderyk@olszewska.pl', 'eac297127e9b035da5946b3f748f56732b89ae75edf90902947734eabe343bfa', 'a47e75'),
                                                                    (15, 'Marcin Wysocki', 'michalski.krzysztof@gazeta.pl', '9e424dc8946aea509ea25d1abfd530b2e9dcc5f195b85aaac90ef8f5437b71cf', '0d6e23'),
                                                                    (16, 'Adrian Duda', 'dabrowski.nina@kalinowska.com.pl', '27df507f41c5a3eb9f070512774a1744d31d680fec20fefe4f430e4caefe8d8c', 'ed6788'),
                                                                    (17, 'Andrzej Szewczyk', 'ynowakowska@gazeta.pl', 'a23754753ea683f916d4bb5e4f284d0bd08a5585ae83875f64d30d412394ba0e', 'e40cf6'),
                                                                    (18, 'Sara Laskowski', 'brzezinska.antoni@urbanska.com', '3c0025bee6ff5f049317fb63af10546a08fea4f0db43d79b66d72eea95a14299', '645c65'),
                                                                    (19, 'Eryk Laskowski', 'witold63@gazeta.pl', '069842b4c2387e1a5a9a1fa462e07534ea6dbb2c007ca4b66e19fe7c9d2b0567', '89c495'),
                                                                    (20, 'Fryderyk Sikorska', 'ksawery95@interia.pl', 'ff86cc6211b55b3870b387ffc0eac034549ec5f9f4f2be3a2803ea4c23ced7f0', '926059'),
                                                                    (21, 'Emilia Zalewska', 'antoni.malinowski@jankowski.pl', '85f5f215978a1750da85e1c1a9ee6324103a5818946db7913e7c15d4239a264c', '3359f3'),
                                                                    (22, 'Gustaw Jasińska', 'mazur.blazej@interia.pl', 'd7248ee2bf54e5b291fe3b9a66153ee7b9ca0a85884bc94aa8baa62842ccf132', '7b9747'),
                                                                    (23, 'Iga Kozłowska', 'konrad.adamski@nowak.pl', '971102f86b990020b0e8a3b13a151dd52a5302d948102c0470e0c5a4caf846fb', 'b31791'),
                                                                    (24, 'Oskar Cieślak', 'mwroblewska@malinowska.pl', '1f2a470044640379e6c47c36fbb520b3c81aab0128d5b7f88931d16c5f0e3e5a', '4a9496'),
                                                                    (25, 'Mateusz Pietrzak', 'filip06@michalska.net', '22db5985afccb01cd4b14923efe988ee126f10f9f10a62e3c2582a56aed48348', '41cde5'),
                                                                    (26, 'Fabian Michalak', 'michalski.szymon@gazeta.pl', '687f4e2b39a6236c68a4c45035b530deedf337ecd316d0873a0ff46b787f1771', '17f6e7'),
                                                                    (27, 'Małgorzata Gajewski', 'monika96@mroz.net', '74f5c36558ffa8ed6c26965ea52a63ecc4b7298eae636c66a0f4ceb5bbce6cc0', '5de0bb'),
                                                                    (28, 'Gustaw Jabłoński', 'konrad42@yahoo.com', 'f3d98507ee0cb997659612efa7fa08838898e747dbe1d4854497a10c23bc36d5', 'adfb53'),
                                                                    (29, 'Grzegorz Jankowski', 'baranowska.malgorzata@walczak.pl', '322b282ac34373977df0895c92c725e11c9a761df786747f3feb0c8eaa26ef71', 'fe6e8d'),
                                                                    (30, 'Nikola Sokołowski', 'pola.kazmierczak@wp.pl', 'f04faf97797381f646f035e041b0cf8e22230ef1e2a046e866baec291acf46c8', '06dc64'),
                                                                    (31, 'Izabela Wiśniewski', 'ksawicka@gazeta.pl', '6295c66172bcad3d56c201417a91f2bfc0339f211f114b2ce8ee18557a8b6437', '11766d'),
                                                                    (32, 'Matylda Jakubowska', 'krystian30@yahoo.com', '75cfae673c4a27564cc552ecc98568c440d7fc1d7d4a99657976943ee4301a0e', 'dd43d3'),
                                                                    (33, 'Karina Kucharska', 'ida99@walczak.info', '4691ac6b5e95388079090c28b7dcb5a38d55d2c619a2de3e74a9599c178ccf70', '115f1b'),
                                                                    (34, 'Małgorzata Dąbrowski', 'krystian20@sokolowska.pl', 'af3d74e2538dbdf431d990115c80632bcb7c02a1517db8fe65ce95731979e50a', '8a9027'),
                                                                    (35, 'Agata Wasilewska', 'ykwiatkowska@wp.pl', '85f239bdae8028b694029761c39ac18eabbfd3ad283a307ceef3704913442b5e', 'fb6851'),
                                                                    (36, 'Amelia Konieczny', 'zsawicka@wp.pl', 'ea389c01e12aae647f5cf6f073f5b62d4faecc50a74ea7ce4a0160f52a9b8361', 'c48395'),
                                                                    (37, 'Anastazja Walczak', 'pawlak.agnieszka@stepien.org', 'b1f82e34663a55f57220b84c8a1457a81f8e42b93cbb5698fda3cb97a1d61cbf', '204489'),
                                                                    (38, 'Anastazja Kaczmarek', 'makowska.monika@malinowski.pl', 'f51cd615d6859da745f9fd3b69f369b1b52f5c1163d2e0e20d2e5e6afc471f68', 'a2247a'),
                                                                    (39, 'Patryk Chmielewska', 'wysocki.apolonia@yahoo.com', '1d4220e6cdd200468231c1483e28d646da3e66c9775ac315f5525be587c74472', 'ec069e'),
                                                                    (40, 'Ignacy Dudek', 'ywlodarczyk@sokolowski.net', 'f1d57c336be156bcf558ec9d8486aff99398b1d17e7c24b5607892f8582e6803', 'e39534'),
                                                                    (41, 'Anastazja Kozłowski', 'julia.gorski@gorecka.net', '994de1ddc785e69f74b485d8b26bba3e1313cd69303c36fe16dfa4acf2d6fe8b', '2b5e52'),
                                                                    (42, 'Ewa Włodarczyk', 'alan69@wasilewski.info', '355d6ac750f35f15f8173d8d9364e7845167a67f8cce62870f19fcb9de7706f8', 'cb8462'),
                                                                    (43, 'Blanka Mazur', 'ykonieczny@interia.pl', '2bdf4526920aa2c7a3ce41b78c4a819071adc51c44981a71013a32fbc914565c', '4ad78e'),
                                                                    (44, 'Natasza Kubiak', 'qpiotrowska@onet.pl', 'e4837a2e6283897ac544921f9ee7dff74c5fdb2af63c11dfa69a9b81af726874', 'cdf90b'),
                                                                    (45, 'Dagmara Włodarczyk', 'malinowski.bartek@kubiak.pl', '0d88af7043a2b75dbaf8ab1e4005aba8973fee3e0411b87a39cd3b8cc45564af', '6d3328'),
                                                                    (46, 'Cezary Zając', 'dariusz.zawadzki@grabowska.pl', '30b795bbc61ad5f3c837215f58d923bfc6f6064d611ded946c418dbfbbba1fbe', '9cc8b4'),
                                                                    (47, 'Konrad Michalak', 'tola.jankowska@wp.pl', '7a414f35e55ad19235a0be1692131c66f65590ace547c1b2e43dae083f07599f', 'b78646'),
                                                                    (48, 'Mariusz Wróbel', 'akazmierczak@wisniewski.net', 'd6828320c69228e737c9c932985ce91741dd47d03a44288127eee9b42712b2dc', '7eadb5'),
                                                                    (49, 'Antoni Kowalski', 'cyprian29@wp.pl', 'b2418a9746c47544c946483833d02408aad4a05cbc6bebd6d3b611104a37e181', '5c32bf'),
                                                                    (50, 'Alex Michalak', 'nina91@kowalczyk.pl', '6da734486488cd79c20528c54a713c15d88fbee269a09b6e453c588e4e6149ea', 'e1a522'),
                                                                    (51, 'Marcin Kucharska', 'walczak.weronika@interia.pl', '79f4167a4744d3a040ff5054ac081967b1a1e89f76338b2c814e0ae926c6be14', '1822b2'),
                                                                    (52, 'Marcin Cieślak', 'daria.zajac@gmail.com', 'e372ad6eb0b3db89b6e318f9ac1db0a661bcf34e08fc1c15f31e4e67c9293c82', '8b277f'),
                                                                    (53, 'Eliza Kubiak', 'ewa03@onet.pl', '003511bd4dcc027cbe82ed96841a0b4d04e9396c84a440ce630be24ebda17c5e', 'afd1d8'),
                                                                    (54, 'Ignacy Majewski', 'iwo29@onet.pl', '51b79d1007177e1211a7f6e08f2233932f97295aec5e8a95a30ae1b9a137cf7a', '9caecc'),
                                                                    (55, 'Stanisław Czarnecki', 'nataniel.zakrzewska@szewczyk.pl', '8b1d976e6c64a85da7b6c59c83087f157992bcc5b28207802bdb57af16fdd9e2', '22c1a2'),
                                                                    (56, 'Maksymilian Piotrowska', 'zakrzewska.nicole@wysocka.com.pl', 'c853f75ee79c14d1cc37b94c4a8f53dc79a2a6f00925499c27901207760cba7c', '9d4d08'),
                                                                    (57, 'Ryszard Wasilewska', 'blanka.mazur@yahoo.com', '5d480cc4884ceebe4edd0d358fb2395bbe398348dd355b8b3c75d5c6b0cdec8f', '2b2a99'),
                                                                    (58, 'Leonard Czerwińska', 'ada.sikorska@gmail.com', 'c3a8c05689127f57172cade439aefb4771317ceb940ae89244149c575778f5ef', '4debb1'),
                                                                    (59, 'Mateusz Nowicka', 'damian.czarnecki@pietrzak.org', '7362ae68686a4ec69f8880de0b2c965a45a526f55795b9283332a569efdb45f0', '68aace'),
                                                                    (60, 'Konrad Stępień', 'kalinowski.jacek@baran.com', 'c8ae9ea4886d3293bab0d358bf992a3a451a106b393593376c33e3c6d6c6ced2', '48883b'),
                                                                    (61, 'Julianna Błaszczyk', 'kajetan08@kowalska.pl', '93887f79e068aa90ff634f9b10093fb10ea0d7218d783889fa1f1e272b54d5c0', '2e53d9'),
                                                                    (62, 'Leon Ziółkowski', 'awasilewska@gazeta.pl', '234cf5395d80ab5ab2b672c5c207e97b321ab4288042a0c48cefc744c2555711', '2bb214'),
                                                                    (63, 'Liliana Błaszczyk', 'twieczorek@wozniak.pl', '838a31ed42f30b8cbe48c42338835e35f8ab453781bd14b66540f0a73dce1bdf', '737444'),
                                                                    (64, 'Malwina Kaczmarczyk', 'pawlak.lidia@duda.pl', '673b928a5742213c97871b4eb0ed6bb142183539a66c113f724092006dc72539', '3b53e4'),
                                                                    (65, 'Marianna Lewandowski', 'brzezinska.kornel@szulc.net', '9c9302befdb5c0ff4c7d01b0fff5741b0e5424b0542577a4bb0d1523ae6ad25e', 'ee3a16'),
                                                                    (66, 'Milena Krawczyk', 'cszymczak@jaworska.net', 'e43820cc508e61bcc2067e5d333f2c9528d0808eb1cf9b8fe6e2dbf60c674043', 'cf8f40'),
                                                                    (67, 'Maja Adamska', 'natan19@gmail.com', 'a000b2456a2b08a9463ea26901e37a33dd8be2b9c18ad679bea84aea7a67e764', '933bd3'),
                                                                    (68, 'Hanna Gajewska', 'rutkowska.sebastian@michalski.com', 'a246e9207d0034257184160bedba37dcfc17476ba3d918f4f1c966f5c98629a0', '1d59cd'),
                                                                    (69, 'Ewa Baranowska', 'adamski.cyprian@interia.pl', '5353836dc7e42eb8420875e76f8eef89bc344a36a36a222ab1934b7245892b45', '868937'),
                                                                    (70, 'Bruno Duda', 'wlodarczyk.nela@onet.pl', 'e69aef6b3025aac5e8699a8f8c1eb3b6f0253be4a841a639bc61dc2f0acf95dd', '0692e2'),
                                                                    (71, 'Mateusz Zawadzki', 'leonard.majewska@gazeta.pl', '897ef1eb6c7695e076d29e34f1910e4ee45c40b64b15129561f810e22c36e777', 'deba72'),
                                                                    (72, 'Gustaw Wróbel', 'dawid13@czarnecki.com.pl', 'bfc20d06a56e4fd7b1377cdee24467e5098020b5eb8def4cc96be367f1a219bc', '98c6c2'),
                                                                    (73, 'Kajetan Borowski', 'eryk74@onet.pl', '34f049fa71c067515ffa7b9e71d03df97a1d43c715df98be9a7d271e761c9016', 'c832b2'),
                                                                    (74, 'Arkadiusz Olszewski', 'matylda.kowalczyk@rutkowska.org', 'e378a1eae73cc8595a5e4b68758914d0ea21651df2356bdbb11a3040efff5d0c', 'fecad7'),
                                                                    (75, 'Karol Grabowski', 'maciejewska.roksana@gazeta.pl', '8602281abbca77297772272c748f2e697be98c43ab86448d05e9fe2e9b41e2c5', '0b84b7'),
                                                                    (76, 'Zofia Dąbrowski', 'weronika.gajewska@lewandowska.pl', '6689fb6ba87c862116245320016a16f6f55932bee47a71a2c45e0b66ae3b1455', 'a5b03a'),
                                                                    (77, 'Jędrzej Krawczyk', 'wysocka.andrzej@yahoo.com', '82ac138b632de5c087461e0d7e8c0a88cd13f0282900c0e611b6998174d99a98', 'c55e82'),
                                                                    (78, 'Milena Kowalski', 'dkazmierczak@gazeta.pl', '581bb6ee2811868a083700b0257beb83130e3c4a063cc0d8fd9e9fd1b9904622', 'e38800'),
                                                                    (79, 'Milena Zawadzki', 'ostrowska.kinga@czerwinska.pl', '9fbb13a44cf1f0a15e1c6d137172fd6a4e219ba9004008772e173f3ca666d73f', '843bc8'),
                                                                    (80, 'Natalia Stępień', 'sadowska.maciej@yahoo.com', '47dec57a3cf323fbfeaf813de2028ac0b832c56c2dc41792e424fe13319a1125', 'f44406'),
                                                                    (81, 'Sonia Przybylski', 'pawlak.wojciech@cieslak.info', '6f714d83a156bb1f8c6b0fc0e2086bbcc9428e38a57656758d6d7cd607b1542e', 'cc08d4'),
                                                                    (82, 'Miłosz Urbański', 'kwiatkowski.aniela@wp.pl', '31bb86051428e144326a74f9a9cb75b27eae3ece5b7bfb1012c65be031130e5e', 'd1f0fb'),
                                                                    (83, 'Tomasz Zając', 'wzawadzka@sikora.com.pl', '3ef01a5898ffb282ada754faae4c98c644a9ea5b05d2f431541e7b7200eb5084', '43b2ef'),
                                                                    (84, 'Fryderyk Stępień', 'katarzyna.nowicka@lewandowski.pl', '3ddd399bad75d0546bbbedd00e0d5ed1ce6e75eec5b0744286e5872ab6fb9ef3', 'dd7096'),
                                                                    (85, 'Kinga Bąk', 'borys.wojcik@gmail.com', '79f59f23fbb53380b516b32cdc01a16f24e04bfae3a8e9864b98d87822dc6d1e', '436508'),
                                                                    (86, 'Julia Dąbrowski', 'iwisniewska@wp.pl', 'ee8047865a6817f1681f40fadfef79b8f62c691081fc4a70b06b1ec507078640', '4cf918'),
                                                                    (87, 'Rafał Andrzejewski', 'hkrajewska@lewandowski.com.pl', '8ee4b7380037858728d97a5f2aca80016b75aac833851ab1c873882284927b5c', '8eb8ed'),
                                                                    (88, 'Filip Maciejewski', 'sonia52@gajewski.pl', '0060c621f45d9aab3ba36087ac01c1a05a1e1495053c1cbe98760ec1d72d960c', 'a31348'),
                                                                    (89, 'Alex Michalak', 'barbara.baran@onet.pl', 'fa16e4deabc8af40aab1426968b79a0d4580bdc73c93836c675b85f76e340aab', '34d9ea'),
                                                                    (90, 'Janina Zakrzewski', 'wmakowski@gazeta.pl', '667a2b0f8d0a99d7957d089a26e4a034a329302c493fffb0fb808a5c9af90e36', '11b997'),
                                                                    (91, 'Arkadiusz Nowakowska', 'pietrzak.aleks@interia.pl', 'f07c0eb4fd32ee77e745cf330ffca03acd1e4a4f90cb9c2e965ccf1dec2c2fc6', 'b7b46b'),
                                                                    (92, 'Gustaw Ostrowski', 'leon.andrzejewski@andrzejewska.pl', '47cdf71d36a9a993f9f022b64cef42e9d02eb08f7e263a3d063cf9fe1e4b7f43', 'cbace7'),
                                                                    (93, 'Angelika Krajewska', 'pawlowski.marta@krawczyk.com', '9053d207eea20dcdf5e61cdbbde42369f83847ceac2dcb3c529c1337d98904b0', '852dd4'),
                                                                    (94, 'Julia Zając', 'natasza11@interia.pl', '86f425044f674cb2b9ab2374a118716f4c7963e9a73572153403542ca83da536', '278ad2'),
                                                                    (95, 'Aleks Olszewski', 'baran.aleksandra@gmail.com', '5af2c672de78dcad805db2f1f20f771484f373373f88dfda8b4ec09840f88b23', 'dc5602'),
                                                                    (96, 'Ida Grabowski', 'mazurek.pawel@marciniak.pl', 'bcdf192fa5ffb8b56e44e096451a29e8cfd4fe073b65b0a6084c5a6abc1f7d67', 'c1f32b'),
                                                                    (97, 'Liliana Maciejewski', 'ignacy16@yahoo.com', '11a2ae70a2b9a601c4e807d84496ca8550420ec25e7e894962f0c9cc773df3cc', '712dd0'),
                                                                    (98, 'Tadeusz Zając', 'jagoda77@gazeta.pl', 'eb6a057f48ae2b3660ccac9e0b988cd6bca87f27fee93ba2ada7356a22ba47d0', '7a7689'),
                                                                    (99, 'Krzysztof Wysocka', 'rkowalczyk@gazeta.pl', '8ca79cd6460348a3b5bd43a6c72a261bf67c7db5461ba47e989591fd2979574c', '6b162a'),
                                                                    (100, 'Jacek Laskowski', 'adrianna.cieslak@urbanska.pl', '0a0a6595dce1f4530626212786ae284b0cfe95be2f163041d76534cd2db15632', 'daa11d');

INSERT INTO images ( src, dimension)
VALUES ( 'zdjecia.com/z1.jpg','700x900'),
       ('zdjecia.com/z2.jpg','700x900'),
       ('zdjecia.com/z3.jpg','700x900'),
       ('zdjecia.com/z4.jpg','700x900'),
       ('zdjecia.com/z5.jpg','700x900');
INSERT INTO users_companies (id, user_id, name, nip, street,
                             street_nr, phone, post_code, capital, rate, created_at)
VALUES (1,1,'John',123,'Main',1,'123456789','001002',12345.67,1.2345,'2001-01-01 05:00:00'),
       (2,2,'Peter',123,'Main',2,'223456789','001002',12345.67,1.2345,'2001-01-02 05:00:00'),
       (3,3,'Tom',123,'Main',3,'323456789','001002',12345.67,1.2345,'2001-01-03 05:00:00'),
       (4,4,'Frank',123,'Main',4,'423456789','001002',12345.67,1.2345,'2001-01-04 05:00:00'),
       (5,5,'Bob',123,'Main',5,'523456789','001002',12345.67,1.2345,'2001-01-05 05:00:00');




