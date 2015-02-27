<script language="JavaScript1.2"> 

$(function(){ 

var isMobileVar=isMobile();

$('div.go_Login_Privacy').click(function(){
ga('send', 'event', 'Login/Register', 'Click', 'Privacy Statement');
});

$('a.go_Login_Forgot_Pass').click(function(){
ga('send', 'event', 'Login/Register', 'Click', 'Forgot your password?');
});

$('input.go_Login_Create').click(function (e,data){
if(!data){
ga('send', 'event', 'Login/Register', 'Click', 'Create now');
}
});

if( $('div.go_Reg_Error').length ){
ga('send', 'event', 'Login/Register', 'Register', 'Error');
}

if( $('p.go_Login_Error').length ){
ga('send', 'event', 'Login/Register', 'Sign in', 'Error | E-mail/Password');
}

if( $('div.TooManyRequests_error').length ){
ga('send', 'event', 'Login/Register', 'Sign in', 'Error | TooManyRequests');
}

if( $('div.err_randimg').length && $('div.err_randimg').hasClass('error')){
ga('send', 'event', 'Login/Register', 'Sign in', 'Error | Captcha');
}



$('.fb_error').fadeIn(1000);

$('.fb_button3').click(function(){
var $this=$(this);
if( $this.css('opacity') == '0.5' ) return false;

$('.fb_error').css('visibility','hidden');
$this.css('opacity','0.5');
//  $this.attr('disabled','1');
//  $this.find('b').css('width',$this.find('b').width()).html('Loading...');
$this.find('span').html('LoadingÎíÎõ');

});

var past_width = $(window).width();
var past_height = $(window).height();
var doit;

$( window ).resize(function() {

if( $('.p8-reg').hasClass('offv')){
return true; 
} 

clearTimeout(doit);
doit = setTimeout(function() {
var width=$(window).width();
var height=$(window).height();

if ( width != past_width || past_height){
past_width = width;
past_height= height;
$('#signInSignUp').trigger('click',['resize']);
}

}, 100);
});

$('#signInSignUp').click(function (e,data){
var hl=$('.p8-login').height();

var $p_bg=$('.p8-bg');
var $p_reg=$('.p8-reg');
var $p_login=$('.p8-login');

$p_login.addClass('offv');
$p_reg.removeClass('offv');


//  alert(hr);alert($('body').get(0).offsetHeight);alert($p_bg.offset().top);

var h=$('body').get(0).offsetHeight/2-$p_reg.height()/2;
var w=$p_bg.outerWidth()/2-$p_reg.outerWidth()/2;

if($('body').outerWidth() < $p_bg.outerWidth()){
w=$('body').outerWidth()/2-$p_reg.outerWidth()/2;
}

h=h-250;

if(w<15){
w=15;
}

if(h<-105){
h=-105;
}
//    alert($p_reg.position().top+' '+h);

if(h>$p_login.position().top){
h=$p_login.position().top;
}

$p_reg.css({'left':w+'px','top':h+'px'});

if( data != 'resize' ){

$(document).bind('keydown.myEvents',function(e){
var code = e.keyCode ? e.keyCode : e.which;
if(code == 27){
$('.signUpCancel').trigger('click');
return false;
}
});

if(!isMobileVar){
$('#reg_form input[name=LOGIN]').trigger('focus');
}
}

//  if(hl>hr){
//    $('.p8-reg h2').height($('.p8-reg h2').height()+hl-hr);
//    $('.p8-reg input[name=css_height]').val($('.p8-reg h2').height());
//  }
return false;
});

$('.signUpCancel,.signUpRegCancel,.b-close').click(function (){
$('.p8-login').removeClass('offv');
$('.p8-reg').addClass('offv');
$('.signUpRegCancel').addClass('off');  
$('.signUpCancel').removeClass('off');

$('.p8-reg h2').css({'height':'auto'});

if(!isMobileVar){
$('#login2 input[name=user]').trigger('focus');
}

$(document).unbind('keydown.myEvents');

ga('send', 'event', 'Login/Register', 'Click', 'Cancel');

return false;
});

if( document.location.hash == '#signup' || "" ){
$('.p8-reg').addClass('offv');
$('.p8-login').addClass('offv');
$('.signUpRegCancel').removeClass('off');  
$('.signUpCancel').addClass('off');
$('#reg_form').attr('action',$('#reg_form').attr('action')+document.location.hash);
}

if( $('.p8-bg').attr('stage') == 'reg' ){
$('.p8-login').addClass('offv');
$('.p8-reg').addClass('offv');
//    $('.p8-reg').removeClass('off');
}

if($('#login2 input[name=password]').val()){
$('#login2 .psw').trigger('focus');
$('#login2 input[name=password]').trigger('blur');
}


$('select[name=secret_question_select]').bind('change',function(e,data){

var $this=$(this);
var $span=$this.closest('span');
var $b=$span.find('b');

//    var form=$('#reg_form').get(0);

if( $this.val() ) { 
$b.addClass('focus');
}else{
$b.removeClass('focus');
$('#reg_form .question_error').removeClass('error');
$('#reg_form .answer_error').removeClass('error');
}

if( $this.val() == 'secret_question_other'){
$("div.secret_question_other_block").removeClass('off');

if(!data){
$('div.secret_question_other_block input').focus();
}

}else{
$("div.secret_question_other_block").addClass('off');
}



});


$(window).load(function () {

if( $('.p8-bg').attr('stage') == 'reg'  || document.location.hash == '#signup' || "" ){

$('.p8-login').removeClass('offv');
$('.p8-reg').addClass('offv');

$('#signInSignUp').trigger('click',[1]);
$('select[name=secret_question_select]').trigger('change',[1]);

}

});


function setCookie(name, value, options) {
options = options || {};

var expires = options.expires;

if (typeof expires == "number" && expires) {
var d = new Date();
d.setTime(d.getTime() + expires*1000);
expires = options.expires = d;
}
if (expires && expires.toUTCString) { 
options.expires = expires.toUTCString();
}

value = encodeURIComponent(value);

var updatedCookie = name + "=" + value;

for(var propName in options) {
updatedCookie += "; " + propName;
var propValue = options[propName];    
if (propValue !== true) { 
updatedCookie += "=" + propValue;
}
}
//  alert(updatedCookie);
document.cookie = updatedCookie;
}

function deleteCookie(name) {
setCookie(name, "", { path: '/', expires: -1 })
}

function validPass(str){

if(str.length<8)return 0;

var r=new RegExp("^[a-zA-ZÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎé0-9_~!@#\\$%\\^&*(){}\\[\\];:'\"|\\\\\\/<>,.?+-]+$").test(str);

if (!r) return 0;

if( new RegExp(/[A-ZÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎé]+/).test(str) && new RegExp(/[0-9]+/).test(str)){
return 1;
}

return 0;
}

function submit_disabled(form,on){

$('input[type=submit]').each(function(){
$(this).attr('disabled',on).addClass('loading');
});

};  

function error_auth(id){

$('.error_auth').hide();
$('.'+id).removeClass('off').show();

}

function error_reg(id,$err){

if (id == 'email_not_null'){
if($err){
$('.'+id).html("Please enter your correct e-mail address");
}else{
$('.'+id).html("Registration confirmation will be sent to your email.");
}
}

if($err){
$('.'+id).addClass('error').removeClass('ready');
}else{
$('.'+id).removeClass('error').addClass('ready');
}
}

$('#reg_form input[name=LOGIN]').bind('change cut paste', function(){

check_login($('#reg_form').get(0));

});

$('#reg_form input[name=LOGIN]').bind('keyup', function(){

if( $('#reg_form .email_not_null').hasClass('error')|| $('#reg_form .email_not_null').hasClass('ready') ){
check_login($('#reg_form').get(0));
}

});

$('#reg_form input[type=password]').bind('keyup change cut paste', function(){

check_password($('#reg_form').get(0));

});

$('#reg_form input[name=needack_reg]').bind('change cut paste', function(){

check_needack_reg($('#reg_form').get(0));

});

$('#reg_form input[name=secret_question_answer],#reg_form input[name=secret_question_other]').bind('change', function(){

if( $('#reg_form .answer_error').hasClass('error')|| $('#reg_form .answer_error').hasClass('ready') || $('#reg_form .question_error').hasClass('error')|| $('#reg_form .question_error').hasClass('ready') ){
check_question($('#reg_form').get(0));
}

});

$('#reg_form input[name=needack_reg]').bind('keyup', function(){

if( $('#reg_form .err_randimg_reg').hasClass('error')|| $('#reg_form .err_randimg_reg').hasClass('ready') ){
check_needack_reg($('#reg_form').get(0));
}

});

$('#login2 input[name=needack]').bind('change cut paste', function(){

check_needack_auth($('#login2').get(0));

});

$('#login2 input[name=needack]').bind('keyup', function(){

if( $('#login2 .err_randimg').hasClass('error')|| $('#login2 .err_randimg').hasClass('ready') ){
check_needack_auth($('#login2').get(0));
}

});

$('input[type=checkbox]').click(function(){
var file_label=$(this).next();
//    alert(file_label.html());
file_label.trigger('click');
});


function check_login(form){

$('#reg_form .email_not_null').removeClass('error').removeClass('ready');

//    if( !form.LOGIN || form.LOGIN.value.length==0 || form.LOGIN.value=='Enter your e-mail' || ! new RegExp('^[0-9a-zA-Z%](?!(\.@))((\.[0-9a-zA-Z%+_-])|([0-9a-zA-Z%+_-]))*@([0-9a-zA-Z][0-9a-zA-Z-]*[0-9a-zA-Z]+\.)+([0-9a-zA-Z-]){2,6}$').test(form.LOGIN.value)) {
if( !form.LOGIN || form.LOGIN.value.length==0 || form.LOGIN.value=='Enter your e-mail' || ! new RegExp(/^[a-z0-9\!\#\$\%\&\'\*\+\/\=\?\^\_\`\{\|\}\~\-]+(?:\.[a-z0-9\.\!\#\$\%\&\'\*\+\/\=\?\^\_\`\{\|\}\~\-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[a-z]{2,6})$/i).test(form.LOGIN.value)) {
error_reg('email_not_null',true); 
return false;
}else{
error_reg('email_not_null',false); 
}

return true;
}

function check_needack_auth(form){

$('#login2 .err_randimg').removeClass('error').removeClass('ready');

if( form.needack.value.length!=4 || form.needack.value == form.needack.getAttribute('def') || ! new RegExp("^[a-zA-Z0-9]+$").test(form.needack.value) ) { 
error_reg('err_randimg',true); 
return false;
}else{
error_reg('err_randimg',false); 
}                                                                                                                     

return true;
}                           

function check_needack_reg(form){

$('#reg_form .err_randimg_reg').removeClass('error').removeClass('ready');

if( form.needack_reg.value.length!=4 || form.needack_reg.value == form.needack_reg.getAttribute('def') || ! new RegExp("^[a-zA-Z0-9]+$").test(form.needack_reg.value) ) { 
error_reg('err_randimg_reg',true); 
return false;
}else{
error_reg('err_randimg_reg',false); 
}                                                                                                                     

return true;
}


function check_password(form){

$('#reg_form .check_password li').removeClass('error').removeClass('ready');
var $return=true;
if( !form.PASSWD || form.PASSWD.value.length<8 || form.PASSWD.value=='Password' ) {
error_reg('password_len',true); 
$return=false;
}else{
error_reg('password_len',false); 
}

var dig=new RegExp("[0-9]").test(form.PASSWD.value);

if (!dig) {
error_reg('password_number',true); 
$return=false;
}else{
error_reg('password_number',false); 

}

if(! new RegExp("[a-zÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎé]").test(form.PASSWD.value) || ! new RegExp("[A-ZÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎéÎõÎé]").test(form.PASSWD.value) ){
error_reg('password_upper',true);           
$return=false;
}else{
error_reg('password_upper',false);

}

if(! validPass(form.PASSWD.value) || ! $return ){
error_reg('password_valid',true);
$return=false;
}else{
error_reg('password_valid',false);
}

if( !$return ){
return $return;
}

if( form.PASSWD2.value != form.PASSWD.value ){
error_reg('password_repeat',true); 
return false;
}else{
error_reg('password_repeat',false); 
}

return true;
}

function check_question(form){

$('#reg_form .question_error').removeClass('error');
$('#reg_form .answer_error').removeClass('error');

if( form.secret_question_select.selectedIndex == 5 && ( form.secret_question_other.value == '' || form.secret_question_other.value == form.secret_question_other.getAttribute('def') )) { 
error_reg('question_error',true); 
return false;
}                                                                                                                     

if( form.secret_question_select.selectedIndex > 0 && ( form.secret_question_answer.value == '' || form.secret_question_answer.value == form.secret_question_answer.getAttribute('def') )) { 
error_reg('answer_error',true); 
return false;
}                                                                                                                     

return true;
}


$('#reg_form').submit(function(){
var $form=$(this);

if( ! check_login(this) ){
this.LOGIN.focus();
return false;
}

if( ! check_password(this) ){
if( $('.password_repeat').hasClass('error')){
$(this.PASSWD2).prev().trigger('focus');
}else{
$(this.PASSWD).prev().trigger('focus');
}
return false;
}

if( ! check_question(this) ){
if( $('.answer_error').hasClass('error')){
this.secret_question_answer.focus();
}else{
this.secret_question_other.focus();
}
return false;
}


if( this.needack_reg){

if( ! check_needack_reg(this) ){
this.needack_reg.focus();
return false;
}

}

deleteCookie('path');
submit_disabled($form,true);

$form.unbind('submit');
$form.trigger('submit');
return false;
});


$('#login2').bind('submit',function(){

var $form=this;

var url='check_randimg';

if( $form.user.value.length==0 || $form.user.value == $form.user.getAttribute('def') ) { 
$($form.user).trigger('focus');
error_auth('err_auth'); 
return false; 
};

if( $form.password.value.length==0 || $form.password.value == $form.password.getAttribute('def') ) { 
error_auth('err_auth'); 
$($form.password).prev().trigger('focus');
return false; 
};

if( $form.needack){
if( ! check_needack_auth($form) ) { 
this.needack.focus();
return false;
};
}

submit_disabled($form,true);

submitAuth($form,true);
return false;

}); // end bind


function submitAuth(form,send){

form.failureUrl.value="index.html?error=1&logonSessionData=MyAccount&returnUrl=en%3Fsyst%3DMicrosoft%2520Windows%25207%25206.1.7601%2520Service%2520Pack%25201%2520Build%25207601%26pid%3Dkis%26version%3D15.0.0.463%26hotfix%3Da.b%26serial%3D%26lic-id%3D73186AC3-F483-45C4-99CB-70093AEDAF25%26ktype%3D5%26kcount%3D3%26kcreat%3D20150224T000000%26kexp%3D20160124T235959%26kinst%3D20150124T000000%26installid%3D%7B310E284A-F2E3-4810-9935-FDCFEEAC8943%7D%26installdate%3D1422074655&login="+escape(encodeURIComponent(form.user.value))+"&rememberMe="+encodeURIComponent(form.rememberMe.checked);
//  alert(form.failureUrl.value);
if(send){

var pass_valid=validPass(form.password.value);

//    alert(pass_valid);

if( pass_valid ){
deleteCookie('path');
}else{
setCookie('path',"ZW4/c3lzdD1NaWNyb3NvZnQlMjBXaW5kb3dzJTIwNyUyMDYuMS43NjAxJTIwU2VydmljZSUyMFBhY2slMjAxJTIwQnVpbGQlMjA3NjAxJnBpZD1raXMmdmVyc2lvbj0xNS4wLjAuNDYzJmhvdGZpeD1hLmImc2VyaWFsPSZsaWMtaWQ9NzMxODZBQzMtRjQ4My00NUM0LTk5Q0ItNzAwOTNBRURBRjI1Jmt0eXBlPTUma2NvdW50PTMma2NyZWF0PTIwMTUwMjI0VDAwMDAwMCZrZXhwPTIwMTYwMTI0VDIzNTk1OSZraW5zdD0yMDE1MDEyNFQwMDAwMDAmaW5zdGFsbGlkPXszMTBFMjg0QS1GMkUzLTQ4MTAtOTkzNS1GRENGRUVBQzg5NDN9Jmluc3RhbGxkYXRlPTE0MjIwNzQ2NTU=", { path: '/' } );
if(form.rememberMe){
if(form.rememberMe.checked){
form.rememberMe.disabled=false;
form.rememberMe.checked=false;
}
}
}

if(form.needack){form.needack.disabled=true;}
if(form.ri_session){form.needack.disabled=true;}
$(form).unbind('submit');
$(form).trigger('submit');
}else{
document.location=form.failureUrl.value+'&needack=1';
}
}

$('.info-txt font').hover(
function () { $(this).find('span').removeClass('off'); },
function () { $(this).find('span').addClass('off');  }
);

});

</script>
