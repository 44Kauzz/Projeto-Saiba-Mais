-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema saibamais
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saibamais
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saibamais` DEFAULT CHARACTER SET utf8 ;
USE `saibamais` ;

-- -----------------------------------------------------
-- Table `saibamais`.`prontuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`prontuarios` (
  `idprontuarios` INT NOT NULL,
  `prontuarioscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idprontuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`pacientes` (
  `idpacientes` INT NOT NULL AUTO_INCREMENT,
  `cartao sus` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `sexo` ENUM("M", "F") NOT NULL,
  `nascimento` DATE NOT NULL,
  `telefone` VARCHAR(30) NOT NULL,
  `prontuarios_idprontuarios` INT NOT NULL,
  PRIMARY KEY (`idpacientes`),
  INDEX `fk_pacientes_prontuarios1_idx` (`prontuarios_idprontuarios` ASC) VISIBLE,
  CONSTRAINT `fk_pacientes_prontuarios1`
    FOREIGN KEY (`prontuarios_idprontuarios`)
    REFERENCES `saibamais`.`prontuarios` (`idprontuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`profissionais` (
  `idprofissionais` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `sexo` ENUM("M", "F") NOT NULL,
  `nascimento` DATE NOT NULL,
  `cpf` BIGINT(11) NOT NULL,
  `rg` BIGINT(8) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprofissionais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`medicos` (
  `idmedicos` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `sexo` ENUM("M", "F") GENERATED ALWAYS AS () VIRTUAL,
  `nascimento` DATE NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  `especializacao` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idmedicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`unidades` (
  `idunidades` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` TINYTEXT NOT NULL,
  `funcionamento` VARCHAR(15) NOT NULL,
  `profissionais_idprofissionais` INT NOT NULL,
  `medicos_idmedicos` INT NOT NULL,
  `prontuarios_idprontuarios` INT NOT NULL,
  PRIMARY KEY (`idunidades`),
  INDEX `fk_unidades_profissionais1_idx` (`profissionais_idprofissionais` ASC) VISIBLE,
  INDEX `fk_unidades_medicos1_idx` (`medicos_idmedicos` ASC) VISIBLE,
  INDEX `fk_unidades_prontuarios1_idx` (`prontuarios_idprontuarios` ASC) VISIBLE,
  CONSTRAINT `fk_unidades_profissionais1`
    FOREIGN KEY (`profissionais_idprofissionais`)
    REFERENCES `saibamais`.`profissionais` (`idprofissionais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidades_medicos1`
    FOREIGN KEY (`medicos_idmedicos`)
    REFERENCES `saibamais`.`medicos` (`idmedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidades_prontuarios1`
    FOREIGN KEY (`prontuarios_idprontuarios`)
    REFERENCES `saibamais`.`prontuarios` (`idprontuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`triagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`triagem` (
  `idtriagem` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `gravidade` ENUM("Leve", "Grave", "Urgente") NOT NULL,
  PRIMARY KEY (`idtriagem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saibamais`.`agendamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saibamais`.`agendamentos` (
  `idagendamentos` INT NOT NULL AUTO_INCREMENT,
  `pacientes_idpacientes` INT NOT NULL,
  `data` DATE NOT NULL,
  `triagem_idtriagem` INT NOT NULL,
  `descricao` TINYTEXT NULL,
  `unidades_idunidades` INT NOT NULL,
  PRIMARY KEY (`idagendamentos`),
  INDEX `fk_agendamentos_pacientes_idx` (`pacientes_idpacientes` ASC) VISIBLE,
  INDEX `fk_agendamentos_unidades1_idx` (`unidades_idunidades` ASC) VISIBLE,
  INDEX `fk_agendamentos_triagem1_idx` (`triagem_idtriagem` ASC) VISIBLE,
  CONSTRAINT `fk_agendamentos_pacientes`
    FOREIGN KEY (`pacientes_idpacientes`)
    REFERENCES `saibamais`.`pacientes` (`idpacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamentos_unidades1`
    FOREIGN KEY (`unidades_idunidades`)
    REFERENCES `saibamais`.`unidades` (`idunidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamentos_triagem1`
    FOREIGN KEY (`triagem_idtriagem`)
    REFERENCES `saibamais`.`triagem` (`idtriagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `saibamais`.`pacientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`pacientes` (`idpacientes`, `cartao sus`, `nome`, `sexo`, `nascimento`, `telefone`, `prontuarios_idprontuarios`) VALUES (1, '123-4567-8910-1112', 'Hiago Simplicio das Neves', 'M', '2002-10-20', '(81) 9 8987-6556', DEFAULT);
INSERT INTO `saibamais`.`pacientes` (`idpacientes`, `cartao sus`, `nome`, `sexo`, `nascimento`, `telefone`, `prontuarios_idprontuarios`) VALUES (2, '121-1109-8765-4321', 'Thiago Roberto da Silva', 'M', '2003-05-21', '(81) 9 8765-4123', DEFAULT);
INSERT INTO `saibamais`.`pacientes` (`idpacientes`, `cartao sus`, `nome`, `sexo`, `nascimento`, `telefone`, `prontuarios_idprontuarios`) VALUES (3, '123-4567-8911-1210', 'Kauã Bernado Pinheiro', 'M', '1999-01-15', '(81) 9 7890-6543', DEFAULT);
INSERT INTO `saibamais`.`pacientes` (`idpacientes`, `cartao sus`, `nome`, `sexo`, `nascimento`, `telefone`, `prontuarios_idprontuarios`) VALUES (4, '987-6543-2110-1112', 'Lucas Vinicius Alves dos Santos', 'M', '2005-12-20', '(81) 9 7324-3333', DEFAULT);
INSERT INTO `saibamais`.`pacientes` (`idpacientes`, `cartao sus`, `nome`, `sexo`, `nascimento`, `telefone`, `prontuarios_idprontuarios`) VALUES (5, '098-7654-3210-1112', 'Maria Clara da Neves', 'F', '1998-03-25', '(81) 9 7654-3211', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `saibamais`.`profissionais`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (200, 'Andreza Paloma da Silva', 'F', '2007-02-12', 12345678923, 20123404, '(81) 9 9876-6789');
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (201, 'Andreia Marques das Neves', 'F', '1999-08-15', 09876543212, 12345678, '(81) 9 0987-7890');
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (203, 'Marcos Tulío Morais', 'M', '1997-09-10', 98765432110, 87654321, '(81) 9 1234-7654');
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (204, 'Severina Ramos dos Santos', 'F', '1990-05-04', 09087635412, 09876543, '(81) 9 7685-9403');
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (205, 'Rójerio António de Moras', 'M', '2000-12-20', 10293847562, 98765432, '(81) 9 2134-4576');
INSERT INTO `saibamais`.`profissionais` (`idprofissionais`, `nome`, `sexo`, `nascimento`, `cpf`, `rg`, `telefone`) VALUES (206, 'Clécia Edjane Aparecida', 'F', '2005-10-10', 01293874543, 12098765, '(81) 9 2165-7890');

COMMIT;


-- -----------------------------------------------------
-- Data for table `saibamais`.`medicos`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (1, 'Jonas Perereira Da Silva', 'M', '1999-10-21', 'CRM-PE 102345', 'Cirurgião-Dentista');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (2, 'Jailson Mendes Dos Santos', 'M', '2000-11-20', 'CRM-PE 114578', 'Patologia Clínica / Medicina Laboratorial');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (3, 'Elenilson Rodrigues De Melo', 'M', '1998-09-23', 'CRM-PE 125690', 'Pediatria');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (4, 'Aline Maria de Fatima ', 'F', '1999-07-10', 'CRM-PE 137842', 'Medicina de Família e Comunidade');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (5, 'Rochele de Oliveira Vigilio', 'F', '1990-05-12', 'CRM-PE 229875', 'Infectologia');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (6, 'Antonio de Alencar', 'M', '1989-05-05', 'CRM-PE 205678', 'Ginecologia e Obstetrícia');
INSERT INTO `saibamais`.`medicos` (`idmedicos`, `nome`, `sexo`, `nascimento`, `crm`, `especializacao`) VALUES (7, 'Haniele Oliveira Aparecida', 'F', '1997-03-23', 'CRM-PE 289760', 'Clínica Médica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `saibamais`.`unidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (1, 'USF Tabatinga', 'R. José Arnóbio, 10 | Loteamento Cortegada | Igarassu | PE', '08:00 às 16:00', 201, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (2, 'USF Do Monta', 'R. Severino Valdevino de Almeida, 10 | Loteamento Monta | Igarassu | PE', '08:00 às 16:00', 200, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (3, 'USF Jerônimo Cavalcante Júnior', 'Av. Alfredo Cordeiro, s/n | Nova Cruz | Igarassu | PE', '08:00 às 16:00', 202, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (4, 'USF São Marcos', 'R. Orlando Uchoa, 653 | Loteamento São Marcos | Igarassu | PE', '08:00 às 16:00', 203, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (5, 'USF Redenção', 'R. Luminasa, 44 | Vila Ebenezer | Igarassu | PE', '08:00 às 16:00', 204, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (6, 'USF Bela Vista', 'Av. Alfredo Bandeira de Melo, 565 | Centro | Igarassu | PE', '08:00 às 16:00', , DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (7, 'USF Taêpe', 'R. Rubens Martins Berta, s/n | Taêpe | Igarassu | PE', '08:00 às 16:00', 200, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (8, 'USF Manancial', 'R. Manancial, s/n | Centro | Igarassu | PE', '08:00 às 16:00', 201, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (9, 'USF Lote Nossa Senhora da Conceição', 'R. Azulão, 18 (Lot. N. Sra. da Conceição) | Lot. N. Sra. da Conceição | Igarassu | PE', '08:00 às 16:00', 202, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (10, 'USF Nova Cruz II', 'R. João Santos Filho, s/n | Nova Cruz II | Igarassu | PE', '08:00 às 16:00', 204, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (11, 'USF Santo Antônio', 'R. Ouricuri, 73 (ou s/n em cadastros) | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', 203, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (12, 'USF Encanto Igarassu', 'R. Fim de Semana, 3 | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (13, 'USF Pirajuí e Engenho Novo', 'Sitio Engenho Novo, s/n | Nova Cruz II / Pirajuí | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (14, 'USF Sítio Boa Vista', 'Entrada da Uina / R. Estrela do Norte, s/n | Sítio Boa Vista | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (15, 'USF Inhama', 'Sitio Inhama / Alameda Inhama, s/n | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (16, 'USF Santa Cruz I', 'R. São José (ou R. Alcântara em alguns cadastros), s/n | Bom Retiro / Santa Cruz | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (17, 'USF Sítio Líra', 'R. Alfredo Vieira (ex.: R. Alfredo Vieira de Melo, 209) | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (18, 'USF Agamenon Magalhães II', 'Estrada do Monjope, 473 | Lot. Agamenon | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (19, 'USF Magda Costa', 'R. Tenente Pedro Galvão, 158 | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (20, 'USF Boa Esperança', 'R. Bonfim / R. Ministro César Jarles, s/n | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (21, 'USF Agamenon Magalhães I', 'R. Líbia, s/n | Lot. Agamenon | Igarassu | PE', '08:00 às 16:00', 1, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (22, 'USF Boa Sorte', 'R. Adélia Rodrigues, 18 | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', 5, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (23, 'USF Beira Mar I', 'R. Eudes Francisco da Silva, 114 | Centro | Igarassu | PE', '08:00 às 16:00', 3, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (24, 'USF Alto do Céu', 'R. Ponta Grossa / R. Poços de Caldas, s/n | Vila Rural / Alto do Céu | Igarassu | PE', '08:00 às 16:00', 2, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (25, 'USF Ana Albuquerque', 'R. Rio de Janeiro, 37 | Cruz de Rebouças / Lot. Ana Albuquerque | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (26, 'USF Três Ladeiras', 'R. Santa Cruz, s/n | Três Ladeiras | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (27, 'USF Nossa Senhora de Fátima', 'R. Jatobá, s/n (cadastrado como ESF N. Sra. de Fátima) | Cruz de Rebouças | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (28, 'USF Beira Mar II', 'Av. Beira Mar II, 27 (ou 70 em alguns cadastros) | Centro | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `saibamais`.`unidades` (`idunidades`, `nome`, `endereco`, `funcionamento`, `profissionais_idprofissionais`, `medicos_idmedicos`, `prontuarios_idprontuarios`) VALUES (29, 'ESF Severino Felipe de Andrade (Cap Felipe)', 'R. Amaraji, s/n | Cruz de Rebouças / Centro | Igarassu | PE', '08:00 às 16:00', DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `saibamais`.`triagem`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Leve');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Leve');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Urgente');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Grave');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Grave');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Grave');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Leve');
INSERT INTO `saibamais`.`triagem` (`idtriagem`, `tipo`, `gravidade`) VALUES (DEFAULT, NULL, 'Leve');

COMMIT;


-- -----------------------------------------------------
-- Data for table `saibamais`.`agendamentos`
-- -----------------------------------------------------
START TRANSACTION;
USE `saibamais`;
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (100, 1, '2025-11-15', DEFAULT, NULL, 2);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (101, 1, '2025-11-18', DEFAULT, NULL, 2);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (102, 2, '2025-11-20', DEFAULT, NULL, 3);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (103, 4, '2025-11-25', DEFAULT, NULL, 4);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (105, 3, '2025-12-01', DEFAULT, NULL, 5);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (106, 5, '2025-12-04', DEFAULT, NULL, 7);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (107, 3, '2025-12-07', DEFAULT, NULL, 5);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (108, 3, '2025-11-17', DEFAULT, NULL, 5);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (109, 2, '2025-11-27', DEFAULT, NULL, 3);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (110, 4, '2025-11-20', DEFAULT, NULL, 4);
INSERT INTO `saibamais`.`agendamentos` (`idagendamentos`, `pacientes_idpacientes`, `data`, `triagem_idtriagem`, `descricao`, `unidades_idunidades`) VALUES (111, 2, '2025-11-20', DEFAULT, NULL, 3);

COMMIT;

