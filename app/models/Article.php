<?php
class Article extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}

public function article_list($userzone){
    $resultset = $this->getDI()->get('modelsManager')->createBuilder()
   ->from('article')
   ->innerJoin('Newspaper','Newspaper.zones='.$userzone.' and Newspaper.id=article.owner')
   ->limit(20)
   ->orderBy('article.create_time desc')
   ->getQuery()
   ->execute();
   return $resultset;
   
}

}