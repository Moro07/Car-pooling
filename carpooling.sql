-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 13, 2026 alle 12:09
-- Versione del server: 10.4.6-MariaDB
-- Versione PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpooling`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autista`
--

CREATE TABLE `autista` (
  `idAutista` int(10) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `dataNascita` date NOT NULL,
  `sesso` varchar(1) NOT NULL,
  `nPatente` varchar(10) NOT NULL,
  `dataScadenza` date NOT NULL,
  `targa` varchar(10) NOT NULL,
  `modello` varchar(30) NOT NULL,
  `nTelefono` int(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `votoMedio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `autista`
--

INSERT INTO `autista` (`idAutista`, `cognome`, `nome`, `dataNascita`, `sesso`, `nPatente`, `dataScadenza`, `targa`, `modello`, `nTelefono`, `email`, `foto`, `votoMedio`) VALUES
(1, 'Rossi', 'Marco', '1985-06-12', 'M', 'AB1234567', '2030-06-12', 'AB123CD', 'Fiat 500', 2147483647, 'marco.rossi@email.it', 'rossi.jpg', 5),
(2, 'Bianchi', 'Luca', '1978-03-22', 'M', 'CD7654321', '2029-03-22', 'EF456GH', 'Volkswagen Golf', 2147483647, 'luca.bianchi@email.it', 'bianchi.jpg', 4),
(3, 'Verdi', 'Sara', '1990-11-05', 'F', 'EF9876543', '2031-11-05', 'IJ789KL', 'Toyota Yaris', 2147483647, 'sara.verdi@email.it', 'verdi.jpg', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `feedbackaut`
--

CREATE TABLE `feedbackaut` (
  `idFeedback` int(10) NOT NULL,
  `voto` int(10) NOT NULL,
  `recensione` varchar(60) NOT NULL,
  `idAutista` int(10) NOT NULL,
  `idPasseggero` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `feedbackaut`
--

INSERT INTO `feedbackaut` (`idFeedback`, `voto`, `recensione`, `idAutista`, `idPasseggero`) VALUES
(1, 5, 'Viaggio perfetto', 1, 1),
(2, 4, 'Autista puntuale', 1, 2),
(3, 5, 'Molto professionale', 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `feedbackpas`
--

CREATE TABLE `feedbackpas` (
  `idFeedback` int(10) NOT NULL,
  `voto` int(10) NOT NULL,
  `recensione` varchar(60) NOT NULL,
  `idPasseggero` int(10) NOT NULL,
  `idAutista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `feedbackpas`
--

INSERT INTO `feedbackpas` (`idFeedback`, `voto`, `recensione`, `idPasseggero`, `idAutista`) VALUES
(1, 5, 'Passeggero puntuale', 1, 1),
(2, 4, 'Cordiale e preciso', 2, 1),
(3, 3, 'Un po\' in ritardo', 3, 1),
(4, 5, 'Ottima compagnia', 4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `idPasseggero` int(11) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `nDocumento` varchar(20) NOT NULL,
  `nTelefono` int(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `votoMedio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`idPasseggero`, `cognome`, `nome`, `nDocumento`, `nTelefono`, `email`, `votoMedio`) VALUES
(1, 'Neri', 'Giulia', 'AX12345', 2147483647, 'giulia.neri@email.it', 5),
(2, 'Romano', 'Paolo', 'BX54321', 2147483647, 'paolo.romano@email.it', 4),
(3, 'Gallo', 'Francesca', 'CX98765', 2147483647, 'francesca.gallo@email.it', 3),
(4, 'Conti', 'Alessio', 'DX45678', 2147483647, 'alessio.conti@email.it', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `idRichiesta` int(10) NOT NULL,
  `idPasseggero` int(10) NOT NULL,
  `idViaggio` int(10) NOT NULL,
  `accettata` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`idRichiesta`, `idPasseggero`, `idViaggio`, `accettata`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 0),
(4, 4, 2, 1),
(5, 1, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `idViaggio` int(10) NOT NULL,
  `cittaPartenza` varchar(30) NOT NULL,
  `cittaDestinazione` varchar(30) NOT NULL,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `contributoEconomico` int(10) NOT NULL,
  `tempoStimato` time NOT NULL,
  `prenotazioniAperte` tinyint(1) NOT NULL DEFAULT 1,
  `opzioni` varchar(50) NOT NULL,
  `idAutista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`idViaggio`, `cittaPartenza`, `cittaDestinazione`, `data`, `ora`, `contributoEconomico`, `tempoStimato`, `prenotazioniAperte`, `opzioni`, `idAutista`) VALUES
(1, 'Milano', 'Roma', '2026-03-15', '08:00:00', 30, '06:00:00', 1, 'No fumo, bagaglio incluso', 1),
(2, 'Milano', 'Roma', '2026-03-15', '14:00:00', 25, '06:30:00', 1, 'Animali ammessi', 2),
(3, 'Milano', 'Torino', '2026-03-15', '09:00:00', 15, '01:30:00', 1, 'No animali', 3),
(4, 'Milano', 'Roma', '2026-03-10', '10:00:00', 35, '06:00:00', 0, 'Comfort', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autista`
--
ALTER TABLE `autista`
  ADD PRIMARY KEY (`idAutista`);

--
-- Indici per le tabelle `feedbackaut`
--
ALTER TABLE `feedbackaut`
  ADD PRIMARY KEY (`idFeedback`),
  ADD KEY `feedbacka_ibfk_1` (`idAutista`),
  ADD KEY `feedbacka_ibfk_2` (`idPasseggero`);

--
-- Indici per le tabelle `feedbackpas`
--
ALTER TABLE `feedbackpas`
  ADD PRIMARY KEY (`idFeedback`),
  ADD KEY `feedbackp_ibfk_1` (`idAutista`),
  ADD KEY `feedbackp_ibfk_2` (`idPasseggero`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`idPasseggero`);

--
-- Indici per le tabelle `richiesta`
--
ALTER TABLE `richiesta`
  ADD PRIMARY KEY (`idRichiesta`),
  ADD KEY `richiesta_ibfk_1` (`idPasseggero`),
  ADD KEY `richiesta_ibfk_2` (`idViaggio`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`idViaggio`),
  ADD KEY `viaggio_ibfk_1` (`idAutista`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autista`
--
ALTER TABLE `autista`
  MODIFY `idAutista` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `feedbackaut`
--
ALTER TABLE `feedbackaut`
  MODIFY `idFeedback` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `feedbackpas`
--
ALTER TABLE `feedbackpas`
  MODIFY `idFeedback` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `passeggero`
--
ALTER TABLE `passeggero`
  MODIFY `idPasseggero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `idRichiesta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  MODIFY `idViaggio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `feedbackaut`
--
ALTER TABLE `feedbackaut`
  ADD CONSTRAINT `feedbacka_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`),
  ADD CONSTRAINT `feedbacka_ibfk_2` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`);

--
-- Limiti per la tabella `feedbackpas`
--
ALTER TABLE `feedbackpas`
  ADD CONSTRAINT `feedbackp_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`),
  ADD CONSTRAINT `feedbackp_ibfk_2` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`);

--
-- Limiti per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  ADD CONSTRAINT `richiesta_ibfk_1` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`),
  ADD CONSTRAINT `richiesta_ibfk_2` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

--
-- Limiti per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
