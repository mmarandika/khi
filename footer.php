</div>

<footer class='text-center mb-1' >

<?=date('Y');?> <?=$teamName;?>
</footer>
<style>
table#myLinks {
    font-size: .9em;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.min.js" integrity="sha512-8qmis31OQi6hIRgvkht0s6mCOittjMa9GMqtK9hes5iEQBQE/Ca6yGE5FsW36vyipGoWQswBj/QBm2JR086Rkw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/js/jquery.dataTables.min.js" integrity="sha256-t5ZQTZsbQi8NxszC10CseKjJ5QeMw5NINtOXQrESGSU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables-tabletools/2.1.5/js/TableTools.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/css/dataTables.bootstrap4.min.css" integrity="sha512-PT0RvABaDhDQugEbpNMwgYBCnGCiTZMh9yOzUsJHDgl/dMhD9yjHAwoumnUk3JydV3QTcIkNDuN40CJxik5+WQ==" crossorigin="anonymous" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.0/chart.min.js" integrity="sha512-JxJpoAvmomz0MbIgw9mx+zZJLEvC6hIgQ6NcpFhVmbK1Uh5WynnRTTSGv3BTZMNBpPbocmdSJfldgV5lVnPtIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

<script>
function onSubmit(token) {
    document.getElementById("register").submit();
}


// const labels = [
//   'January',
//   'February',
//   'March',
//   'April',
//   'May',
//   'June',
// ];
// const data = {
//   labels: labels,
//   datasets: [{
//     label: 'My First dataset',
//     backgroundColor: 'rgb(255, 99, 132)',
//     borderColor: 'rgb(255, 99, 132)',
//     data: [0, 10, 5, 2, 20, 30, 45],
//   }]
// };

// const config = {
//   type: 'line',
//   data,
//   options: {}
// };

// var myChart = new Chart(
//     document.getElementById('myChart'),
//     config
// );

