
 content() }}

<div class="profile left">
     form('invoices/profile', 'id': 'profileForm', 'onbeforesubmit': 'return false') }}
        <div class="clearfix">
            <label for="name">İsim Soyisim:</label>
            <div class="input">
                 text_field("name", "size": "30", "class": "span6") }}
                <div class="alert" id="name_alert">
                    <strong>Hata!</strong> Lütfen isminizi doğru girdiğinizden emin olun.
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Email Adresi:</label>
            <div class="input">
                 text_field("email", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Hata!</strong> Lütfen mail adresinizi doğru girdiğinizden emin olun.
                </div>
            </div>
        </div>
        <div class="clearfix">
            <input type="button" value="Güncelle" class="btn btn-primary btn-large btn-info" onclick="Profile.validate()">
            &nbsp;
             link_to('invoices/index', 'İptal') }}
        </div>
    </form>
</div>