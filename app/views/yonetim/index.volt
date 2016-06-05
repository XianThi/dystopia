<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>
<h2>Son Eklenen Kayıtlar</h2>
<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("yonetim/index", "&larr; Yenile") ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::linkTo(array("companies", "Seminere Kişi Ekle", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th class="label label-warning">Dosya No</th>
            <th class="label label-warning">İsim</th>
            <th class="label label-warning">Soyisim</th>
              <th class="label label-warning">TC Kimlik</th>
              <th class="label label-warning">Seminer Adı</th>
              <th class="label label-warning">Düzenle </th>
              <th class="label label-warning">Sil </th>
        </tr>
    </thead>
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
        <?php 
        $seminer_id=$productType->seminer_id; 
        $seminer_adi=seminerler::findFirstById($seminer_id); 
        ?>
            <td><?php echo $productType->dosya_no." ".$productType->dosya_turu ?></td>
            <td><?php echo $productType->isim ?></td>
            <td><?php echo $productType->soyisim ?></td>
            <td><?php echo $productType->tc_kimlik ?></td>
            <td><?php echo $seminer_adi->seminer_adi."(".$seminer_adi->seminer_tarihi.")"; ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("yonetim/edit/".$productType->id, '<i class="icon-pencil"></i> Düzenle', "class" => "btn")) ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("yonetim/delete/".$productType->id, '<i class="icon-remove"></i> Sil', "class" => "btn")) ?></td>
        </tr>
    <?php }
        } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="4" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("yonetim/index", '<i class="icon-fast-backward"></i> İlk', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("yonetim/index?page=".$page->before, '<i class="icon-step-backward"></i> Önceki', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("yonetim/index?page=".$page->next, '<i class="icon-step-forward"></i> Sonraki', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("yonetim/index?page=".$page->last, '<i class="icon-fast-forward"></i> Son', "class" => "btn")) ?>
                    <span class="help-inline"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
    <tbody>
</table>