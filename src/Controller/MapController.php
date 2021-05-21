<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Map;
use App\Entity\Category;

class MapController extends AbstractController
{
    /**
     * @Route("/random", name="random_map", methods={"GET","POST"})
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
        $mapPath = $map->getMapPath();
        $sources = $map->getSources();

        $arr=['title'=>$title, 'description'=>$description, 'mapPath'=>$mapPath, 'sources'=>$sources];
        
        return $this->json($arr);
    }

    /**
     * @Route("/two_random", name="two_random_map", methods={"GET","POST"})
     */
    public function twoRandomMap(): Response
    {
        $nbmap = $this->getDoctrine()
            ->getRepository(Map::class)
            ->countMap();

        $nbMapTotal = $nbmap[0]["1"]; 
        
        $id_first_map = rand(1, $nbMapTotal);
        $id_sec_map = $id_first_map;

        while ($id_sec_map == $id_first_map){
            $id_sec_map = rand(1,$nbMapTotal);
        }

        $first_map = $this->getDoctrine()
        ->getRepository(Map::class)
        -> findOneBy(['id'=>$id_first_map]);

        $sec_map = $this->getDoctrine()
        ->getRepository(Map::class)
        -> findOneBy(['id'=>$id_sec_map]);

        $arr=[];

        $first_map_title = $first_map->getTitle();
        $first_map_description = $first_map->getDescription();
        $first_map_path = $first_map->getMapPath();
        $first_map_sources = $first_map->getSources();

        $sec_map_title = $sec_map->getTitle();
        $sec_map_description = $sec_map->getDescription();
        $sec_map_path = $sec_map->getMapPath();
        $sec_map_sources = $sec_map->getSources();

        $arr[0]=['title'=>$first_map_title, 'description'=>$first_map_description, 'mapPath'=>$first_map_path, 'sources'=>$first_map_sources];
        $arr[1]=['title'=>$sec_map_title, 'description'=>$sec_map_description, 'mapPath'=>$sec_map_path, 'sources'=>$sec_map_sources];

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

    /**
     * @Route("/maps/cat/{catName}/{nb}", name ="maps_cat_limit", methods={"GET","POST"}, requirements={"nb"="\d+"})
     */
    public function selectLimitByCategory(string $catName = 'France' , int $nb = 4 ): Response
    {   
        $category = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findOneBy(['name'=>$catName]);

        if(!$category){
            //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $arr = [];
            $maps =  $category->getMap();
            for ($i = 0; $i<$nb; $i++){
                $id = $maps[$i]->getId();
                $title = $maps[$i]->getTitle();
                $description = $maps[$i]->getDescription();
                $mapPath = $maps[$i]->getMapPath();
                $sources = $maps[$i]->getSources();

                $arr[$id] = [ "title" => $title, "description" => $description, "mapPath" => $mapPath, 'sources' => $sources];
            }  
            return $this->json($arr);
        }
    }

    /**
     * @Route("/map/cat/{catName}", name ="one_random_map_by_cat", methods={"GET","POST"})
     */
    public function selectOneByCategory(string $catName = 'France'): Response
    {   
        $category = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findOneBy(['name'=>$catName]);

        if(!$category){
            //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $arr = [];
            $maps =  $category->getMap();
            $nbMaps = count($maps);
            $index = rand(1, $nbMaps);
           
            $title = $maps[$index]->getTitle();
            $description = $maps[$index]->getDescription();
            $mapPath = $maps[$index]->getMapPath();
            $sources = $maps[$index]->getSources();
            
            $arr=['title'=>$title, 'description'=>$description, 'map_path'=>$mapPath, 'sources'=>$sources];
            return $this->json($arr);
        }
    }
}