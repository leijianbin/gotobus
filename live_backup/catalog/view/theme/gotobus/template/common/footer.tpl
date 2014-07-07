
<div class="footer wrapper">

          <img src="catalog/view/theme/gotobus/image/carimg.png" />
            <div class="footerbottom">
          <div class="footermenu">
              <ul>
                    <li><a href="index.php">Home</a></li>
                    <?php if ($informations) { ?>
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                    <li><a href="index.php?route=module/blog">Bus Station</a></li>
                </ul>
            </div>
            <div class="footerright">
            Copyright © 2008-2013 www.gotobustour.com All Rights Reserved. &nbsp;  &nbsp;&nbsp;&nbsp;    <a href="http://web.yibada.com"> Powered by YIBADA</a>
            </div>
            <div class="clear"></div>            
        </div>

</div>
</body></html>