<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;



class SpaController extends AbstractController
{

    /**
    * @Route("/", name="spa")
    */
    public function spa():Response
    {
        return $this->render('spa.html.twig');
    }
    
}