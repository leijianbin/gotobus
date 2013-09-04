<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  
  <p><a href="index.php?route=account/order/ticket_info&order_id=<?php echo $order_id;?>&confirm_no=<?php echo $confirm_no;?>" target="_blank">View and Print your E-tickets.</a></p>

  <p>Please check your emailbox now.  We have sent you the e-tickets.</p>
  <!--
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button">Continue Shopping</a></div>
  </div>
  -->
  <?php echo $content_bottom; ?></div>
<div class="clear"></div>
<?php echo $footer; ?>