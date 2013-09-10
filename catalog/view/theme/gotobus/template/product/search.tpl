	<?php echo $header; ?>

	<?php 

	//print_r($category_id);
	//print_r($category_arrival_id);
	/*print "<pre>";
	print_r($products);
	print "</pre>";
	print "</br>";

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

	<h1 class="heading_title">
			<a href="#">Home</a> &gt; Choose Time      
	</h1>
	<div class="sheettitle">Choose your Time</div>


	<div class="ticketconfrim">

		<?php $flag = 1;
		$count = 1;
		$hasSingle = 0;
		$hasReturn = 0;

		?>

		<?php if ($products) { ?>
			

			<?php foreach ($products as $product) { 
				if( $product['bus_type'] == 'single')
				{
					$hasSingle = 1;
					$line_name = $product['name'];
					break;
				}
			}?>

			<?php if ($hasSingle) { ?>
			<div class="contentsinfo">			
				<div class="leavetimetb">
					<div class="traveltime">
						<p class="withbg">Please select departure time: <?php echo $product['bus_date']?>
						<?php 
								$dt = strtotime($product['bus_date']);
								echo date('D',$dt);
						?>	
						</p>
						<p class="fontbold"><?php echo $line_name;?></p> 
					</div>
				</div>
				<div class="clear"></div>
				<table cellspacing="0">
					<tbody>

						<tr class="title">
							<td class="col1">Departure Time</td>
							<td class="col2">Line No</td>
							<td class="col6">Line Name</td>
							<td class="col4">Price/Person</td>
						</tr>
						<?php foreach ($products as $product) { ?>
						<?php if( $product['bus_type'] == 'single') { 
							if((int)$product['price'] > 0) {	
							?>
						<?php 
						//add fileter the past due ticket
						$time = $product['bus_date']." ".$product['departure_time'];
						$dt = strtotime($time);
						$now = time();
						
						if($dt > $now){ ?>
						<tr class="trinfodetail">
							<td class="col1">
								<input class="leavetimet-data" val="<?echo $count?>" type="radio" name="leavetime" value=""><?php echo $product['departure_time']?>

								<input class="bus-id-<?php echo $count?>"  type="hidden" value="<?php echo $product['product_id']?>"></td>
								<td class="col2"><?php echo $product['model']?></td>
								<td class="col6"><?php echo $product['name']; ?></td>
								<td class="col4">＄<?php echo $product['price']?></td>
							</tr>
							<?php $count++; ?>
							<?php } } } }?>
						</tbody>  
				</table>
			</div>
			<?php } ?>

			<?php foreach ($products as $product) { 
				if( $product['bus_type'] == 'return')
				{
					$hasReturn = 1;
					$line_name = $product['name'];
					break;
				}
			}?>

			<?php if($hasReturn) { ?>
				<div class="contentsinfo">

					<div class="arrivetimetb">
						<div class="traveltime">
							<p class="withbg">Please select return time: <?php echo $product['bus_date_return']?>
							<?php 
								$dt = strtotime($product['bus_date_return']);
								echo date('D',$dt);
							?>
							</p>
							<p class="fontbold"><?php echo $line_name;?></p> 
						</div>
					</div>
					<div class="clear"></div>

					<table cellspacing="0">
						<tbody>
							<tr class="title">
								<td class="col1">Departure Time</td>
								<td class="col2">Line No</td>
								<td class="col6">Line Name</td>
								<td class="col4">Price/Person</td>
							</tr>
							<?php foreach ($products as $product) { ?>
							<?php if( $product['bus_type'] != 'single') { 
								if((int)$product['price'] > 0) {?>
							
							<?php 
							//add the filter the past due ticket.
							$time = $product['bus_date_return']." ".$product['departure_time'];
							$dt = strtotime($time);
							$now = time();
							if($dt > $now){ ?>

							<tr class="trinfodetail">
								<td class="col1">
									<input class="leavetimet-data-return" val="<?echo $count?>" type="radio" name="leavetime_return" value=""><?php echo $product['departure_time']?>

									<input class="bus-id-return-<?php echo $count?>"  type="hidden" value="<?php echo $product['product_id']?>">
								</td>
								<td class="col2"><?php echo $product['model']?></td>
								<td class="col6"><?php echo $product['name']; ?></td>
								<td class="col4">＄<?php echo $product['price']?></td>
							</tr>
							<?php $count++; ?>
							<?php } } } } ?>
						</tbody>  
					</table>
				</div>
			<?php }?>

			<div class="submitnext">
					<div class="nextstep">
						<button class="submit-button">Next</button>
					</div>   
			</div>


			<?php } 
				else { ?>
			<div class="content"><?php echo $text_empty; ?></div>
			<?php }?>

			<form id ="bus-booking" name="bus_order" method="post" action="?route=product/bus_confirm">
				<input class="bi" name="bus_id" type="hidden" value="">
				<input class="bir" name="bus_id_return" type="hidden" value="">
				<input class="ci" name="category_id" type="hidden" value="<?php echo $category_id?>">
				<input class="cir" name="category_id_return" type="hidden" value="<?php echo $category_arrival_id?>">
				<input name="filter_date" type="hidden" value="<?php echo $product['bus_date']?>">
				<input name="filter_date_return" type="hidden" value="<?php echo $product['bus_date_return']?>">
				<input name="quantity" type="hidden" value="<?php echo $product['passenger_no']?>">
				<input name="bus_type" type="hidden" value="<?php echo $search?>">
			</form>
		
		<div class="clear"></div>
	</div>

	</div>
</div>

	<script type="text/javascript">

		$('.leavetimet-data').click(function(){
			$('.bi').val($('.bus-id-'+$(this).attr('val')).val());
		});

		$('.leavetimet-data-return').click(function(){
			$('.bir').val($('.bus-id-return-'+$(this).attr('val')).val());
		});

		$('.submit-button').click(function(){
			if( $('.leavetimet-data-return').length == 0 ){
				if(!$('.bi').val()){
					alert("Haven't Select Depart Information!")

				} else {
					$('#bus-booking').submit();	
				}
			} else {
				if(!$('.bi').val()){
					alert("Haven't Select Depart Information!")
				} else if(!$('.bir').val()) {
					alert("Haven't Select Return Infomation!")
				} else {
					$('#bus-booking').submit();
				}
			}
		});

	</script>
<div class="clear"></div>
<?php echo $footer; ?>