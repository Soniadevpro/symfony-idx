<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DefaultController extends AbstractController
{

    public function home(): Response
    {
       return $this->render('default/home.html.twig');
        // return new Response('Hello World');
    }

    # https://localhost:8000/categorie/politique
    #[Route('/categorie/{slug}', name: 'default_category', methods: ['GET'])]
    public function category($slug): Response
    {
        return new Response('Categorie : '. $slug);
    }

    # https://localhost:8000/politique/mon-super-article_42.html
    #[Route('/{category}/{slug}_{id}.html', name: 'default_post', methods: ['GET'])]
    public function post($id, $category, $slug): Response
    {
        return new Response('Post : '. $id . ' - ' . $category . ' - ' . $slug);
    }


    #[Route("/connexion", name:"app_connexion")]
    public function connexion(): Response
    {
       return $this->render('default/connexion.html.twig');
        
    }
    #[Route("/inscription", name:"app_inscription")]
    public function inscription(): Response
    {
       return $this->render('default/inscription.html.twig');
        
    }
    public function article(): Response
    {
       return $this->render('default/article.html.twig');
        
    }

}