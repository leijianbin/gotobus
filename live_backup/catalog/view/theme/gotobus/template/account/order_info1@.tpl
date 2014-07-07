<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>Order Information</title>
<!--<base href="http://localhost/opencart/gotobus/" />
<link href="http://localhost/opencart/gotobus/image/data/cart.png" rel="icon" />
-->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/general.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/gotobus/stylesheet/style.css" />


<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

<!-- new add by coding -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link type="image/x-icon" rel="shortcut icon" href="http://www.yibada.com/clients/GoToBusTours/images/favicon.ico"/>
<link href="catalog/view/theme/gotobus/image/favicon.ico" rel="shortcut icon">


<script type="text/javascript" src="catalog/view/javascript/common.js"></script>

</head>

<script>
$(document).ready(function() {
    // Stuff to do as soon as the DOM is ready;
    $("#print").click(function(){
            print();
        });
});


</script>

<?php 
//print_r($products);
?>

<body>
	<div class="wrapper">
    	
        <div class="clear"></div>
        <div class="contentsubpage">
        <div class=" contentopacity1">
        
          <div class="print">
          	<div class="box1"><a id="print" href="#">Print</a></div>
            <div class="clear"></div>
            <div class="box2">
                <ul>
                    <li>Dear<strong>&nbsp;<?php echo $firstname;?>&nbsp;<?php echo $lastname;?>&nbsp;</strong>( Tel : <?php echo $telephone;?> )</li>
                    <li><span class="blue">Total charged amount :</span><span class="red"> $<?php echo (int)$total;?></span></li>
                    <li>Here is your bus e-Tickets from gotobustour.com to redeem, please bring a printout of this ticket along with a valid photo ID.</li>
                    <li><span class="blue">REMARKS :</span> Ptease show your e-ticket or confirmation number to obtain your Boarding Pass from your departure office.</li>
                    <li><strong>E-Ticket Details</strong></li>
                    <li><span class="blue">Bus Route : </span><?php echo $products[0]['name'];?></li>
                    <li><span class="blue">Number of Passengers :</span> <?php echo $products[0]['quantity'];?></li>
                </ul>
            </div></br>
            
            <?php foreach ($products as $product) {
            ?>
            <div class="box3">
            	<ul>
                	<li class="title" style="margin-left:0;">Go To Bus Tour Ticket</li>
                    <li class="tiketdet"><span>Customer : </span><?php echo $firstname;?>&nbsp;<?php echo $lastname;?></li>
                    <li class="tiketdet"><span>Confirmation Number :</span> <?php echo $invoice_no;?></li>
                    <li class="tiketdet"><?php echo $product['name']?> (Schedule lD: <?php echo $product['model']?>)</li>
                    <li class="tiketdet"><span>Date :</span> <?php echo $product['departure_date'];?></li>
                    <li class="tiketdet"><span>Departure :</span> (<?php echo $product['departure_time'];?> <?php echo $product['departure_station'];?>)</li>
                    <li class="tiketdet"><span>Arrival :</span> (<?php echo $product['arrive_time'];?> <?php echo $product['arrive_station'];?>)</li>
                </ul>
            </div></br></br>
            <?php }?>

            <div class="box4">
            	<div class="title"> 
                <ul>
                	<li class="left">Departures and Arrivals</li>
                	
                <div class="clear"></div>
                </ul>
                <div class="clear"></div>                </div>
                <ul class="someinfo">
                	<li class="someinfoco">Departures :</li>
                    <li style="margin-bottom:14px;"><?php echo $products[0]['departure_time'];?> <?php echo $products[0]['departure_station'];?></li>
                    <li class="someinfoco">Estimated Arrivals :</li>
                    <li><?php echo $products[0]['arrive_time'];?> <?php echo $products[0]['arrive_station'];?></li>
                </ul>
            </div></br></br>
            <div class="box5">
            	<div class="title">Terms, Conditions and contact lnfo</div>
                <ul class="someinfo">
                	<li>1. Ptease bring a valid lD and this e-ticket with your signature to board this bus</li>
                    <li>2. Please arrive 20 minutes before departure, or you lose reservation priority.</li>
                    <li>3. Tickets are not refundable or exchangeabte, canceltation incurs 100% penalty</li>
                    <li>4. For questions, ptease call customer service at 716-835-7835</li>
                </ul>
            </div></br></br>
            <div class="box6">
            	<div class="sinage">
                <label for="sinage">Signature :</label>
           		</div>
            <div class="line"></div>
            
            
            <div class="clear"></div>
            </div>
            <div class="box7">Have a nice trip !</div>
          </div>
          <div class="clear"></div>          
        </div>
        </div> 
        <div class="clear"></div>
        </div>
<?php echo $footer; ?>