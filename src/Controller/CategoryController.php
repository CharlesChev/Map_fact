<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Category;


class CategoryController extends AbstractController
{   
    /**
     * @Route("/category/{id}", name="one_category", methods={"GET","POST"}, requirements={"id"="\d+"})
     */
    public function showOneCategory(int $id):Response
    {
        $category = $this->getDoctrine()
            ->getRepository(Category::class)
            ->find($id);

        if (!$category){
             //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $name = $category->getName();
            $abstract = $category->getAbstract();
            $picture = $category->getPicture();
            $type = $category->getType();

            $arr = [];

            $arr["id"] = $id;
            $arr["name"] = $name;
            $arr["abstract"] = $abstract;
            $arr["picture"] = $picture;
            $arr["type"] = $type;
            
            return $this->json($arr);
        }
    }

    /**
     * @Route("/categories", name="categories")
     */
    public function showCategories():Response
    {
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findAll();
        
        if (!$categories){
             //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $arr = [];
            foreach ($categories as $cats){
                $id = $cats->getId();
                $name = $cats->getName();
                $abstract = $cats->getAbstract();
                $picture = $cats->getPicture();
                $type = $cats->getType();

                $arr[$id] = [ "name" => $name, "abstract" => $abstract, "picture" => $picture, "type" => $type];
                
            }
            return $this->json($arr);
        }

    }

    /**
     * @Route("/categories/limit/{nb}", name ="categories_limit", methods={"GET"}, requirements={"nb"="\d+"} )
     */
    public function selectAllWithLimits(int $nb = 4): Response
    {
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findNbLimit($nb);

        if (!$categories){
             //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $arr = [];
            foreach ($categories as $cats){
                $id = $cats->getId();
                $name = $cats->getName();
                $abstract = $cats->getAbstract();
                $picture = $cats->getPicture();
                $type = $cats->getType();

                $arr[$id] = [ "name" => $name, "abstract" => $abstract, "picture" => $picture, 'type' => $type];
            }  
            return $this->json($arr);
        }
    }

     /**
     * @Route("/category/allmaps/{catName}", name ="category_maps", methods={"GET","POST"}, requirements={"nb"="\d+"} )
     */
    public function allmapfrom($catName): Response
    {
        $category = $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findOneBy(['name'=>$catName]);
        
        if (!$category){
            //todo! gérer exeptions ET/OU if !category comme erreur 404 voir article principal sur le controlleur
            return $this->render('base.html.twig',['err'=>"erreur 404 frere"]);
        }else{
            $maps = $category->getMap();
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