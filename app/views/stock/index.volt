{{ javascript_include("js/node_modules/socket.io-client/socket.io.js") }}
{{ javascript_include("js/logic.js") }}
{{ javascript_include("js/nodeClient.js") }}

{{content()}}
<div class="showback"><h2><?=$lang["stocks"];?></h2><hr />
<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Sermaye Şirketi</th>
                <th>Son</th>
                <th>Dün</th>
                <th>%</th>
                <th>Yüksek</th>
                <th>Düşük</th>
                <th>Ağırlıklı Ortalama</th>
                <th>Hacim(LOT)</th>
                <th>Hacim(<i class="fa fa-money"></i>)</th>
            </tr>
        </thead>
 
<tbody>
</tbody>
    </table></div>
    
    <div id="dialog">
      <div id="messages"></div>

      <div id="status"></div>

    </div>
    
<div class="modal fade" id="alert">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->