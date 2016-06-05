
 content() }}

<div class="page-header">
    <h2>İletişim</h2>
</div>

<p> Birşey mi oldu? Bizi bulamadın mı? Not bırak. Bizimle iletişime geç.</p>

 form('contact/send', 'class': 'form-horizontal') }}
    <fieldset>
        <div class="control-group">
            <label class="control-label" for="name">İsim Soyisim</label>
            <div class="controls">
                 text_field('name', 'class': 'input-xlarge') }}
                <p class="help-block">(gerekli)</p>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="email">Email Adresi</label>
            <div class="controls">
                 text_field('email', 'class': 'input-xlarge') }}
                <p class="help-block">(gerekli)</p>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="comments">Not</label>
            <div class="controls">
                 text_area('comments', 'rows': '5', 'class': 'input-xlarge') }}
                <p class="help-block">(gerekli)</p>
            </div>
        </div>
        <div class="form-actions">
             submit_button('Gönder', 'class': 'btn btn-primary btn-large') }}
        </div>
    </fieldset>
</form>
