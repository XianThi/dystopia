<?php
class SettingsController extends ControllerBase
{     
    
    public function indexAction()
    {
    return $this->forward("homepage/settings/");
        }
    
    
    }