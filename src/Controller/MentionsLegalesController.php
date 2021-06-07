<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MentionsLegalesController extends AbstractController
{

    /**
    * @Route("/mentions", name="mentions")
    */
    public function mentionsLegales():Response
    {
        return $this->render('mentionsLegales.html.twig');
    }


}