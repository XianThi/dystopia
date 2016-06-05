<?php
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Users extends Phalcon\Mvc\Model
{

    public function validation()
    {
        $this->validate(new EmailValidator(array(
            'field' => 'email'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => 'This mail already use.'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => 'This username already taken.'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
    
public function total_user($zone){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM users where zones=$zone";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

}
