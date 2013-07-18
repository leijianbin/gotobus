<script>
$(document).ready(function(){
  var category_id = <?php if(isset($category_id)) echo $category_id; 
                            else echo "0";?>;
  var category_arrival_id = <?php if(isset($category_arrival_id)) echo $category_arrival_id; else echo "0";?>;
  var passenger_no = <?php if(isset($passenger_no)) echo $passenger_no; else echo "0";?>;

  $('a.departcityOption').each(function(){
    if(this.name == category_id)
    {
      document.getElementById("departSel").style.display="none";
      document.getElementById("departSlected").innerHTML=this.innerHTML;
      document.getElementById("departSlectedInput").value = this.name;
      return false;
    }
  });

  $('a.arrivalcityOption').each(function(){
    if(this.name == category_arrival_id)
    {
    document.getElementById("arrivalSel").style.display="none";
    document.getElementById("arrivalSlected").innerHTML=this.innerHTML;
    document.getElementById("arrivalSlectedInput").value = this.name;
    return false;
    }
  });

  $('a.passengerOption').each(function(){
    if(this.name == passenger_no)
    {
    document.getElementById("passengerSel").style.display="none";
    document.getElementById("passengerSlected").innerHTML=this.innerHTML;
    document.getElementById("passengerSlectedInput").value = this.name;
    return false;
    }
  });


  $('a.departcityOption').click(function(){
    document.getElementById("departSel").style.display="none";
    document.getElementById("departSlected").innerHTML=this.innerHTML;
    document.getElementById("departSlectedInput").value = this.name;

    $('a.arrivalcityOption').each(function(){
    if(this.innerHTML == document.getElementById("departSlected").innerHTML)
    {
      this.style.display="none";
      //return false;
    }
    else
    {
      this.style.display="block";
      //return false;
    }
    });

    return false;
  });

  $('a.arrivalcityOption').click(function(){
    document.getElementById("arrivalSel").style.display="none";
    document.getElementById("arrivalSlected").innerHTML=this.innerHTML;
    document.getElementById("arrivalSlectedInput").value = this.name;
    return false;
  });

  $('a.passengerOption').click(function(){
    document.getElementById("passengerSel").style.display="none";
    document.getElementById("passengerSlected").innerHTML=this.innerHTML;
    document.getElementById("passengerSlectedInput").value = this.name;
    return false;
  });

  $('#departSlected').click(function(){
    if(document.getElementById('departSel').style.display=='none')
      {
        document.getElementById('departSel').style.display='block';
        document.getElementById('arrivalSel').style.display='none';
      }
    else {
      document.getElementById('departSel').style.display='none';
    };

    return false;
  });


  $('#arrivalSlected').click(function(){
    if(document.getElementById('arrivalSel').style.display=='none')
      {
        document.getElementById('arrivalSel').style.display='block';
        document.getElementById('departSel').style.display='none';
      }
    else {
      document.getElementById('arrivalSel').style.display='none';
    };
    return false;
  });

})

</script>

<script>
function drop_mouseover(pos){
 try{window.clearTimeout(timer);}catch(e){}
}
function drop_mouseout(pos){
 var posSel=document.getElementById(pos+"Sel").style.display;
 if(posSel=="block"){
  timer = setTimeout("drop_hide('"+pos+"')", 1000);
}
}
function drop_hide(pos){
 document.getElementById(pos+"Sel").style.display="none";
}

function search_show(pos,searchType,href){
  document.getElementById(pos+"SearchType").value=searchType;
  document.getElementById(pos+"Sel").style.display="none";
  document.getElementById("departSlected").innerHTML=href.innerHTML;
  document.getElementById(pos+'q').focus();
  var sE = document.getElementById("searchExtend");
  if(sE != undefined  &&  searchType == "bar"){
   sE.style.display="block";
 }else if(sE != undefined){
   sE.style.display="none";
 }
 try{window.clearTimeout(timer);}catch(e){}
 return false;
}
</script>

<?php 
/*echo $search;
echo $category_id;
echo $category_arrival_id;
echo $passenger_no;
echo $filter_date;
echo $filter_return_date;
*/
?>

