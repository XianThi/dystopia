<div class="page-header">
    <h2>Denetim Raporu Kaydını Reddet</h2>
</div>

<p> Lütfen reddetme nedenini yazınız..</p>
 form('denetimraporu/red', 'class': 'form-horizontal') }}
    <fieldset>
        <div class="control-group">
            <label class="control-label" for="comments">Neden</label>
            <div class="controls">
                <textarea name="neden" id="neden" rows="10"></textarea>
                <input type="hidden" name="id" id="id" value="id}}" />
                <p class="help-block">(gerekli)</p>
            </div>
        </div>
        <div class="form-actions">
             submit_button('Reddet', 'class': 'btn btn-danger') }}
        </div>
    </fieldset>
</form>
