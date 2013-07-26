<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/general.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/style.css" />


<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

<!-- new add by coding -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link type="image/x-icon" rel="shortcut icon" href="http://www.yibada.com/clients/GoToBusTours/images/favicon.ico"/>
<link href="catalog/view/theme/gotobus/image/favicon.ico" rel="shortcut icon">

<script>
function drop_mouseover(pos){
 try{window.clearTimeout(timer);}catch(e){}
}
function drop_mouseout(pos){
 var posSel=document.getElementById(pos+"Sel").style.display;
 if(posSel=="block"){
  timer = setTimeout("drop_hide('"+pos+"')", 1000);
 }
}
function drop_hide(pos){
 document.getElementById(pos+"Sel").style.display="none";
}
function search_show(pos,searchType,href){
    document.getElementById(pos+"SearchType").value=searchType;
    document.getElementById(pos+"Sel").style.display="none";
    document.getElementById(pos+"Slected").innerHTML=href.innerHTML;
    document.getElementById(pos+'q').focus();
    var sE = document.getElementById("searchExtend");
    if(sE != undefined  &&  searchType == "bar"){
     sE.style.display="block";
    }else if(sE != undefined){
     sE.style.display="none";
    }
 try{window.clearTimeout(timer);}catch(e){}
 return false;
}
</script>

<script type="text/javascript">
window.onload=function(){
  currentUrl = window.location.href;
  //lastChar = currentUrl.slice(-1);
  lastChar = currentUrl.slice(-8);

  $("a.navItem").each(function(){
    $(this).removeClass("current");
    href = $(this).attr("href");
    if(lastChar == href.slice(-8))
    {
      $(this).addClass("current");
    }
  });
};
</script>


<!-- new add by coding -->

<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div class="wrapper">
<div class="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>

  <div class="headerright">
              <div class="headerinfo">
                  <div class="limit">Tickets Only For Adults</div>
                  <div class="tel"><?php echo $this->config->get('config_telephone');?> </div>                 
              </div>
              <div class="nav">
                  <ul>
                        <li ><a href="index.php?route=information/information&information_id=5" class="navItem">Contact Us</a></li>
                        <li><a href="index.php?route=information/information&information_id=3" class="navItem">Ticket Policy</a></li>
                        <li><a href="index.php?route=module/blog" class="navItem">Bus Station</a></li>
                        <li><a href="index.php?route=information/information&information_id=6" class="navItem">Bus Schedule</a></li>
                        <li><a href="index.php?route=information/information&information_id=4" class="navItem">About Us</a></li>
                        <li><a href="index.php" class="navItem">Home</a></li>
                    </ul>
              </div>
              <div class="clear"></div>
  </div>

</div>

<div id="notification"></div>