<div class="searchbarside">
  <div class="subtickettitle">Bus Tickets</div>
  <div class="box-content">
    <div class="subsearchbar">
      <!-- Advanced Options -->
      <?php if($options == 1){ ?>
      <div id="dropdown-categories" style="padding: 10px 0px;">

        <div class="flight">
          <ol>
            <li class="radio1" style="float:left; height:20px;">
              <input type="radio" name="search" id="round-trip" value="round-trip" <?php if($search=="round-trip"|| isset($search) ) echo "checked";?>/>
              <label for"Round-trip"> &nbsp;Round-trip</label>
            </li>
            <li class="radio">
              <input type="radio" name="search" id="one-way" value="one-way" <?php if($search=="one-way") echo "checked";?>/>
              <label for"one-way">&nbsp;One-way</label>
            </li>
            <div class="clear"></div>
          </ol>
        </div>
        <!--
        <form name="trip-type">
          <input type="radio" name="search" id="round-trip" value="round-trip" checked="yes"/> Round-trip
          <input type="radio" name="search" id="one-way" value="one-way"/> One-way
        </form>
      -->
      
      <div class="clear"></div>
      <div class="location">
        <div class="searchTool">
          <label for="inadults">Departure City</label><div class="clear"></div>

          <div class="selSearch">
            <div class="nowSearch" id="departSlected" onmouseout="drop_mouseout('head');">Select
            </div>
            <input id="departSlectedInput" type="hidden" value="0"/>

            <ul class="selOption" id="departSel" style="display:none;">
              <?php foreach ($categories as $category_1) { ?>
              <li><a class="departcityOption" name="<?php echo $category_1['category_id']; ?>" <?php if(isset($category_id)) { if($category_1['category_id'] == $category_id) { echo "selected";}}?>><?php echo $category_1['name']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <!--
          <select name="category_id" style="width: 191px;">
            <option value="0">Select City</option>
            <?php foreach ($categories as $category_1) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" <?php if(isset($category_id)) { if($category_1['category_id'] == $category_id) { echo "selected";}}?>><?php echo $category_1['name']; ?></option>
            <?php } ?>
          </select>
        -->

      </div>
      <div class="clear"></div>
      <div class="searchTool searchtoolfloat1" style="margin-top:8px;">
        <label for="inadults">Arrival City</label><div class="clear"></div>

        <div class="selSearch">
          <div class="nowSearch" id="arrivalSlected" onmouseout="drop_mouseout('head');">Select</div>
          <input id="arrivalSlectedInput" type="hidden" value="0"/>

          <ul class="selOption" id="arrivalSel" style="display:none;">
            <?php foreach ($categories as $category_1) { ?>
            <li><a class="arrivalcityOption" name="<?php echo $category_1['category_id']; ?>" <?php if(isset($category_id)) { if($category_1['category_id'] == $category_id) { echo "selected";}}?>><?php echo $category_1['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <!--
        <select name="category_arrival_id" style="width: 191px;">
          <option value="0">Select City</option>
          <?php foreach ($categories as $category_1) { ?>
          <option value="<?php echo $category_1['category_id']; ?>" <?php if(isset($category_arrival_id)) {if($category_1['category_id']==$category_arrival_id) { echo "selected";} }?> ><?php echo $category_1['name']; ?></option>
          <?php } ?>
        </select>
      -->
    </div> 
    <div class="clear"></div>
  </div>
</div>
<div class="clear"></div>
<div class="dashlinebox" style="margin-bottom:5px;"></div>

<div class="pickdate">
  <div class="subdep1" style="width:191px; float:left;">
    <div>
      <label id="" class="textLabel" for="Departure Date">Departure Date</label>
    </div>
    <div class="subdates">
      <input class="date datepicker" type="date hasDatepicker" name="filter_date" style="width:191px; height:20px;" value="<?php if(isset($filter_date)) { if($filter_date != '') { echo $filter_date;} }?>">

    </div>
  </div>

  <div class="subdep1" id="date-return-div">
    <div>
      <label id="" class="textLabel" for="Return Date">Return Date</label>
    </div>
    <div class="subdates">
      <input class="date-return datepicker" type="date hasDatepicker" name="filter_return_date" style="width:191px; height:20px;" value="<?php if(isset($filter_return_date)) { if( $filter_return_date != '' ) { echo $filter_return_date;}}?>">
    </div>
  </div>
</div>
<div class="clear"></div>
<div class="dashlinebox" style="margin-bottom:5px;"></div>

<div class="searchTool">
  <label for="inadults">Passengers NO.</label><div class="clear"></div>

  <div class="selSearch">
    <div class="nowSearch" id="passengerSlected" onclick="if(document.getElementById('passengerSel').style.display=='none'){document.getElementById('passengerSel').style.display='block';}else {document.getElementById('passengerSel').style.display='none';};return false;" onmouseout="drop_mouseout('passenger');">1</div>
    <input id="passengerSlectedInput" type="hidden" value="1"/>

    <ul class="selOption" id="passengerSel" style="display:none;">

      <?php for ($i=1; $i<=10; $i++) {?>
     <li><a href="#" class="passengerOption" name="<?php echo $i;?>" <?php if(isset($passenger_no)) { if($i == $passenger_no) echo "selected"; }?>><?php echo $i;?></a></li>
     <?php }?>
   </ul>
 </div>
</div>
  <!--   
  <div class="passenger">
    <select name="passenger_no" style="width: 191px;">
      <?php for ($i=1; $i<=10; $i++) {?>
      <option value="<?php echo $i;?>" <?php if(isset($passenger_no)) { if($i == $passenger_no) echo "selected"; }?>><?php echo $i;?></option>
      <?php }?>
    </select>
  </div>
-->

<div class="clear"></div>

  <!--
  <div class="buttons">
    <div class="right"><input type="button" value="Search" id="button-search" class="button" /></div>
  </div>
-->

<div class="subactions">
  <a id="button-search" href="javascript:void(0);">SEARCH</a>
</div>

<?php } ?>
</div>
</div>
</div>


<script type="text/javascript"><!--

$('#one-way').click(function(){
  $('#date-return-div').hide();
});

$('#round-trip').click(function(){
  $('#date-return-div').show();
});

if($('#round-trip').attr('checked') == 'checked'){
  $('#date-return-div').show();
} else {
  $('#date-return-div').hide();
}


$('.subsearchbar input[name=\'search\']').keydown(function(e) {
  if (e.keyCode == 13) {
    $('#button-search').trigger('click');
  }
});

$('select[name=\'category_id\']').trigger('change');

$('select[name=\'passenger_no\']').trigger('change');

$('select[name=\'category_arrival_id\']').trigger('change');


$('#button-search').bind('click', function() {

  url = 'index.php?route=product/search';
  
  var search = $('.subsearchbar input[name=\'search\']:checked').attr('value');

  if (search) {
    url += '&search=' + encodeURIComponent(search);
  }

  var category_id = $('#departSlectedInput').attr('value');
  
  if (category_id > 0) {
    url += '&category_id=' + encodeURIComponent(category_id);
  }
  else
  {
    alert("Please choose the departure city.");
    return;
  }

  var category_arrival_id = $('#arrivalSlectedInput').attr('value');
  
  if (category_arrival_id > 0) {
    url += '&category_arrival_id=' + encodeURIComponent(category_arrival_id);
  }
  else
  {
    alert("Please choose the arrival city.");
    return;
  }
  
  var passenger_no = $('#passengerSlectedInput').attr('value');
  
  url += '&passenger_no=' + encodeURIComponent(passenger_no) ;

  var filter_date = $('.subsearchbar input[name=\'filter_date\']').attr('value');
  
  if (filter_date) {
    url += '&filter_date=' + filter_date ;
  }
  else
  {
    alert("Please choose the departure date.");
    return;
  }

  var filter_return_date = $('.subsearchbar input[name=\'filter_return_date\']').attr('value');
  
  if (filter_date && search =="round-trip") {
    url += '&filter_return_date=' + filter_return_date ;
  }
  else
  {
    if(search=="round-trip")
    {
      alert("Please choose the return date.");
      return;
    }
  }

  location = url;

});
</script>


<script>
$(function() {
//$(".datepicker").datepicker(
//  { dateFormat: 'yy-mm-dd' }
//);
var dateToday = new Date();

$(".date").datepicker({
  minDate: dateToday,
  dateFormat: 'yy-mm-dd',
  onClose: function(dates) { 
    if(dates != ''){
            var someDate = new Date(dates); // add arguments as needed
            someDate.setTime(someDate.getTime() + 2*1000*24*60*60);
            var date_return = $(".date-return").attr('value');
            if(date_return == '')
            {
              $(".date-return").val($.datepicker.formatDate('yy-mm-dd',someDate));
            }
            date_origin = $('.date').val();
          }

        }    
      });

$(".date-return").datepicker({
  minDate: dateToday,
  dateFormat: 'yy-mm-dd',
  onClose: function(dates) { 
    if(dates != ''){
            var someDate_return = new Date(dates); // add arguments as needed
            someDate_return.setTime(someDate_return.getTime() - 0);

            var date = $(".date").attr('value');
            if(date == '')
            {
              $(".date").val($.datepicker.formatDate('yy-mm-dd',someDate));
            }
            date_origin_return = $(".date_return").val();
          }
          
        }
      });

});

</script>

