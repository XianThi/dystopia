<?php
class ProfileController extends ControllerBase
{
     public function indexAction()
    {
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
    return $this->response->redirect("homepage/profile/$userid");
        }
    
    }