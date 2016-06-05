<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>
<h2>Tüm Duyurular</h2>
<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("duyuru/index", "&larr; Yenile") ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::linkTo(array("duyuru/new", "Yeni Duyuru Ekle", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th class="label label-warning">No</th>
            <th class="label label-warning">Başlık</th>
            <th class="label label-warning">İçerik</th>
              <th class="label label-warning">Yazar</th>
              <th class="label label-warning">Tarih</th>
              <th class="label label-warning">Sahip </th>
              <th class="label label-warning">Düzenle </th>
              <th class="label label-warning">Sil </th>
        </tr>
    </thead>
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
            <td><?php echo $productType->id ?></td>
            <td><?php echo $productType->baslik ?></td>
            <td><?php echo $productType->icerik ?></td>
            <td><?php echo $productType->yazar ?></td>
               <td><?php echo $productType->tarih; ?></td>
               <td><?php echo $productType->sahip; ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("duyuru/edit/".$productType->id, '<i class="icon-pencil"></i> Düzenle', "class" => "btn")) ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("duyuru/delete/".$productType->id, '<i class="icon-remove"></i> Sil', "class" => "btn")) ?></td>
        </tr>
    <?php }
        } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="4" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("duyuru/index", '<i class="icon-fast-backward"></i> İlk', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("duyuru/index?page=".$page->before, '<i class="icon-step-backward"></i> Önceki', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("duyuru/index?page=".$page->next, '<i class="icon-step-forward"></i> Sonraki', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("duyuru/index?page=".$page->last, '<i class="icon-fast-forward"></i> Son', "class" => "btn")) ?>
                    <span class="help-inline"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
    <tbody>
</table>