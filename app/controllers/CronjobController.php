<?php
class CronjobController extends ControllerBase
{
public function initialize(){
      parent::initialize();
    }
public function HourlyAction(){
$functions=new Functions();
$energy=$functions->energy_cron();
$work=$functions->work_cron();
$clear=$functions->clear_cron();
}



public function RiskAction(){
    
}


}

?>