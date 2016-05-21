<?php

namespace TandeemBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
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
}
