<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form("producttypes/create") ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("producttypes", "&larr; Geri Dön")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("Kaydet", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="center scaffold">
    <h2>Kişi Oluştur</h2>

    <div class="clearfix">
        <div class="clearfix">
        <label for="name">Dosya No</label>
        <?php echo Tag::textField(array("dosya_no", "size" => 24, "maxlength" => 70)) ?>
    </div>
            <label for="name">Dosya Türü</label>
        <?php echo Tag::textField(array("dosya_turu", "size" => 24, "maxlength" => 70)) ?>
    </div>
        <label for="name">İsim</label>
        <?php echo Tag::textField(array("isim", "size" => 24, "maxlength" => 70)) ?>
    </div>
    <div class="clearfix">
        <label for="name">Soyisim</label>
        <?php echo Tag::textField(array("soyisim", "size" => 24, "maxlength" => 70)) ?>
    </div>    <div class="clearfix">
        <label for="name">Vaka Sorumlusu</label>
        <?php echo Tag::textField(array("vaka_sorumlusu", "size" => 24, "maxlength" => 70)) ?>
    </div>    <div class="clearfix">
        <label for="name">TC Kimlik</label>
        <?php echo Tag::textField(array("tc_kimlik", "size" => 24, "maxlength" => 70)) ?>
    </div>
</div>
</form>
