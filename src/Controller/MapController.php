<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Map;

class MapController extends AbstractController
{
    /**
     * @Route("/randomMap", name="random_map", methods={"GET","POST"})
     */
    public function oneRandomMap(): Response
    {
        $nbmap = $this->getDoctrine()
            ->getRepository(Map::class)
            ->countMap();

        $nbMapMax = $nbmap[0]["1"]; 
        
        $id = rand(1, $nbMapMax);

        $map = $this->getDoctrine()
        ->getRepository(Map::class)
        -> findOneBy(['id'=>$id]);

        $arr=[];

        $title = $map->getTitle();
        $description = $map->getDescription();
        $map_path = $map->getMapPath();
        $sources = $map->getSources();

        $arr=['title'=>$title, 'description'=>$description, 'map_path'=>$map_path, 'sources'=>$sources];
        
        return $this->json($arr);
    }

    /**
     * @Route("/maps/limit/{nb}", name ="maps_limit", methods={"GET","POST"}, requirements={"nb"="\d+"} )
     */
    public function selectAllWithLimits(int $nb = 4): Response
    {
        $maps = $this->getDoctrine()
            ->getRepository(Map::class)
            ->findNbLimit($nb);

        if (!$maps){
             //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $arr = [];
            foreach ($maps as $map){
                $id = $map->getId();
                $title = $map->getTitle();
                $description = $map->getDescription();
                $mapPath = $map->getMapPath();
                $sources = $map->getSources();

                $arr[$id] = [ "title" => $title, "description" => $description, "mapPath" => $mapPath, 'sources' => $sources];
            }  
            return $this->json($arr);
        }
    }
}