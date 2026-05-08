<?php

namespace Controller;

use Model\FeedbackpasRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class FeedbackpasController
{

    private $container;

    // constructor receives container instance
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }



    public function listAll(Request $request, Response $response, array $args): Response
    {
        $engine = $this->container->get('template');
        $feedbacks =  FeedbackpasRepository::listAll();
        $response->getBody()->write($engine->render('idFeedbackPas',
            [
                'idFeedbackPas' => $feedbacks
            ]
        ));
        return $response;
    }

    public function showProdotto(Request $request, Response $response, array $args): Response
    {
        $engine = $this->container->get('template');
        $prodotto = ProdottoRepository::getProdotto($args['id']);
        $response->getBody()->write($engine->render('prodotto',
            [
                'prodotto' => $prodotto,

            ]
        ));
        return $response;
    }

}