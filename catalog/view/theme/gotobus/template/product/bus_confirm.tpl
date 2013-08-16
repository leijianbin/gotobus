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
print_r($product);

?>

<?php echo $column_left; ?>
<div id="notification"></div>


<div id="content-right">


  <div class="subpageright">

   <div class="heading_title">
       <a href="#">Home</a> &gt;  Choose Time &gt;  Confirm Tickets
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
                            <?php 
                               $start = explode(" ", $product['departure_time']);
                               $arrive = explode(" ", $product['arrive_time']);

                               $starthour = explode(":", $start[0]);
                               $arrivehour = explode(":", $arrive[0]);
                               //var_dump($starthour); 
                               //echo $starttime = intval($start[0]);
                               if($start[1]=="PM"&&$arrive[1]=="AM")
                               {
                                  $arrivetime = intval($arrivehour[0]) + 24;
                                  $starttime = intval($start[0]) + 12;
                                  $arrive_date  = strtotime($product['departure_date']) + 3600*24;
                                  $product['arrive_date'] = date('Y-m-d',$arrive_date);
                               }
                               else if($start[1]=="AM"&&$arrive[1]=="PM")
                               {
                                  $arrivetime = intval($arrivehour[0]) + 12;
                                  $starttime = intval($start[0]);
                                  $product['arrive_date'] = $product['departure_date'];
                               }                         
                               else
                               {
                                  $arrivetime = intval($arrivehour[0]);
                                  $starttime = intval($start[0]);
                                  $product['arrive_date'] = $product['departure_date'];
                               }
                               //echo $arrivetime;
                               //echo $starttime;
                               $lasthour = intval( (( $arrivetime * 60 + intval($arrivehour[1]))  - ($starttime * 60 + intval($starthour[1])) ) / 60 ); 

                               $lastminute = ( ( $arrivetime * 60 + intval($arrivehour[1])) - ($starttime * 60 + intval($starthour[1])) ) % 60; 
                               ?>

                               <li class="sheetleft">Departure Time</li>
                               <li class="sheetright"><?php echo $product['departure_date'] ?>&nbsp;<?php echo $product['departure_time'] ; ?></li>

                               <li class="sheetleft">Arrival Time</li>
                               <li class="sheetright"><?php echo $product['arrive_date'] ?>&nbsp;<?php echo $product['arrive_time'] ; ?></li>


                               <li class="sheetleft">Travel Time</li>

                               <li class="sheetright"><?php echo $lasthour;?> (hours) <?php echo $lastminute;?> (minutes)</li>

                               <li class="sheetleft"></li>
                               <li class="sheetright"></li>
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
                               <?php 
                               //echo $product_return['departure_time'];
                               //echo $product_return['arrive_time'];
                               $start = explode(" ", $product_return['departure_time']);
                               $arrive = explode(" ", $product_return['arrive_time']);

                               $starthour = explode(":", $start[0]);
                               $arrivehour = explode(":", $arrive[0]);
                               //var_dump($starthour); 
                               //echo $starttime = intval($start[0]);
                               if($start[1]=="PM"&&$arrive[1]=="AM")
                               {
                                  $arrivetime = intval($arrivehour[0]) + 24;
                                  $starttime = intval($start[0]) + 12;
                                  $product_return['arrive_date'] = $product_return['departure_date'];
                               }
                               else if($start[1]=="AM"&&$arrive[1]=="PM")
                               {
                                  $arrivetime = intval($arrivehour[0]) + 12;
                                  $starttime = intval($start[0]);
                                  $product_return['arrive_date'] = $product_return['departure_date'];
                               }                         
                               else
                               {
                                  $arrivetime = intval($arrivehour[0]);
                                  $starttime = intval($start[0]);
                                  $product_return['arrive_date'] = $product_return['departure_date'];
                               }
                               //echo $arrivetime;
                               //echo $starttime;
                               $lasthour = intval( (( $arrivetime * 60 + intval($arrivehour[1]))  - ($starttime * 60 + intval($starthour[1])) ) / 60 ); 

                               $lastminute = ( ( $arrivetime * 60 + intval($arrivehour[1])) - ($starttime * 60 + intval($starthour[1])) ) % 60; 
                               ?>
                                   <li class="sheetleft">Departure Time</li>
                                   <li class="sheetright"><?php echo $product_return['departure_date'] ?>&nbsp;<?php echo $product_return['departure_time'] ; ?></li>

                                    <li class="sheetleft">Arrival Time</li>
                                    <li class="sheetright"><?php echo $product_return['arrive_date'] ?>&nbsp;<?php echo $product_return['arrive_time'] ; ?></li>

                                   <li class="sheetleft">Travel Time</li>
                                   <li class="sheetright"><?php echo $lasthour;?> (hours) <?php echo $lastminute;?> (minutes)</li>

                               <li class="sheetleft"></li>
                               <li class="sheetright"></li>
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
           <?php  
           } else {
              $product_return['quantity'] = 0;
              $product_return['price'] = 0;
            }
           ?>
           <div class="sheettotal">
                    <ul>
                        <li class="totalname">Tickets</li>
                        <li class="totalprice"><?php echo intval($product['quantity'])+ intval($product_return['quantity'])?></li>
                        <li class="totalname">Total Price</li>
                        <li class="totalprice">$<?php echo intval($product['quantity']) * intval($product['price']) + intval($product_return['quantity']) * intval($product_return['price']) ?></li>
                    </ul>
                    <div class="clear"></div>
           </div>
       </div>
       <div class="gotocheck"><a id = "gotocheckout" href="javascript:void(0);">Go To Check Out</a></div> 
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