<?php echo $header; ?>
<div class="contentsubpage">

<?php echo $column_left; ?>


<div class="subpageright">
        	<div class="subpagebreadcrum">
            	Bus Station
            </div>
           <div class="busstationcon">
           <?php 
           $count = 0;
           foreach($posts as $post) { 
           $count ++;
            ?>
           		<div class="bussstationbox">
                	<div class="busstationimg"><img src="image/<?php echo $post['image']?>" />
                	</div>
                    <div class="busstationinfor">
                    	<h4><?php echo $post['title']?></h4>
                        <h5><?php echo $post['intro_text']?></h5>
                        <div class="busstationdetail"><?php echo $post['text']?></div>
                    </div>
              </div>
            <?php if( $count%2 == 0 )
              { ?>
              <div class="clear"></div>
              <?php } ?>
            <?php } ?>
                <div class="clear"></div>
           </div>
        </div>
</div>
<div class="clear"></div>
</div>
<div class="graybg">
<?php echo $footer; ?>