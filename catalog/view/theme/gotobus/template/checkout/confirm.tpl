<?php if (!isset($redirect)) { ?>
<div class="checkout-product">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <!--<td class="model"><?php echo $column_model; ?></td>-->
        <td class="departure_date">Departure Date</td>
        <td class="customer">Customer</td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="price"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <?php
        echo "<pre>";
        print_r($product);
        echo "</pre>";
        ?>
        <td class="name"><?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <!--<td class="model"><?php echo $product['model']; ?></td> -->
        <td class="departure_date"><?php echo $product['departure_date']; ?>
          <?php 
          $dt=strtotime($product['departure_date']);
          $date = date('D',$dt);
          echo $date;
          ?>
        </td>
        <td class="customer"><?php echo $product['customer']; ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="price"><?php echo $product['price']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="model"></td>
        <td class="quantity">1</td>
        <td class="price"><?php echo $voucher['amount']; ?></td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="5" class="price"><b><?php echo $total['title']; ?>:</b></td>
        <td class="total"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<div class="payment"><?php echo $payment; ?></div>
<?php } else { ?>
<script type="text/javascript"><!--
//alert(<?php echo $departure_date;?>);
alert(<?php echo $redirect; ?>);
//location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>