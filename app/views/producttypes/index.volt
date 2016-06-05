<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<div align="right">
    <?php echo Tag::linkTo(array("producttypes/new", "Basma Buraya", "class" => "btn btn-primary")) ?>
</div>

<?php echo Tag::form(array("producttypes/search", "autocomplete" => "off")) ?>

<div class="center scaffold">

    <h2>Arama Yap</h2>

    <div class="clearfix">
        <label for="id">TC Kimlik</label>
        <?php echo Tag::textField(array("tc_kimlik", "size" => 10, "maxlength" => 11, "type" => "number")) ?>
 <hr />
        <label for="dosya_no">Dosya Numarası</label>
        <?php echo Tag::textField(array("dosya_no", "size" => 24, "maxlength" => 70)); ?>
 <hr />
        <label for="isim_soyisim">İsim Soyisim</label>
        <?php echo Tag::textField(array("isim", "size" => 24,"placeholder"=>"İsim", "maxlength" => 70)); ?>
        <?php echo Tag::textField(array("soyisim", "size" => 24,"placeholder"=>"Soyisim", "maxlength" => 70)); ?>
   </div>

    <div class="clearfix">
        <?php echo Tag::submitButton(array("Ara", "class" => "btn btn-primary")) ?></td>
    </div>

</div>

</form>
