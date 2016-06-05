<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form("duyuru/new") ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("duyuru/index", "&larr; Geri Dön")) ?>
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
        <label for="name">Başlık</label>
        <?php echo Tag::textField(array("baslik", "size" => 24, "maxlength" => 70)) ?>
    </div>
            <label for="name">İçerik</label>
        <?php echo Tag::textarea(array("icerik", "size" => 255,"style"=>"height:100px;width:500px;","maxlength" => 70)) ?>
    </div>
        <label for="name">Yazar</label>
        <?php echo Tag::textField(array("yazar", "size" => 24, "maxlength" => 70)) ?>
    </div>
    <div class="clearfix">
        <label for="name">Tarih</label>
        <?php echo Tag::textField(array("tarih", "size" => 24, "maxlength" => 70)) ?>
    </div>    <div class="clearfix">
        <label for="name">Kime Gönderilecek?</label>
        <select id="sahip" name="sahip[]" multiple style="width:400px">
        <option value="all" selected>Herkese Gönder</option>
        {% if kisiler_aktif=="Aktif" %}
         {% for kisilerx in kisiler %}
            <option value="kisilerx['id']}}">kisilerx["isim_soyisim"]}}</option>
         {% endfor %}
         {% endif %}
    </select>
</div>
</form>
