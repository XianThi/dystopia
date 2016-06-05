<p>
    <h2> link_to('invoices/index/', 'Duyurular') }}</h2>  link_to('invoices/index/all', '[Tüm Duyuruları Gör] &raquo;') }}
</p>

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <td class="label label-warning">Başlık</td>
            <td class="label label-warning">İçerik</td>
            <td class="label label-warning">Tarih</td>
            <td class="label label-warning">Yazar</td>
            <td class="label label-warning">İşlem</td>
        </tr>
    </thead>
    <tbody>
 
        <tr>
    {% for duyuru in duyurular %}
      <td style="width:%100;"> duyuru["baslik"]}}</td>
         <td> duyuru["icerik"]}}</td>
        <td style="width:75px;"> duyuru["tarih"]}}</td>
       <td> duyuru["yazar"]}}</td> 
       <td><a href='../invoices/success/duyuru["id"]}}'><span class="label label-success">Onayla</span></a> <a href='../invoices/delete/duyuru["id"]}}'><span class="label label-important">Sil</span></a></td>
        </tr>
      
         {% endfor %}
    </tbody>
</table>

