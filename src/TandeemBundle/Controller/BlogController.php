<?php

namespace TandeemBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use EntityBundle\Entity\Posts;
use EntityBundle\Entity\Comments;
use EntityBundle\Entity\User;

class BlogController extends Controller
{
    public function indexAction()
    {

      $posts = $this->getDoctrine()
      ->getRepository('EntityBundle:Posts')
      ->findby(array(), array('id' => 'desc'));

      $comments = $this->getDoctrine()
      ->getRepository('EntityBundle:Comments')
      ->findby(array(), array('id' => 'asc'));

      if(empty($comments)){
        return $this->render('TandeemBundle:Blog:index.html.twig', array("posts"=> $posts));
      }else{
        return $this->render('TandeemBundle:Blog:index.html.twig', array("posts"=> $posts, "comments"=> $comments));
      }

    }

    public function showUserAction()
    {
      $users = $this->getDoctrine()
        ->getRepository('EntityBundle:User')
        ->findby(array(), array('id' => 'desc'));

        return $this->render('TandeemBundle:Blog:User.html.twig', array("users"=>$users));
    }

    public function deleteUserAction(Request $infos)
    {
      $id = $infos->get("id");
      $em = $this->getDoctrine()->getManager();
      $delete = $em->find('EntityBundle:User', $id);
      $em->remove($delete);
      $em->flush();

      $jsondelete = json_encode(Array("id"=>$id));

      return new Response($jsondelete);
    }
}
