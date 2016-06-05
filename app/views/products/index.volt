<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<div align="right">
    <?php echo Tag::linkTo(array("products/new", "Yazdır", "class" => "btn btn-primary")) ?>
</div>

<?php echo Tag::form(array("products/search", "autocomplete" => "off")) ?>
<style type="text/css">
<!--
	td{
	   height:1cm;
       width:14cm;
       color:#EA2456;
       font-size:16px;
	}
-->
</style>
<div class="center scaffold">
<h1>T.C</h1>
<h2>Adalet Bakanlığı</h2>
    <h2>Bakırköy Denetimli Serbestlik Müdürlüğü</h2>
    <div class="clearfix">
        <table class="table table-bordered table-stripd" align="center"><tbody>
        <tr><th>KONU : </th><th>TARİH : <br />SAAT : </th></tr>
        <tr><th>DÜZENLEYEN : </th><th>YER : </th></tr>
        </tbody></table>
        <table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
        <th>SIRA NO</th>
            <th>DOSYA NO</th>
            <th>YÜKÜMLÜ ADI SOYADI</th>
             <th>YÜKÜMLÜ İMZA</th>
              <th>VAKA SORUMLUSU</th>
        </tr>
    </thead>  
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
            <td><?php echo $seminer_listesi->dosya_no ?></td>
            <td><?php echo $seminer_listesi->isim ?></td>
            <td><?php echo $seminer_listesi->soyisim ?></td>
            <td><?php echo $seminer_listesi->tc_kimlik ?></td>
               <td><?php echo $seminer_listesi->seminer_adi ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("producttypes/edit/".$seminer_listesi->id, '<i class="icon-pencil"></i> Edit', "class" => "btn")) ?></td>
            <td width="12%"><?php echo Tag::linkTo(array("producttypes/delete/".$seminer_listesi->id, '<i class="icon-remove"></i> Delete', "class" => "btn")) ?></td>
        </tr>
    <?php }
        } ?>
    </tbody>
        </table>
         </div>
</div>

</form>