<?php 
if(isset($page) && $page == "stats") {
?>
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<?=Stats::chartDate();?>],
        datasets: [{
            label: 'Hits',
            data: [<?=Stats::chartDailyHits(7, Session::val('username'));?>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

<?php 
}
?>

$(document).ready(function() {
    // checl all start
    // Add new element
    var countryOpt = "<?php echo countryOption(); ?>";

    $("#cloneForwardUrl").click(function(){

        // Finding total number of elements added
        var total_element = $(".forward_url_link").length;

        // last <div> with element class id
        var lastid = $(".forward_url_link:last").attr("id");
        var split_id = lastid.split("_");
        var nextindex = Number(split_id[1]) + 1;
        console.log(nextindex);
        var max = 5;
        
        // Check total number elements
        $(".forward_url_link:last").after("<div class='forward_url_link' id='forwardUrlLink_"+ nextindex +"'></div>");

        // Adding element to <div>
        $("#forwardUrlLink_" + nextindex).append("\
        <div class='form-group' style='{$redirectUrlBlock}'>\
            <div class='input-group'>\
                <div class=\"input-group-prepend\">\
                    <select name='forward_url_country[]' id='forward_url_country_"+ nextindex +"' class='form-control-sm'>\
                        <option value='ALL'>All</option>\
                        " + countryOpt + "\
                    </select>\
                </div>\
                <input type='text' name='forward_url[]' id='forward_url_"+ nextindex +"'  class='form-control form-control-sm forward_url' value=''>\
                <div class='input-group-append'>\
                    <button class='btn btn-outline-secondary btn-sm removeForwardUrl' type='button' id='removeForwardUrl_"+ nextindex +"'><i class='fa fa-minus'></i></button>\
                </div>\
            </div>\
        </div>");

    });

    // Remove element
    $('#pills-home').on('click','.removeForwardUrl',function(){

        var id = this.id;
        var split_id = id.split("_");
        var deleteindex = Number(split_id[1]);
        console.log(deleteindex);
        // Remove <div> with id
        $("#forwardUrlLink_" + deleteindex).remove();

    }); 

    $("#cloneForwardWeb").click(function(){

        // Finding total number of elements added
        var total_element = $(".forward_web_link").length;

        // last <div> with element class id
        var lastid = $(".forward_web_link:last").attr("id");
        var split_id = lastid.split("_");
        var nextindex = Number(split_id[1]) + 1;
        console.log(nextindex);
        var max = 5;

        // Check total number elements
        $(".forward_web_link:last").after("<div class='forward_web_link' id='forwardWebLink_"+ nextindex +"'></div>");

        // Adding element to <div>
        $("#forwardWebLink_" + nextindex).append("\
        <div class='form-group' style=''>\
            <div class='input-group'>\
                <div class=\"input-group-prepend\">\
                    <select name='forward_web_country[]' id='forward_web_country_"+ nextindex +"' class='form-control-sm'>\
                        <option value='ALL'>All</option>\
                        " + countryOpt + "\
                    </select>\
                </div>\
                <input type='text' name='forward_web[]' id='forward_web_"+ nextindex +"'  class='form-control form-control-sm forward_web' value=''>\
                <div class='input-group-append'>\
                    <button class='btn btn-outline-secondary btn-sm removeForwardWeb' type='button' id='removeForwardWeb_"+ nextindex +"'><i class='fa fa-minus'></i></button>\
                </div>\
            </div>\
        </div>");

    });

        // Remove element
    $('#pills-web').on('click','.removeForwardWeb',function(){

        var id = this.id;
        var split_id = id.split("_");
        var deleteindex = Number(split_id[1]);
        console.log(deleteindex);
        // Remove <div> with id
        $("#forwardWebLink_" + deleteindex).remove();

    });

    $("#cloneForwardWap").click(function(){

        // Finding total number of elements added
        var total_element = $(".forward_wap_link").length;

        // last <div> with element class id
        var lastid = $(".forward_wap_link:last").attr("id");
        var split_id = lastid.split("_");
        var nextindex = Number(split_id[1]) + 1;
        console.log(nextindex);
        var max = 5;

        // Check total number elements
        $(".forward_wap_link:last").after("<div class='forward_wap_link' id='forwardWapLink_"+ nextindex +"'></div>");

        // Adding element to <div>
        $("#forwardWapLink_" + nextindex).append("\
        <div class='form-group' style=''>\
            <div class='input-group'>\
                <div class=\"input-group-prepend\">\
                    <select name='forward_wap_country[]' id='forward_wap_country_"+ nextindex +"' class='form-control-sm'>\
                        <option value='ALL'>All</option>\
                        " + countryOpt + "\
                    </select>\
                </div>\
                <input type='text' name='forward_wap[]' id='forward_wap_"+ nextindex +"'  class='form-control form-control-sm forward_wap' value=''>\
                <div class='input-group-append'>\
                    <button class='btn btn-outline-secondary btn-sm removeForwardWap' type='button' id='removeForwardWap_"+ nextindex +"'><i class='fa fa-minus'></i></button>\
                </div>\
            </div>\
        </div>");

    });

    // Remove element
    $('#pills-wap').on('click','.removeForwardWap',function(){

        var id = this.id;
        var split_id = id.split("_");
        var deleteindex = Number(split_id[1]);
        console.log(deleteindex);
        // Remove <div> with id
        $("#forwardWapLink_" + deleteindex).remove();

    });
    

    function Check(frm){
        var checkBoxes = frm.elements['doms[]'];
        var selectAll = document.getElementById("selectAll");
        console.log(checkBoxes);
        for (i = 0; i < checkBoxes.length; i++){
            checkBoxes[i].checked = (selectAll.innerHTML == "Select All") ? 'checked' : '';
        }
        selectAll.innerHTML = (selectAll.innerHTML == "Select All") ? "Unselect All" : 'Select All';
    }

    window.onload = function(){
        document.getElementById("selectAll").onclick = function(){Check(document.getElementById("myForm"))};
    };

    function toggle(source) {
        checkboxes = document.getElementsByName('doms[]');
        for(var i=0, n=checkboxes.length;i<n;i++) {
            checkboxes[i].checked = source.checked;
        }
    }
    // check all end
    $('#myLinks').DataTable({
        'order': [[0, 'desc']]
    });
    $('#domain').change(function(){
        var val = $('#domain').val();
        if (validURL(val)) {
            $('#addDomainSubmit').prop( "disabled", false );
        } 
    });
    function validURL(str) {
        var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
            '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
            '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
            '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
            '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
            '(\\#[-a-z\\d_]*)?$','i'); // fragment locator
        return !!pattern.test(str);
    }

    function makeSub(length) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }

    $('#createGen1').click(function(){
        var domain = $('#domain').val(),
            forward_url = {}; //$('#forward_url').val(),
            forward_web = {},
            forward_wap = {},
            branch_key = $('#branch_key').val(),
            branch_domain = $('#branch_domain').val(),
            bitly_key = $('#bitly_key').val(),
            bitly_domain = $('#bitly_domain').val(),
            country = $('#country').val(),
            country_block = $('#country_block').val(),
            lang = $('#lang').val(),
            alter = $('#alter:checked').val(),
            checkBox = document.getElementById("use_landing"),
            username = $('#username').val(),
            team = $('#team').val(),
            amount = $('#amount').val();
            if( amount > 20 ) {
                amount = 20;
            }
        $('.forward_url').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_url_country_' + i).val();
            if( !(ctr in forward_url) ) {
                forward_url[ctr] = new Array();
            }
            
            forward_url[ctr].push($('#forward_url_' + i).val());
        });
        $('.forward_web').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_web_country_' + i).val();
            if( !(ctr in forward_web) ) {
                forward_web[ctr] = new Array();
            }
            forward_web[ctr].push( $('#forward_web_' + i).val() );
        });
        $('.forward_wap').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_wap_country_' + i).val();
            if( !(ctr in forward_wap) ) {
                forward_wap[ctr] = new Array();
            }
            forward_wap[ctr].push ( $('#forward_wap_' + i).val() );
        });

        forward_url = JSON.stringify(forward_url);
        forward_web = JSON.stringify(forward_web);
        forward_wap = JSON.stringify(forward_wap);
        console.log(forward_url);
        
        if (checkBox.checked == true){
            use_landing = "on";
        } else {
            use_landing = "off";
        }
        $("#result1").html('<div class="panel panel-default"><div class="panel-body">'+
        '<textarea id="genurl" type="text" class="form-control mb-2" onclick=\'copyToClipboard("genurl")\' rows="3" ></textarea>'+
        '<textarea id="branchio" type="text" class="form-control mb-2" onclick=\'copyToClipboard("branchio")\' rows="3" ></textarea>'+
        '<textarea id="wowinth" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("wowinth")\' rows="3" ></textarea>'+
        '<textarea id="fbl" type="text" class="form-control mb-2"   onclick=\'copyToClipboard("fbl")\' ></textarea>'+
        '<textarea id="fbr" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("fbr")\' ></textarea>'+
        '<textarea id="linkig" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("linkig")\' ></textarea>'+
        // '<textarea  class="form-control" rows="5" id="caption" onclick=\'copyToClipboard("caption")\' >'+caption+'</textarea>'+
        '</div></div>');
        for(var am=0;am<amount;am++) {
            
            if (forward_url != '' ) {
                console.log('valid :'+domain);
                console.log(use_landing);
                $.post('<?php echo $siteurl;?>createGen.php', {amount: 1, team: team, forward_web: forward_web, forward_wap: forward_wap, use_landing: use_landing, 
                alter: alter, username: username, type: 'basic',branch_key: branch_key, branch_domain: branch_domain, domain: domain, 
                forward_url: forward_url, country: country, country_block: country_block, lang: lang, bitly_key: bitly_key, bitly_domain: bitly_domain
                }, function(response){ 
                    console.log(response);
                    var genurl = "",
                        jsonGenurl = JSON.parse(response.genurl);
                    for(var i=0; i<jsonGenurl.length; i++) {
                        genurl += jsonGenurl[i]+"\n";
                    }
                    var wowinth = "",
                        jsonWow = JSON.parse(response.wowinth);
                    for(var i=0; i<jsonWow.length; i++) {
                        wowinth += jsonWow[i]+"\n";
                    }
                    var branchio = "",
                        jsonBranch = JSON.parse(response.branchio);
                    for(var i=0; i<jsonBranch.length; i++) {
                        branchio += jsonBranch[i]+"\n";
                    }
                    // var caption = "",
                    //     jsonCaps = JSON.parse(response.caption);
                    // for(var i=0; i<jsonCaps.length; i++) {
                    //     caption += jsonCaps[i]+"\n";
                    // }
                    var fbl = "",
                        jsonFbl = JSON.parse(response.fbl);
                    for(var i=0; i<jsonFbl.length; i++) {
                        fbl += jsonFbl[i]+"\n";
                    }
                    var fbr = "",
                        jsonFbr = JSON.parse(response.fbr);
                    for(var i=0; i<jsonFbr.length; i++) {
                        fbr += jsonFbr[i]+"\n";
                    }

                    var linkig = "",
                        jsonLinkig = JSON.parse(response.linkig);
                    for(var i=0; i<jsonLinkig.length; i++) {
                        linkig += jsonLinkig[i]+"\n";
                    }

                    $('#genurl').val(genurl+$('#genurl').val());
                    $('#branchio').val(branchio+$('#branchio').val());
                    $('#wowinth').val(wowinth+$('#wowinth').val());
                    $('#fbl').val(fbl+$('#fbl').val());
                    $('#fbr').val(fbr+$('#fbr').val());
                    $('#linkig').val(linkig+$('#linkig').val());
                    
                });
            }
        }
        
        // console.log(forward_url);
    });

    $('#createGen2').click(function(){
        var domain = $('#domain').val(),
            forward_url = {},
            forward_web = {},
            forward_wap = {},
            fake_url = $('#fake_url').val(),
            branch_key = $('#branch_key').val(),
            branch_domain = $('#branch_domain').val(),
            bitly_key = $('#bitly_key').val(),
            bitly_domain = $('#bitly_domain').val(),
            country = $('#country').val(),
            country_block = $('#country_block').val(),
            lang = $('#lang').val(),
            alter = $('#alter:checked').val(),
            checkBox = document.getElementById("use_landing"),
            username = $('#username').val(),
            team = $('#team').val(),
            amount = $('#amount').val();

            if( amount > 20 ) {
                amount = 20;
            }

        if (checkBox.checked == true){
            use_landing = "on";
        } else {
            use_landing = "off";
        }
        $('.forward_url').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_url_country_' + i).val();
            if( !(ctr in forward_url) ) {
                forward_url[ctr] = new Array();
            }
            
            forward_url[ctr].push($('#forward_url_' + i).val());
        });
        $('.forward_web').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_web_country_' + i).val();
            if( !(ctr in forward_web) ) {
                forward_web[ctr] = new Array();
            }
            forward_web[ctr].push( $('#forward_web_' + i).val() );
        });
        $('.forward_wap').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_wap_country_' + i).val();
            if( !(ctr in forward_wap) ) {
                forward_wap[ctr] = new Array();
            }
            forward_wap[ctr].push ( $('#forward_wap_' + i).val() );
        });

        forward_url = JSON.stringify(forward_url);
        forward_web = JSON.stringify(forward_web);
        forward_wap = JSON.stringify(forward_wap);
        $("#result2").html('<div class="panel panel-default"><div class="panel-body">'+
        '<textarea id="genurl2" type="text" class="form-control mb-2" onclick=\'copyToClipboard("genurl2")\' rows="3" ></textarea>'+
        '<textarea id="branchio2" type="text" class="form-control mb-2" onclick=\'copyToClipboard("branchio2")\' rows="3" ></textarea>'+
        '<textarea id="wowinth2" type="text" class="form-control mb-2" onclick=\'copyToClipboard("wowinth2")\' rows="3" ></textarea>'+
        '<textarea id="fbl2" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("fbl2")\' ></textarea>'+
        '<textarea id="fbr2" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("fbr2")\' ></textarea>'+
        '<textarea id="linkig2" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("linkig2")\' ></textarea>'+
        // '<textarea  class="form-control" rows="5" id="caption" onclick=\'copyToClipboard("caption")\' >'+caption+'</textarea>'+
        '</div></div>');
        for(var am=0;am<amount;am++) {
            if ( forward_url != '' ) {
                console.log('valid :'+domain);
                $.post('<?php echo $siteurl;?>createGen.php', {team: team, forward_web: forward_web, forward_wap: forward_wap, use_landing: use_landing, 
                alter: alter, username: username, type: 'fakeurl', branch_key: branch_key, branch_domain: branch_domain, domain: domain, 
                forward_url: forward_url, fake_url: fake_url, country: country, country_block: country_block, bitly_key: bitly_key, bitly_domain: bitly_domain
                }, function(response){ 
                    // console.log(response);
                    var genurl = "",
                        jsonGenurl = JSON.parse(response.genurl);
                    for(var i=0; i<jsonGenurl.length; i++) {
                        genurl += jsonGenurl[i]+"\n";
                    }
                    var wowinth = "",
                        jsonWow = JSON.parse(response.wowinth);
                    for(var i=0; i<jsonWow.length; i++) {
                        wowinth += jsonWow[i]+"\n";
                    }
                    var branchio = "",
                        jsonBranch = JSON.parse(response.branchio);
                    for(var i=0; i<jsonBranch.length; i++) {
                        branchio += jsonBranch[i]+"\n";
                    }
                    // var caption = "",
                    //     jsonCaps = JSON.parse(response.caption);
                    // for(var i=0; i<jsonCaps.length; i++) {
                    //     caption += jsonCaps[i]+"\n";
                    // }
                    var fbl2 = "",
                        jsonFbl2 = JSON.parse(response.fbl);
                    for(var i=0; i<jsonFbl2.length; i++) {
                        fbl2 += jsonFbl2[i]+"\n";
                    }
                    var fbr2 = "",
                        jsonFbr2 = JSON.parse(response.fbr);
                    for(var i=0; i<jsonFbr2.length; i++) {
                        fbr2 += jsonFbr2[i]+"\n";
                    }
                    var linkig2 = "",
                        jsonLinkig2 = JSON.parse(response.linkig);
                    for(var i=0; i<jsonLinkig2.length; i++) {
                        linkig2 += jsonLinkig2[i]+"\n";
                    }
                    $('#genurl2').val(genurl+$('#genurl2').val());
                    $('#branchio2').val(branchio+$('#branchio2').val());
                    $('#wowinth2').val(wowinth+$('#wowinth2').val());
                    $('#fbl2').val(fbl2+$('#fbl2').val());
                    $('#fbr2').val(fbr2+$('#fbr2').val());
                    $('#linkig2').val(linkig2+$('#linkig2').val());
                });
            }
        }
        console.log(forward_url);
    });

    $('#createGen3').click(function(){
        var domain = $('#domain').val(),
            forward_url = {},
            forward_web = {},
            forward_wap = {},
            branch_key = $('#branch_key').val(),
            branch_domain = $('#branch_domain').val(),
            bitly_key = $('#bitly_key').val(),
            bitly_domain = $('#bitly_domain').val(),
            // custom_title = $('#custom_title').val(),
            custom_title = $('#custom_title').val(),
            custom_description = $('#custom_description').val(),
            custom_keywords = $('#custom_keywords').val(),
            custom_image = $('#custom_image').val(),
            country = $('#country').val(),
            country_block = $('#country_block').val(),
            app_id = $('#app_id').val(),
            alter = $('#alter:checked').val(),
            checkBox = document.getElementById("use_landing"),
            amount = $('#amount').val(),
            username = $('#username').val(),
            team = $('#team').val();
        
            if( amount > 20 ) {
                amount = 20;
            }

        if (checkBox.checked == true){
            use_landing = "on";
        } else {
            use_landing = "off";
        }

        $('.forward_url').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_url_country_' + i).val();
            if( !(ctr in forward_url) ) {
                forward_url[ctr] = new Array();
            }
            
            forward_url[ctr].push($('#forward_url_' + i).val());
        });
        $('.forward_web').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_web_country_' + i).val();
            if( !(ctr in forward_web) ) {
                forward_web[ctr] = new Array();
            }
            forward_web[ctr].push( $('#forward_web_' + i).val() );
        });
        $('.forward_wap').each((i, obj) => {
            // console.log(i);
            var ctr = $('#forward_wap_country_' + i).val();
            if( !(ctr in forward_wap) ) {
                forward_wap[ctr] = new Array();
            }
            forward_wap[ctr].push ( $('#forward_wap_' + i).val() );
        });

        forward_url = JSON.stringify(forward_url);
        forward_web = JSON.stringify(forward_web);
        forward_wap = JSON.stringify(forward_wap);

        $("#result3").html('<div class="panel panel-default"><div class="panel-body">'+
        '<textarea id="genurl3"  type="text"  class="form-control mb-2" onclick=\'copyToClipboard("genurl3")\' rows="3" ></textarea>'+
        '<textarea id="branchio3"  type="text" class="form-control mb-2" onclick=\'copyToClipboard("branchio3")\' rows="3" ></textarea>'+
        '<textarea id="wowinth3"  type="text" class="form-control mb-2" onclick=\'copyToClipboard("wowinth3")\' rows="3" ></textarea>'+
        '<textarea id="fbl3"  type="text" class="form-control mb-2"  onclick=\'copyToClipboard("fbl3")\' ></textarea>'+
        '<textarea id="fbr3"  type="text" class="form-control mb-2"  onclick=\'copyToClipboard("fbr3")\' ></textarea>'+
        '<textarea id="shared" class="form-control mb-2" onclick=\'copyToClipboard("shared")\'></textarea>'+
        '<textarea id="linkig3" type="text" class="form-control mb-2"  onclick=\'copyToClipboard("linkig3")\' ></textarea>'+
        '</div></div>');
        for(var am=0;am<amount;am++) {
            if ( forward_url != '' ) {
                console.log('valid :'+domain);
                $.post('<?php echo $siteurl;?>createGen.php', {amount: amount, team: team, forward_web: forward_web, forward_wap: forward_wap, use_landing: use_landing, alter: alter, username: username, type: 'content', branch_key: branch_key, branch_domain: branch_domain, 
                    domain: domain, forward_url: forward_url, custom_title: custom_title, custom_description: custom_description, custom_keywords: custom_keywords, 
                    custom_image: custom_image, country: country, country_block: country_block, app_id: app_id, bitly_key: bitly_key, bitly_domain: bitly_domain
                }, function(response){ 
                    // console.log(response);
                    var genurl = "",
                    jsonGenurl = JSON.parse(response.genurl);
                    wowinth = JSON.parse(response.wowinth);
                    fbl = JSON.parse(response.fbl);
                    fbr = JSON.parse(response.fbr);
                    for(var i=0; i<jsonGenurl.length; i++) {
                        genurl += jsonGenurl[i]+"\n";
                    }
                    var branchio = "",
                        jsonBranch = JSON.parse(response.branchio);
                    for(var i=0; i<jsonBranch.length; i++) {
                        branchio += jsonBranch[i]+"\n";
                    }

                    var fbl3 = "",
                        jsonFbl3 = JSON.parse(response.fbl);
                    for(var i=0; i<jsonFbl3.length; i++) {
                        fbl3 += jsonFbl3[i]+"\n";
                    }
                    var fbr3 = "",
                        jsonFbr3 = JSON.parse(response.fbr);
                    for(var i=0; i<jsonFbr3.length; i++) {
                        fbr3 += jsonFbr3[i]+"\n";
                    }

                    var linkig3 = "",
                        jsonLinkig3 = JSON.parse(response.linkig);
                    for(var i=0; i<jsonLinkig3.length; i++) {
                        linkig3 += jsonLinkig3[i]+"\n";
                    }

                    $('#genurl3').val(genurl+$('#genurl3').val());
                    $('#branchio3').val(branchio+$('#branchio3').val());
                    $('#wowinth3').val(wowinth+$('#wowinth3').val());
                    $('#fbl3').val(fbl3+$('#fbl3').val());
                    $('#fbr3').val(fbr3+$('#fbr3').val());
                    $('#linkig3').val(linkig3+$('#linkig3').val());
                    $('#shared').val($('#shared').val()+'https://www.facebook.com/dialog/feed?app_id='+app_id+'&link='+encodeURI(genurl)+'&display=page');
                    
                    
                });
            }
        }
        console.log(forward_url);
    });
    
    
});

