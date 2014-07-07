<?php 
//print_r($order_schedules);
//echo "<br/>";
//echo "<br/>";
//echo "<pre>";
//print_r($current_schedules);
//echo "</pre>";
//echo "<br/>";
//echo "<br/>";
echo "<pre>";
//print_r($products);
echo "</pre>";

$exit_schedules = array();

if($products)
{
  foreach ($products as $product) {
    $schedule_array = array();
    $schedule_array['name'] = $product['name'];
    $schedule_array['product_id'] = $product['product_id'];
    if(in_array($schedule_array,$current_schedules) && !in_array($schedule_array,$exit_schedules))
      $exit_schedules[]= $schedule_array;
  }
}

?>

<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <table class="form">
        <tr>
          <td><?php echo $entry_date_start; ?>
            <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="10" /></td>
          <td><?php echo $entry_date_end; ?>
            <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="10" /></td>

          <td>Schedule
            <select name="filter_order_schedule">
              <option value="0">Select All</option>
              <?php foreach ($order_schedules as $order_schedule) { ?>
              <?php if ($order_schedule['product_id'] == $filter_order_schedule) { ?>
              <option value="<?php echo $order_schedule['product_id'] ?>" selected="selected"><?php echo $order_schedule['name'] ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_schedule['product_id'] ?>"><?php echo $order_schedule['name'] ?></option>
              <?php } ?>

              <?php } ?>
            </select>
          </td>
          
          <td>Confrim No.
            <input type="text" name="filter_confirm_no" value="<?php echo $filter_confirm_no; ?>" id="confrim_no" size="10">
          </td>

          <td><?php echo $entry_status; ?>
            <select name="filter_order_status_id">
              <option value="0"><?php echo $text_all_status; ?></option>
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>

          <td style="text-align: right;"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
        </tr>
      </table>
      
      <?php foreach ($exit_schedules as $current_schedule) { 
            $subtotal = 0;
            $number = 0; 
            //print_r($current_schedule);
            if(true) {
      ?>
      <table class="list">
        <thead>
          <tr>
            <!-- <td class="left">ID</td> -->
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left">Customer</td>
            <td class="right">Departure Date</td>
            <td class="left">Confirmation No.</td>
            <td class="left">Satus</td>
            <td class="right"><?php echo $column_quantity; ?></td>
            <td class="right"><?php echo $column_total; ?></td>
            <td class="right">Sold Date</td>
            <td class="right">Action</td>
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { 
            
          ?>

          <?php if($product['name'] == $current_schedule['name']) { 
              $number = $number + 1;
            ?>
          <tr>
            <!-- <td class="left"><?php echo $product['product_id']; ?></td> -->
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left" style="font-weight: bold;"><?php echo $product['customer']; ?></td>
            <td class="right"><?php echo $product['departure_date']; ?></td>
            <td class="left" style="font-weight: bold;"><?php echo $product['confirm_no']; ?></td>
            <td class="left"><?php echo $product['ops_name']; ?></td>
            <td class="right"><?php echo $product['quantity']; ?></td>
            <td class="right"><?php echo $product['total']; ?></td>
            <td class="right"><?php echo $product['date_added']; ?></td>
            <td class="right"><?php foreach ($product['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
          </tr>
          <?php 
          $price = (int)str_replace( '$', '', $product['total']);
          $subtotal = $subtotal + $price; ?>
          <?php }?>
          
          <?php }?>
          <tr> <td>Sub Total: $<?php echo $subtotal; ?> </br> Quantity: <?php echo $number;?></td></tr>  
          <?php } else { ?>
          <tr>
            <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?> 
        </tbody>
        
      </table>

      <?php }} ?>

      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/product_purchased&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}

  var filter_confirm_no = $('input[name=\'filter_confirm_no\']').attr('value');
  
  if (filter_confirm_no) {
    url += '&filter_confirm_no=' + encodeURIComponent(filter_confirm_no);
  }
	
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
	
	if (filter_order_status_id != 0) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}	

  var filter_order_schedule = $('select[name=\'filter_order_schedule\']').attr('value');

  if (filter_order_schedule != 0) {
    url += '&filter_order_schedule=' + encodeURIComponent(filter_order_schedule);
  }

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
	
	$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<?php echo $footer; ?>