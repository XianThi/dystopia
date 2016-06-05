<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>
<h2>Denetim Rapor Kayıtları</h2>
<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("denetimraporu/index", "&larr; Yenile") ?>
    </li>
    <li class="pull-right">
        <?php // echo Tag::linkTo(array("denetimraporu/new", "Denetim Raporu Ekle", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th class="label label-warning">No</th>
            <th class="label label-warning">Dosya No</th>
            <th class="label label-warning">Dosya Türü</th>
              <th class="label label-warning">Hükümlü İsim Soyisim</th>
              <th class="label label-warning">Uzman İsim Soyisim</th>
              <th class="label label-warning">İşlem </th>
        </tr>
    </thead>
    <tbody>
    <?php
    $i=0;
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
            <td><?php $i++; echo $i; ?></td>
            <td><?php echo $productType->dosya_no ?></td>
            <td><?php echo $productType->dosya_turu ?></td>
            <td><?php echo $productType->isim_soyisim ?></td>
            <td><?php echo $productType->uzman; ?></td>
            <td><?php echo Tag::linkTo(array("denetimraporu/onay/".$productType->id, '<span class="label label-success"></span> Onayla', "class" => "btn")) ?><?php echo Tag::linkTo(array("denetimraporu/reddet/".$productType->id, '<span class="label btn-danger"></span> Reddet', "class" => "btn")) ?></td>
            </tr>
    <?php }
        } ?>
    </tbody>
        <tr>
            <td colspan="6" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("denetimraporu/index", '<i class="icon-fast-backward"></i> İlk', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("denetimraporu/index?page=".$page->before, '<i class="icon-step-backward"></i> Önceki', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("denetimraporu/index?page=".$page->next, '<i class="icon-step-forward"></i> Sonraki', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("denetimraporu/index?page=".$page->last, '<i class="icon-fast-forward"></i> Son', "class" => "btn")) ?>
                    <span class="help-inline"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
</table>