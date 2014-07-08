<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_greeting; ?></p>

  <?php
    if(count($productId) == 2)
        $roundTrip = true;
    else 
        $roundTrip = false;

    $departure_tickets = array();
    foreach ($d_tickets as $product) {
      foreach ($d_tickets_option as $orderOption) {
        $departure_tickets[] = array(
          'name'     => $product['name'],
          'model'    => $product['model'],
          'price'    => $orderOption['price'], 
          'departure_date'    => $orderOption['departure_date'],
          'departure_time'    => $product['departure_time'],
          'arrive_time'    => $product['arrive_time'],
          'arrive_station'    => $product['arrive_station'],
          'departure_station' => $product['departure_station'],
          'customer'      => $orderOption['customer'],
          'confirm_no'      => $orderOption['confirm_no'],
          'status'    => $orderOption['status']
          );
      }
    }
    if($roundTrip)
    {
      $arrive_tickets = array();
      foreach ($a_tickets as $product) {
        foreach ($a_tickets_option as $orderOption) {
          $arrive_tickets[] = array(
            'name'     => $product['name'],
            'model'    => $product['model'],
            'price'    => $orderOption['price'], 
            'departure_date'    => $orderOption['departure_date'],
            'departure_time'    => $product['departure_time'],
            'arrive_time'    => $product['arrive_time'],
            'arrive_station'    => $product['arrive_station'],
            'departure_station' => $product['departure_station'],
            'customer'      => $orderOption['customer'],
            'confirm_no'      => $orderOption['confirm_no'],
            'status'    => $orderOption['status']
            );
        }
      }
    }
    // print "<pre>";
    // print_r($d_tickets);
    // print "</pre>"; 
    // print "<pre>";
    // print_r($d_tickets_option);
    // print "</pre>"; 
    // print "<pre>";
    // print_r($departure_tickets);
    // print "</pre>"; 
    // print "<pre>";
    // print_r($a_tickets);
    // print "</pre>"; 
    // print "<pre>";
    // print_r($a_tickets_option);
    // print "</pre>"; 
    // print "<pre>";
    // print_r($arrive_tickets);
    // print "</pre>"; 
    //print_r($productId);
    //echo " " . count($productId) . " ";

  ?>

  <?php if ($customer_id) { ?>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_link; ?></p>
  <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $link; ?>"><?php echo $link; ?></a></p>
  <?php } ?>
  <?php if ($download) { ?>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_download; ?></p>
  <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $download; ?>"><?php echo $download; ?></a></p>
  <?php } ?>
  <!--<table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;" colspan="2"><?php echo $text_order_detail; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
          <b><?php echo $text_confirm_no; ?></b> <?php echo $confirm_no; ?><br />
          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
          <?php if ($shipping_method) { ?>
          <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
          <?php } ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_email; ?></b> <?php echo $email; ?><br />
          <b><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br />
          <b><?php echo $text_ip; ?></b> <?php echo $ip; ?><br /></td>
      </tr>
    </tbody>
  </table>
  -->
  <?php if ($comment) { ?>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_instruction; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $comment; ?></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <!--<table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_shipping_address; ?></td>
        <?php } ?>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $shipping_address; ?></td>
        <?php } ?>
      </tr>
    </tbody>
  </table>
  -->
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_product; ?></td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_model; ?></td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_quantity; ?></td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_price; ?></td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['model']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['quantity']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['price']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="4"><b><?php echo $total['title']; ?>:</b></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
  <p style="font-weight: bold;">Your Departure Tickets</p>

    <?php foreach ($departure_tickets as $product) {
            ?>
            <div class="box3">
              <ul>
                    <li class="tiketdet"><span>Customer : </span><?php echo $product['customer'];?></li>
                    <li class="tiketdet"><span>Confirmation Number :</span> <?php echo $product['confirm_no'];?></li>
                    <li class="tiketdet"><span>Bus Route : </span><?php echo $product['name']?> (Schedule lD: <?php echo $product['model']?>)</li>
                    <li class="tiketdet"><span>Date :</span> <?php echo $product['departure_date'];?></li>
                    <li class="tiketdet"><span>Departure :</span> (<?php echo $product['departure_time'];?> <?php echo $product['departure_station'];?>)</li>
                    <li class="tiketdet"><span>Arrival :</span> (<?php echo $product['arrive_time'];?> <?php echo $product['arrive_station'];?>)</li>
                    <li class="tiketdet"><span>Status : </span><?php echo $product['status'];?></li>
                </ul>
            </div></br></br>
    <?php }?>

<?php if($roundTrip) {?>
  <p style="font-weight: bold;">Your Return Tickets</p>
  <?php foreach ($arrive_tickets as $product) {
            ?>
            <div class="box3">
              <ul>
                    <li class="tiketdet"><span>Customer : </span><?php echo $product['customer'];?></li>
                    <li class="tiketdet"><span>Confirmation Number :</span> <?php echo $product['confirm_no'];?></li>
                    <li class="tiketdet"><span>Bus Route : </span><?php echo $product['name']?> (Schedule lD: <?php echo $product['model']?>)</li>
                    <li class="tiketdet"><span>Date :</span> <?php echo $product['departure_date'];?></li>
                    <li class="tiketdet"><span>Departure :</span> (<?php echo $product['departure_time'];?> <?php echo $product['departure_station'];?>)</li>
                    <li class="tiketdet"><span>Arrival :</span> (<?php echo $product['arrive_time'];?> <?php echo $product['arrive_station'];?>)</li>
                    <li class="tiketdet"><span>Status : </span><?php echo $product['status'];?></li>
                </ul>
            </div></br></br>
    <?php }?>
<?php }?>
  
  <p style="font-weight: bold;">Please Print your E-ticket from following Link:</p>
  <p style="font-size: 18px;"><a href="<?php echo $base;?>index.php?route=account/order/ticket_info&order_id=<?php echo $order_id;?>&confirm_no=<?php echo $confirm_no;?>" target="_blank">View and Print your E-tickets.</a></p>

  <p style="margin-top: 0px; margin-bottom: 20px;">Contact us at 1866-848-5888</p>
</div>
</body>
</html>