function copyToClipboard(id) {
    var textBox = document.getElementById(id);
    textBox.select();
    document.execCommand("copy");
}

function checkLimit() {
    var username = $('#username').val();
    $.post('<?php echo $siteurl;?>checklimit.php', {username: username}, function(response){
        if(response == false) {
            $('#genform').html("Anda sudah melebihi batas generate link.");
        }
    });
}

// setInterval(function() {
//     checkLimit();
// }, 60000);

var myDomain = document.getElementById('mydomain'),
    sysDomain = document.getElementById('sysdomain'),
    domain = document.getElementById('domain');

myDomain.addEventListener("change", function(){
    sysDomain.selectedIndex  = 0;
    domain.value = myDomain.value;
});

sysDomain.addEventListener("change", function(){
    myDomain.selectedIndex = 0;
    domain.value = sysDomain.value;
});

var fileTag = document.getElementById("custom_image_file"),
    preview = document.getElementById("thumbnail");
    
fileTag.addEventListener("change", function() {
  changeImage(this);
});

function changeImage(input) {
  var reader;

  if (input.files && input.files[0]) {
    reader = new FileReader();

    reader.onload = function(e) {
      preview.setAttribute('src', e.target.result);

      var file_data = $('#custom_image_file').prop('files')[0];
        var form_data = new FormData();  // Create a FormData object
        form_data.append('file', file_data);  // Append all element in FormData  object

        $.ajax({
                url         : 'uploadImage.php',     // point to server-side PHP script 
                dataType    : 'text',           // what to expect back from the PHP script, if anything
                cache       : false,
                contentType : false,
                processData : false,
                data        : form_data,                         
                type        : 'post',
                success     : function(output){
                    // alert(output);              // display response from the PHP script, if any
                    $("#custom_image").val(output);
                    preview.setAttribute('src', output);
                }
         });

    }

    reader.readAsDataURL(input.files[0]);
  }

    

    
}

function check_multifile_logo(file) {
    var extension = file.substr((file.lastIndexOf('.') + 1))
    if (extension === 'jpg' || extension === 'jpeg' || extension === 'gif' || extension === 'png' || extension === 'bmp') {
        return true;
    } else {
        return false;
    }
}

function base64ToBlob(base64, mime) 
{
    mime = mime || '';
    var sliceSize = 1024;
    var byteChars = window.atob(base64);
    var byteArrays = [];

    for (var offset = 0, len = byteChars.length; offset < len; offset += sliceSize) {
        var slice = byteChars.slice(offset, offset + sliceSize);

        var byteNumbers = new Array(slice.length);
        for (var i = 0; i < slice.length; i++) {
            byteNumbers[i] = slice.charCodeAt(i);
        }

        var byteArray = new Uint8Array(byteNumbers);

        byteArrays.push(byteArray);
    }

    return new Blob(byteArrays, {type: mime});
}



</script>



</body>
</html>