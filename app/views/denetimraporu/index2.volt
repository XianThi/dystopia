<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>
<h2>Denetim Raporu Onay Bekleyen Kayıtlar</h2>
<h6>Sorumlu memur tarafından onaylanıp geri gönderilen kayıtlar listelenmektedir..</h6>
<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("denetimraporu/index", "&larr; Yenile") ?>
    </li>
    <li class="pull-right">
       <span class="btn btn-primary"> <?php echo Tag::linkTo("denetimraporu/new", "Denetim Raporu Ekle") ?></span>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th class="label label-warning">No</th>
            <th class="label label-warning">Dosya No</th>
            <th class="label label-warning">Dosya Türü</th>
              <th class="label label-warning">Hükümlü İsim Soyisim</th>
              <th class="label label-warning">Memur İsim Soyisim</th>
              <th class="label label-warning">İşlem </th>
              <th class="label label-warning">Red Nedeni (eğer reddedildiyse)</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $i=0;
    
        if(isset($page->items)){
            foreach($page->items as $productType){
       if($productType->red==0){ $class="background-color:#c12e2a; color:white;"; $not="<td style='$class'>".$productType->red_neden."</td>"; }
        ?>
        <tr>
            <td style="<?php if(isset($class)){echo $class;}?>"><?php $i++; echo $i; ?></td>
             <td style="<?php if(isset($class)){echo $class;}?>"><?php echo $productType->dosya_no ?></td>
             <td style="<?php if(isset($class)){echo $class;}?>"><?php echo $productType->dosya_turu ?></td>
            <td style="<?php if(isset($class)){echo $class;}?>"><?php echo $productType->isim_soyisim ?></td>
            <td style="<?php if(isset($class)){echo $class;}?>"><?php $memur=users::findFirst("id=".$productType->sahip); echo $memur->isim_soyisim;?></td>
             <td style="<?php if(isset($class)){echo $class;}?>"><?php echo Tag::linkTo(array("denetimraporu/onay/".$productType->id, '<span class="label label-success"></span> Sil', "class" => "btn")) ?></td>
            <?php if(isset($class)){echo $not;}?>
            </tr>
    <?php }
        } ?>
    </tbody>
        <tr>
            <td colspan="7" align="right">
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