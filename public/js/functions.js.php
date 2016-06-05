<?php

/**
 * @author 
 * @copyright 2014
 */
Header("content-type: application/x-javascript");
echo "function buyitem(sellingid,companyid){
            var pcs = $(\"#pcs\").val();
            var dataString = 'pcs='+ pcs + '&sellid='+ sellingid;
            var url   = '../../market/buyraw/'+companyid;
            if(pcs=='')
{
alert(\"adet boş olamaz.\");
}
else
{
  
            $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: url,
                data:dataString,
            success: function (msg) {
            //Dönen sonucu ekranda gösterme
            $('#alerts').html(msg);
          
        }
    });
    }
}

function buymarket(sellingid){
            var pcs = $(\"#pcs\"+sellingid).val();
            var dataString = 'pcs='+ pcs + '&sellid='+ sellingid;
            var url   = 'buyitem';
            if(pcs=='')
{
alert(\"adet boş olamaz.\");
}
else
{
  
            $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: url,
                data:dataString,
            success: function (msg) {
            //Dönen sonucu ekranda gösterme
            $('#buyalert').html(msg);
            window.location.reload(true);
          
        }
    });
    }
}
";

?>