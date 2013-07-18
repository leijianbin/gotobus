<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content">
	<?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h1 style="display: none;"><?php echo $heading_title; ?></h1>
	<h2><?php echo $text_blog; ?></h2>
	<?php foreach($posts as $post) { ?>
	<div>
		<a href="<?php echo $post['href']; ?>"><h3><?php echo $post['title']; ?></h3></a>
		<div><?php echo $post['intro_text']; ?></div>
		<p><a href="<?php echo $post['href']; ?>"><?php echo $text_read_more; ?></a></p>
	</div>
	<?php } ?>
	<div class="pagination"><?php echo $pagination; ?></div>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>