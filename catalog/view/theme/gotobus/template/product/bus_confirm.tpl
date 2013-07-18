<?php echo $header; ?>

<?php 
//echo $bus_type;
//print "<pre>";
//print_r($product);
//print "</pre>";
//print "<pre>";
//print_r($product_return);
//print "</pre>";
/*print "</br>";
print_r($category_id);

print_r($category_arrival_id);
print "</br>";
print_r($search);
print "</br>";
print_r($categories);
*/
?>

<?php echo $column_left; ?>
<div id="notification"></div>


<div id="content-right">


<div class="subpageright">
   <div class="subpagebreadcrum">
       <a href="index.html">Home</a> > Confirm Tickets
   </div>
   <div class="confirmsheet">
       <div class="sheettitle">Confirm your Bus Tickets</div>
       <div class="ticketconfrim">
           <div class="sheetbox">
               <div class="boxtitle">Departure</div>
               <div class="boxdetail">
                   <ul>
                       <li>
                           <ul>
                               <li class="sheetleft">Line Name</li>
                               <li class="sheetright"><?php echo $product['line_name']?></li>
                               <li class="sheetleft">Line ID</li>
                               <li class="sheetright"><?php echo $product['line_id']?></li>
                           </ul>
                       </li>
                       <li>
                           <ul>
                               <li class="sheetleft">Departure Time</li>
                               <li class="sheetright"><?php echo $product['departure_date'] ?>&nbsp;<?php echo $product['departure_time'] ; ?></li>
                               <li class="sheetleft">Drive Time</li>
                               <?php 
                               $start = explode(" ", $product['departure_time']);
                               $arrive = explode(" ", $product['arrive_time']);
                               $last = intval($arrive[0]) - intval($start[0]); 
                               ?>
                               <li class="sheetright"><?php echo $last;?> (hours)</li>
                           </ul>
                       </li>
                       <li>
                           <ul>
                               <li class="sheetleft sheetwide1">Departure 
                                Station</li>
                                <li class="sheetright sheetwide2"><?php echo $product['departure_station']?><a href="index.php?route=module/blog" target="_blank">(map)</a></li>
                                   <li class="sheetleft sheetwide1">Arrival Station</li>
                                   <li class="sheetright sheetwide2"><?php echo $product['arrival_station']?><a href="index.php?route=module/blog" target="_blank">(map)</a></li>
                                </ul>
                            </li>
                            <li>
                               <ul>
                                   <li class="sheetleft">Tickets</li>
                                   <li class="sheetright"><?php echo $product['quantity']?></li>
                                   <li class="sheetleft">Price/Person</li>
                                   <li class="sheetright sheetspecialprice">$<?php echo intval($product['price'])?></li>
                               </ul>
                           </li>
                       </ul>
                   </div>
                   <div class="sheetinput">
                       <div class="sheetfillname"><span>*</span>Name</div>
                       <div class="sheetframe">
                           <ul>
                            <?php for($i = 0; $i < $product['quantity']; $i++) {?>
                               <li>
                                   <input class="fillinsheet" type="text" placeholder="input your name" value="" name="e" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true"> 
                               </li>
                            <?php }?>
                           </ul>
                       </div>
                   </div>
                   <div class="clear"></div>
               </div>
               <?php if( !empty($product_return) ){?>
               <div class="sheetbox">
                   <div class="boxtitle">Return</div>
                   <div class="boxdetail">
                       <ul>
                           <li>
                               <ul>
                                   <li class="sheetleft">Line Name</li>
                                   <li class="sheetright"><?php echo $product_return['line_name']?></li>
                                   <li class="sheetleft">Line ID</li>
                                   <li class="sheetright"><?php echo $product_return['line_id']?></li>
                               </ul>
                           </li>
                           <li>
                               <ul>
                                   <li class="sheetleft">Departure Time</li>
                                   <li class="sheetright"><?php echo $product_return['departure_date'] ?>&nbsp;<?php echo $product_return['departure_time'] ; ?></li>
                                   <li class="sheetleft">Drive Time</li>
                                   <?php 
                               $start = explode(" ", $product_return['departure_time']);
                               $arrive = explode(" ", $product_return['arrive_time']);
                               $last = intval($arrive[0]) - intval($start[0]); 
                               ?>
                                   <li class="sheetright"><?php echo $last;?> (hours)</li>
                               </ul>
                           </li>
                           <li>
                               <ul>
                                   <li class="sheetleft sheetwide1">Departure 
                                    Station</li>
                                    <li class="sheetright sheetwide2"><?php echo $product_return['departure_station']?><a href="index.php?route=module/blog" target="_blank">(map)</a></li>
                                       <li class="sheetleft sheetwide1">Arrival Station</li>
                                       <li class="sheetright sheetwide2"><?php echo $product_return['arrival_station']?><a href="index.php?route=module/blog" target="_blank">(map)</a></li>
                                    </ul>
                                </li>
                                <li>
                                	<ul>
                                       <li class="sheetleft">Tickets</li>
                                       <li class="sheetright"><?php echo $product_return['quantity']?></li>
                                       <li class="sheetleft">Price/Person</li>
                                       <li class="sheetright sheetspecialprice">$<?php echo intval($product_return['price'])?></li>
                                   </ul>
                               </li>
                           </ul>
                       </div>
                       <div class="sheetinput">
                           <div class="sheetfillname"><span>*</span>Name</div>
                           <div class="sheetframe">
                               <ul>
                            <?php for($i = 0; $i < $product_return['quantity']; $i++) {?>
                               <li>
                                   <input class="fillinsheet" type="text" placeholder="input your name" value="" name="e" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true"> 
                               </li>
                            <?php }?>
                               </ul>
                           </div>
                       </div>
                       <div class="clear"></div>
                   </div>
                   <div class="sheettotal">
                    <ul>
                        <li class="totalname">Tickets</li>
                        <li class="totalprice"><?php echo intval($product['quantity']*2)?></li>
                        <li class="totalname">Total Price</li>
                        <li class="totalprice">$<?php echo intval($product['quantity']) * intval($product['price']) + intval($product_return['quantity']) * intval($product_return['price']) ?></li>
                    </ul>
                    <div class="clear"></div>
               </div>
               <?php }?>
            </div>
            <div class="gotocheck"><a id = "gotocheckout" href="javascript:void(0);">Go To Check Out</a></div>
        </div> 
    </div>
</div>

</div>

<script type="text/javascript"><!--

$('#gotocheckout').bind('click', function() {

  var flag = false;

  $('.fillinsheet').each(function()
  {
      if($(this).val() == '')
      {
         flag = true;
      }
  });

  if(flag)
  {
    alert("Please fullfill all the passenger names.");
  }

  else
  {
    url = '<?php echo $addtochat;?>';
    location = url;
  }



});
</script>

<?php echo $footer; ?>