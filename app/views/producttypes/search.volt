<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("producttypes/index", "&larr; Go Back") ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::linkTo(array("producttypes/new", "Seminere Kişi Ekle", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Dosya No</th>
            <th>İsim</th>
             <th>Soyisim</th>
              <th>TC Kimlik</th>
              <th>Seminer Adı</th>
        </tr>
    </thead>
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ 
                $seminer_adi=seminerler::findfirst($productType->seminer_id);
                ?>
        <tr>
            <td><?php echo $productType->dosya_no ?></td>
            <td><?php echo $productType->isim ?></td>
            <td><?php echo $productType->soyisim ?></td>
            <td><?php echo $productType->tc_kimlik ?></td>
               <td><?php echo $seminer_adi->seminer_adi." (".$seminer_adi->seminer_tarihi.")"; ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("producttypes/edit/".$productType->id, '<i class="icon-pencil"></i> Edit', "class" => "btn")) ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("producttypes/delete/".$productType->id, '<i class="icon-remove"></i> Delete', "class" => "btn")) ?></td>
        </tr>
    <?php }
        } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="4" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("producttypes/search", '<i class="icon-fast-backward"></i> İlk', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->before, '<i class="icon-step-backward"></i> Önceki', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->next, '<i class="icon-step-forward"></i> Sonraki', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->last, '<i class="icon-fast-forward"></i> Son', "class" => "btn")) ?>
                    <span class="help-inline"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
    <tbody>
</table>