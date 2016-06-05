<?php
use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class seminerler extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $id;
    
         /**
     * @var string
     */
     public $seminer_adi;
        /**
     * @var integer
     */
    public $kisi_sayisi;
        /**
     * @var stirng
     */
   public $seminer_turu;
    /**
     * @var string
     */
    public $seminer_tarihi;
       /**
     * @var string
     */
     public $seminer_saati;
        /**
     * @var string
     */
      public $yer;
         /**
     * @var string
     */
        public $duzenleyen;
         /**
     * @var string
     */        
     public $donem;
         /**
     * @var string
     */
       public $vaka_sorumlusu;
    public function initialize()
    {
         $this->useDynamicUpdate(true);
        
}
public function seminer_adi_bul($id){
$db = $this->getDI()->get('db');
$sql="select seminer_adi from seminerler where id=$id";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

public function seminer_bilgileri($id){
$db = $this->getDI()->get('db');
$sql="select *from seminerler where id=$id";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
}