<?php
// Html Module 1.0
if ($borderless) {
     echo $code;
} else { ?>
<div class="box <?php echo $classname; ?>">
  <h2 <?php if (!$title) {echo "style=\"height: 5px; background-image: none; border-bottom: none; padding: 0 !important;\""; }; ?>>
	<?php if($title) { echo $title; } else { echo "&nbsp;"; } ?>
  </h2>
    <?php echo $code; ?>
</div>
<?php }; ?>
