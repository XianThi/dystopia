<?php
use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class katilimcilar extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $tc_kimlik;
        /**
     * @var integer
     */
   public $seminer_id;
    /**
     * @var string
     */
    public $dosya_no;
       /**
     * @var string
     */
     public $isim;
        /**
     * @var string
     */
      public $soyisim;
         /**
     * @var string
     */
        public $seminer_adi;
         /**
     * @var string
     */
       public $vaka_sorumlusu;
    public function initialize()
    {
         $this->useDynamicUpdate(true);
        }
    public function sorgula($tc_kimlik,$seminer_id){
      
$db = $this->getDI()->get('db');
$sql="SELECT isim, soyisim,seminer_id, COUNT(*) toplam
FROM katilimcilar where tc_kimlik='$tc_kimlik' and seminer_id=$seminer_id
GROUP BY  isim, soyisim,seminer_id
HAVING toplam>1";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

public function katilimci_sayisi($seminer_id){
    $db = $this->getDI()->get('db');
    $sql="select count(*) from katilimcilar where seminer_id=$seminer_id";
    $query=$db->query($sql);
$query=$query->fetch();
return $query;
}

}