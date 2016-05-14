<?php

namespace TandeemBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('TandeemBundle:Default:index.html.twig');
    }
}
