<?php

namespace TandeemBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use EntityBundle\Entity\Posts;
use EntityBundle\Entity\Comments;
use EntityBundle\Entity\User;

class CommentsController extends Controller
{


  public function createCommentsAction(Request $infos)
  {

    $comment = new Comments();

    $content = $infos->get("content");
    $idPost = $infos->get("idPost");

    $currentPost = $this->getDoctrine()
            ->getRepository('EntityBundle:Posts')
            ->findOneById($idPost);


    $comment->setContent($content);
    $comment->setPosts($currentPost);
    $comment->setUser($this->getUser());

    $em = $this->getDoctrine()->getManager();
     $em->persist($comment);
     $em->flush();

     $json = json_encode(Array(
          "user" => $comment->getUser()->getUsername(),
          "content" => $comment->getContent(),
          "id" => $comment->getId()
      ));

      return new Response($json);

  }


  public function deleteAction(Request $infos)
  {
    $id = $infos->get("id");
    $em = $this->getDoctrine()->getManager();
    $delete = $em->find('EntityBundle:Comments', $id);
    $em->remove($delete);
    $em->flush();

    $jsondelete = json_encode(Array("id"=>$id));

    return new Response($jsondelete);
  }

}
