<?php

namespace TandeemBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use EntityBundle\Entity\Posts;
use EntityBundle\Entity\User;

class PostsController extends Controller
{
  public function indexAction()
  {
    return $this->render('TandeemBundle:Blog:CreatePosts.html.twig');
  }

  public function showAction()
  {
    $posts = $this->getDoctrine()
    ->getRepository('EntityBundle:Posts')
    ->findby(array(), array('id' => 'desc'));

    return $this->render('TandeemBundle:Blog:ShowPosts.html.twig', array("posts"=> $posts));
  }

  public function createAction(Request $infos)
  {
    $post = new Posts();

    $title = $infos->get("title");
    $description = $infos->get("description");
    $post->setDate(new \DateTime(date('Y-m-d H:i:s')));

    $post->setTitle($title);
    $post->setDescription($description);

    $em = $this->getDoctrine()->getManager();
     $em->persist($post);
     $em->flush();


      $json = json_encode(Array("day" => $post->getDate()->format('Y-m-d H:i:s'),
          "content" => $post->getDescription(),
          "title" => $post->getTitle(),
          "id" => $post->getId()
      ));

      return new Response($json);
  }

  public function deleteAction(Request $infos)
  {
    $id = $infos->get("id");
    $em = $this->getDoctrine()->getManager();
    $delete = $em->find('EntityBundle:Posts', $id);
    $em->remove($delete);
    $em->flush();

    $jsondelete = json_encode(Array("id"=>$id));

    return new Response($jsondelete);
  }

}
