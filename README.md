# Car-pooling

## 1° query:
```
SELECT a.nome, a.targa, a.modello, v.contributoEconomico
FROM autista a, viaggio v
WHERE a.idAutista = v.idAutista 
AND v.cittaPartenza = "Milano"
AND v.cittaDestinazione = "Roma"
AND v.data = "2026-03-15"
AND v.prenotazioniAperte != 0
```

## 2° query:
```
SELECT v.cittaPartenza, v.cittaDestinazione, v.data, v.ora, a.nome, a.cognome, a.targa, a.modello
FROM richiesta r, viaggio v, autista a
WHERE a.idAutista = v.idAutista 
AND r.idViaggio = v.idViaggio
AND r.idRichiesta = 1
```

## 3° query:
```
SELECT p.nome, p.cognome, f.recensione, f.voto
FROM viaggio v, autista a, passeggero p, richiesta r, feedbackpas f
WHERE a.idAutista = v.idAutista 
AND r.idViaggio = v.idViaggio
AND p.idPasseggero = r.idPasseggero
AND f.idPasseggero = p.idPasseggero
AND v.idViaggio = 1
```
