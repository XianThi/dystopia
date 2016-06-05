<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>
<script type="text/javascript">
function deneme(){
$("#yazdir").printThis();

}
</script>
<div align="right">
<a onclick="deneme();" class="btn btn-primary">Yazdır</a>
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
<div id="yazdir" class="center scaffold">
<h1>T.C</h1>
<h2>Adalet Bakanlığı</h2>
    <h2>Bakırköy Denetimli Serbestlik Müdürlüğü</h2>
    <div class="clearfix">
    <? if(isset($seminer_bilgi)){
         ?>
           {% for seminer_bilgix in seminer_bilgi %}
        <table class="table table-bordered table-stripd" align="center"><tbody>
        <tr><th>KONU : <?=$seminer_bilgix["seminer_adi"];?></th><th>TARİH : <?=$seminer_bilgix["seminer_tarihi"];?><br />SAAT : <?=$seminer_bilgix["seminer_saati"];?></th></tr>
        <tr><th>DÜZENLEYEN : <?=$seminer_bilgix["duzenleyen"];?></th><th>YER : <?=$seminer_bilgix["yer"];?></th></tr>
        </tbody></table>
               {% endfor %} 
        <? } ?>
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
    <?php $i=1;
        if(isset($page->items)){
            foreach($page->items as $seminer_listesi){ ?>
        <tr>
         <td><?php echo $i++; ?></td>
            <td><?php echo $seminer_listesi->dosya_no." ".$seminer_listesi->dosya_turu;?></td>
            <td><?php echo $seminer_listesi->isim." ".$seminer_listesi->soyisim; ?></td>
            <td></td>
            <td><?php echo $seminer_listesi->vaka_sorumlusu ?></td>
              </tr>
    <?php }
        } ?>
    </tbody>
        </table>
         </div>
<div id="alt">
<hr />
<h4>İşbu evrak yukarıda imzası bulunan yükümlülerin seminere katılıp katılmadığını belgelemektedir.</h4>
</div>
</div>

</form>
