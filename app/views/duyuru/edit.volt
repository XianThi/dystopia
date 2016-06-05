<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form("duyuru/save") ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("duyuru", "&larr; Geri Dön")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("Kaydet", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="center scaffold">
    <h2>Kişi Düzenle</h2>
    
    <input type="hidden" name="id" id="id" value="<?php echo $id ?>" />

    <div class="clearfix">
        <label for="baslik">Başlık</label>
        <?php echo Tag::textField(array("baslik", "size" => 24, "maxlength" => 70)) ?>
    </div>
    <div class="clearfix">
        <label for="icerik">İçerik</label>
        <?php echo Tag::textField(array("icerik", "size" => 24, "maxlength" => 70)) ?>
    </div>
        <div class="clearfix">
        <label for="yazar">Yazar</label>
        <?php echo Tag::textField(array("yazar", "size" => 24, "maxlength" => 70)) ?>
    </div>
        <div class="clearfix">
        <label for="tarih">Tarih</label>
        <?php echo Tag::textField(array("tarih", "size" => 24, "maxlength" => 70)) ?>
    </div>
        <div class="clearfix">
        <label for="sahip">Sahip</label>
        <?php echo Tag::textField(array("sahip", "size" => 24, "maxlength" => 70)) ?>
    </div>
    
    </form>
</div>
