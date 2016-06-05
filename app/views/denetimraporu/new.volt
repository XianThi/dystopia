<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form("denetimraporu/new") ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("denetimraporu", "&larr; Geri Dön")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("Kaydet", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="center scaffold">
    <h2>Denetim Raporu Tanımla</h2>

    <div class="clearfix">
        <div class="clearfix">
        <label for="name">Dosya No</label>
        <?php echo Tag::textField(array("dosya_no", "size" => 24, "maxlength" => 70)) ?>
    </div>
            <label for="name">Dosya Türü</label>
        <?php echo Tag::textField(array("dosya_turu", "size" => 24, "maxlength" => 70)) ?>
    </div>
        <label for="name">İsim Soyisim</label>
        <?php echo Tag::textField(array("isim_soyisim", "size" => 24, "maxlength" => 70)) ?>
    </div>
    <div class="clearfix">
        <label for="name">Uzman</label>
        <?php echo Tag::textField(array("uzman","value" => $uzman->isim_soyisim,"disabled"=>"disabled" )) ?>
    </div>    <div class="clearfix">
      <label for="name">Vaka Sorumlusu</label>
       <?php echo Tag::select(array('vaka_sorumlusu', $vakasorumlusu, 'using' => array('id', 'isim_soyisim'))); ?>
    </div>   
</div>
</form>
