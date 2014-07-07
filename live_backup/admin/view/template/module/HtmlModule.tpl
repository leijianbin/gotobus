<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <div id="tabs" class="htabs">
        <a href="#tab-1"><span><?php echo $entry_area; ?> 1</span></a>
        <a href="#tab-2"><span><?php echo $entry_area; ?> 2</span></a>
        <a href="#tab-3"><span><?php echo $entry_area; ?> 3</span></a>
	<a href="#tab-4"><span><?php echo $entry_area; ?> 4</span></a>
	<a href="#tab-5"><span><?php echo $entry_area; ?> 5</span></a>
	<a href="#tab-6"><span><?php echo $entry_area; ?> 6</span></a>
	<a href="#tab-7"><span><?php echo $entry_area; ?> 7</span></a>
	<a href="#tab-8"><span><?php echo $entry_area; ?> 8</span></a>
	<a href="#tab-9"><span><?php echo $entry_area; ?> 9</span></a>
	<a href="#tab-10"><span><?php echo $entry_area; ?> 10</span></a>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div id="tab-1" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title1_<?php echo $language['language_id']; ?>" id="HtmlModule_title1_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title1_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header1) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header1_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header1_1" name="HtmlModule_header1" value="1" />
		<label for="HtmlModule_header1_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header1_0" name="HtmlModule_header1" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless1) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless1_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless1_1" name="HtmlModule_borderless1" value="1" />
		<label for="HtmlModule_borderless1_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless1_0" name="HtmlModule_borderless1" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>

	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code1_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code1_' . $language['language_id']}) ? ${'HtmlModule_code1_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
     </div><!--area1-->
    <div id="tab-2" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title2_<?php echo $language['language_id']; ?>" id="HtmlModule_title2_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title2_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header2) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header2_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header2_1" name="HtmlModule_header2" value="1" />
		<label for="HtmlModule_header2_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header2_0" name="HtmlModule_header2" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless2) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless2_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless2_1" name="HtmlModule_borderless2" value="1" />
		<label for="HtmlModule_borderless2_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless2_0" name="HtmlModule_borderless2" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>

	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code2_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code2_' . $language['language_id']}) ? ${'HtmlModule_code2_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area2-->
    <div id="tab-3" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title3_<?php echo $language['language_id']; ?>" id="HtmlModule_title3_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title3_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header3) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header3_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header3_1" name="HtmlModule_header3" value="1" />
		<label for="HtmlModule_header3_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header3_0" name="HtmlModule_header3" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless3) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless3_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless3_1" name="HtmlModule_borderless3" value="1" />
		<label for="HtmlModule_borderless3_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless3_0" name="HtmlModule_borderless3" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code3_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code3_' . $language['language_id']}) ? ${'HtmlModule_code3_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area3-->
	<div id="tab-4" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title4_<?php echo $language['language_id']; ?>" id="HtmlModule_title4_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title4_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header4) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header4_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header4_1" name="HtmlModule_header4" value="1" />
		<label for="HtmlModule_header4_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header4_0" name="HtmlModule_header4" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless4) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless4_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless4_1" name="HtmlModule_borderless4" value="1" />
		<label for="HtmlModule_borderless4_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless4_0" name="HtmlModule_borderless4" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code4_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code4_' . $language['language_id']}) ? ${'HtmlModule_code4_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area4--><div id="tab-5" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title5_<?php echo $language['language_id']; ?>" id="HtmlModule_title5_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title5_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header5) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header5_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header5_1" name="HtmlModule_header5" value="1" />
		<label for="HtmlModule_header5_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header5_0" name="HtmlModule_header5" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless5) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless5_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless5_1" name="HtmlModule_borderless5" value="1" />
		<label for="HtmlModule_borderless5_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless5_0" name="HtmlModule_borderless5" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code5_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code5_' . $language['language_id']}) ? ${'HtmlModule_code5_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area5--><div id="tab-6" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title6_<?php echo $language['language_id']; ?>" id="HtmlModule_title6_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title6_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header6) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header6_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header6_1" name="HtmlModule_header6" value="1" />
		<label for="HtmlModule_header6_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header6_0" name="HtmlModule_header6" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless6) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless6_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless6_1" name="HtmlModule_borderless6" value="1" />
		<label for="HtmlModule_borderless6_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless6_0" name="HtmlModule_borderless6" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code6_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code6_' . $language['language_id']}) ? ${'HtmlModule_code6_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area6--><div id="tab-7" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title7_<?php echo $language['language_id']; ?>" id="HtmlModule_title7_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title7_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header7) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header7_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header7_1" name="HtmlModule_header7" value="1" />
		<label for="HtmlModule_header7_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header7_0" name="HtmlModule_header7" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless7) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless7_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless7_1" name="HtmlModule_borderless7" value="1" />
		<label for="HtmlModule_borderless7_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless7_0" name="HtmlModule_borderless7" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code7_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code7_' . $language['language_id']}) ? ${'HtmlModule_code7_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area7--><div id="tab-8" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title8_<?php echo $language['language_id']; ?>" id="HtmlModule_title8_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title8_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header8) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header8_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header8_1" name="HtmlModule_header8" value="1" />
		<label for="HtmlModule_header8_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header8_0" name="HtmlModule_header8" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless8) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless8_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless8_1" name="HtmlModule_borderless8" value="1" />
		<label for="HtmlModule_borderless8_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless8_0" name="HtmlModule_borderless8" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code8_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code8_' . $language['language_id']}) ? ${'HtmlModule_code8_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area8--><div id="tab-9" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title9_<?php echo $language['language_id']; ?>" id="HtmlModule_title9_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title9_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header9) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header9_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header9_1" name="HtmlModule_header9" value="1" />
		<label for="HtmlModule_header9_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header9_0" name="HtmlModule_header9" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless9) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless9_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless9_1" name="HtmlModule_borderless9" value="1" />
		<label for="HtmlModule_borderless9_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless9_0" name="HtmlModule_borderless9" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code9_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code9_' . $language['language_id']}) ? ${'HtmlModule_code9_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area9--><div id="tab-10" style="clear: both;">
      <table class="form">
	<?php foreach ($languages as $language) { ?>
	<tr>
	<td><?php echo $entry_title; ?></td>
	  <td>
	    <input type="text" name="HtmlModule_title10_<?php echo $language['language_id']; ?>" id="HtmlModule_title10_<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'HtmlModule_title10_' . $language['language_id']}; ?>" />
	    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
     	  </td>
	</tr>
	<?php } ?>
	<tr>
	  <td><?php echo $entry_header; ?></td>
	  <td>
	    <?php
		if($HtmlModule_header10) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_header10_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_header10_1" name="HtmlModule_header10" value="1" />
		<label for="HtmlModule_header10_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_header10_0" name="HtmlModule_header10" value="0" />
	  </td>
	</tr>

	<tr>
	  <td><?php echo $entry_borderless; ?></td>
	  <td>
	    <?php
		if($HtmlModule_borderless10) {
		   $checked1 = ' checked="checked"';
		   $checked0 = '';
		}else{
		   $checked1 = '';
		   $checked0 = ' checked="checked"';
	    } ?>
		<label for="HtmlModule_borderless10_1"><?php echo $entry_yes; ?></label>
		<input type="radio"<?php echo $checked1; ?> id="HtmlModule_borderless10_1" name="HtmlModule_borderless10" value="1" />
		<label for="HtmlModule_borderless10_0"><?php echo $entry_no; ?></label>
		<input type="radio"<?php echo $checked0; ?> id="HtmlModule_borderless10_0" name="HtmlModule_borderless10" value="0" />
		<span class="help"><?php echo $entry_borderlesswarn; ?></span>
	  </td>
	</tr>


	<?php foreach ($languages as $language) { ?>
        <tr>
	  <td><?php echo $entry_code; ?></td>
          <td><textarea name="HtmlModule_code10_<?php echo $language['language_id']; ?>" cols="40" rows="10"><?php echo isset(${'HtmlModule_code10_' . $language['language_id']}) ? ${'HtmlModule_code10_' . $language['language_id']} : ''; ?></textarea>
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
          </td>
        </tr>
	<?php } ?>
      </table>
    </div><!--area10-->

      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_area_id; ?></td>
            <td class="left"><?php echo $entry_classname; ?></td>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
            <td class="left">
              <select name="HtmlModule_module[<?php echo $module_row; ?>][area_id]">
              <?php for ($i=1; $i<=10; $i++) { ?>
               <option value="area<?php echo $i; ?>" <?php if ($module['area_id']=="area".$i) {echo "selected=\"selected\"";}; ?>>Area <?php echo $i; ?></option>
              <?php }; ?>
              </select></td>
            <td class="left">
              <input type="text" name="HtmlModule_module[<?php echo $module_row; ?>][classname]" value="<?php echo $module['classname']; ?>" size="15" />
            </td>

            <td class="left"><select name="HtmlModule_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="HtmlModule_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="HtmlModule_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="HtmlModule_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
          </tr>
        </tfoot>
      </table>
     </form>
    </div>
	<div style="text-align:center; color:#666666;">
		HTML Module 1.0<?php echo $HtmlModule_version; ?> - <a href="http://www.trademazing.com" target="_blank">Support</a>
	</div>
</div>
</div>
<?php echo $footer; ?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('HtmlModule_code1_<?php echo $language['language_id']; ?>', {
     filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('HtmlModule_code2_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('HtmlModule_code3_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('HtmlModule_code4_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code5_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code6_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code7_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code8_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code9_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});CKEDITOR.replace('HtmlModule_code10_<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="HtmlModule_module[' + module_row + '][area_id]" > <?php for ($i=1; $i<=10; $i++) { ?><option value="area<?php echo $i;?>">HTML <?php echo $i; ?></option><?php }; ?> </td>';
	html += '    <td class="left"><input type="text" name="HtmlModule_module[' + module_row + '][classname]" value="" size="15" /></td>';
	html += '    <td class="left"><select name="HtmlModule_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="HtmlModule_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="HtmlModule_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="HtmlModule_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	module_row++;
}
//--></script>
<script type="text/javascript"><!--
$(function() { $('#tabs a').tabs();  });
//--></script>
<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: 'Image Manager',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" class="image" onclick="image_upload(\'' + field + '\', \'' + preview + '\');" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
<?php echo $footer; ?>