<?php

namespace Model;

use Util\Connection;

class FeedbackpasRepository{

    public static function listAll(){
        $pdo = Connection::getInstance();
        $risposta = $pdo->query("SELECT * FROM feedbackpas");
        return $risposta->fetchAll();
    }


    public static function add(array $data){
        $pdo = Connection::getInstance();
        $risposta = $pdo->prepare('INSERT INTO prodotto (nome, descrizione,prezzo, genere, image) VALUES (:nome, :descrizione, :prezzo, :genere, :image)');
        $risposta->execute([
                'nome' => $data['nome'],
                'descrizione' => $data['descrizione'],
                'prezzo' => $data['prezzo'],
                'genere' => $data['genere'],
                'image' => $data['image']
            ]
        );
    }

    public static function update(int $id, array $data){
        $pdo = Connection::getInstance();
        $risposta = $pdo->prepare('UPDATE prodotto SET nome = :nome, descrizione = :descrizione, prezzo = :prezzo, genere = :genere, image = :image WHERE id = :id');
        $risposta->execute([
                'id' => $id,
                'nome' => $data['nome'],
                'descrizione' => $data['descrizione'],
                'prezzo' => $data['prezzo'],
                'genere' => $data['genere'],
                'image' => $data['image']
            ]
        );
    }

    public static function delete(int $id){
        $pdo = Connection::getInstance();
        $risposta = $pdo->prepare('DELETE FROM prodotto WHERE id = :id');
        $risposta->execute([
                'id' => $id
            ]
        );
    }

    public static function getProdotto(int $id)
    {
        $pdo = Connection::getInstance();
        $risposta = $pdo->prepare('SELECT * FROM prodotto WHERE id = :id');
        $risposta->execute([
            'id' => $id
        ]);
        return $risposta->fetch();
    }

}