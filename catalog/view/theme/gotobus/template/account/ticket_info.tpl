<?php 
/*
echo $confirm_no;
print_r($productId);
echo " " . count($productId) . " ";
echo $order_id;
*/
if(count($productId) == 2)
    $roundTrip = true;
else 
    $roundTrip = false;

?>

<?php echo $header; ?>
<body>
	<div class="wrapper">    	
        <div class="clear"></div>
        <h1>Your ticket List:</h1>
        <div class="contentsubpage">
            <?php if ($roundTrip): ?>
                
            <?php endif ?>
            <div class=" contentopacity1">
                <a href="index.php?route=account/order/info&order_id=<?php echo $order_id;?>&product_id=<?php echo $productId[0]['product_id'];?>&confirm_no=<?php echo $confirm_no;?>" target="_blank">Print Your Departure Tickets</a>
            </div>

            <?php if ($roundTrip) { ?>
                <div class="contentopacity1">
                    <a href="index.php?route=account/order/info&order_id=<?php echo $order_id;?>&product_id=<?php echo $productId[1]['product_id'];?>&confirm_no=<?php echo $confirm_no;?>" target="_blank">Print Your Return Tickets</a>
                </div>
            <?php }?>
        </div>
        </div> 
        <div class="clear"></div>
        </div>
<?php echo $footer; ?>