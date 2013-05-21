<div id="stage1">
	<?php
	$name = $description = $fieldtype = $fieldType[] = $fieldName[] = $fieldDescription[] = "";
	$fieldCount = set_value('fieldCount', 1);;

	$attributes = array('class' => '');
	echo form_open('recipe/'.$viewType.'/2', $attributes);
	?>
		<h2>Cooking up a <?php echo $thisRecipe; ?></h2>
		<div class="controls controls-row" id="content-templates">
			<input type="hidden" name="templateType" value="<?php if (isset($templateType)) { echo $templateType; } ?>">
			<h3>What type of data do you want on your <?php echo $thisRecipe; ?>?</h3>
			<a href="#" class="large-button project content-template">
				Project 
				<span></span>
			</a>
			<a href="#" class="large-button userstory content-template">
				User story
				<span></span>
			</a>
			<a href="#" class="large-button subtask content-template">
				Sub-task
				<span></span>
			</a>
		</div>
		<h3 id="control-title">Or enter the details manually</h3>
		<div class="controls controls-row">
			<input type="text" class="input-block-level" placeholder="Name" name="name" value="<?php echo set_value('name', $name, $name); ?>">
			<?php echo form_error('name'); ?>
			<input type="text" class="input-block-level" placeholder="Description" name="description" value="<?php echo set_value('description', $description, $description); ?>">
			<?php echo form_error('description'); ?>
		</div>
		<h3>Fields</h3>	
		<input type="hidden" name="fieldCount" value="<?php echo set_value('fieldCount', $fieldCount); ?>">
		<fieldset>
			<div class="controls controls-row new-field">
				<select name="" class="span3" disabled>
					<option value="">Text</option>
				</select>
				
				<input type="text" class="span3" name="" value="Title" disabled>

				<input type="text" class="span3" name="" value="The node's title" disabled>

				<input type="text" class="span2" name="" value="Yes" disabled>
				
			</div>
		</fieldset>
		<fieldset>
		<?php 
		for($i = 1; $i <= $fieldCount; $i++){ ?>
			<?php 
			//echo "<p>".set_value('fieldType[]')." is fieldType length</p>"; ?>
			<div class="controls controls-row new-field">
				<select name="fieldType[]" class="span3">
					<option value="">- Field Type -</option>
					<?php 
					$thisFieldType = set_value('fieldType[]');
					foreach($fields->result() as $field){ 
						$fieldTypeDefault = false;
					?>
						<option value="<?php echo $field->id; ?>" <?php 
						if ($field->id == $thisFieldType){
							echo 'selected ="selected"';
						} ?>
						><?php echo $field->name; ?></option>
					<?php } ?>
				</select>
				
				<input type="text" class="span3" placeholder="Field Name" name="fieldName[]" value="<?php echo set_value('fieldName[]', $fieldName[0]); ?>">

				<input type="text" class="span3" placeholder="Field Description" name="fieldDescription[]" value="<?php echo set_value('fieldDescription[]', $fieldDescription[0]); ?>">

				<input type="text" class="span2" name="fieldRequired[]" placeholder="Required?" value="<?php echo set_value('fieldRequired[]'); ?>">

				<span class="icon-remove deleter"></span>
						
				<span class="help-inline span3"><?php echo form_error('fieldType[]'); ?></span>
				<span class="help-inline span3"><?php echo form_error('fieldName[]'); ?></span>
				<span class="help-inline span3"><?php echo form_error('fieldDescription[]'); ?></span>
			</div>
		<?php } ?>
		</fieldset>

		<a href="#" class="btn btn-primary" id="add-button">Add</a>
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Save changes</button>
			<a href="" type="button" class="btn">Cancel</a>
		</div>
		
		<script type="template" id="add-row">
			<div class="controls controls-row new-field">
				<select name="fieldType[]" class="span3">
					<option value="">- Field Type -</option>
					<?php 
					$thisFieldType = set_value('fieldType[]');
					foreach($fields->result() as $field){ 
						$fieldTypeDefault = false;
					?>
						<option value="<?php echo $field->id; ?>" <?php 
						if ($field->id == $thisFieldType){
							echo 'selected ="selected"';
						} ?>
						><?php echo $field->name; ?></option>
					<?php } ?>
				</select>
				
				<input type="text" class="span3" placeholder="Field Name" name="fieldName[]" value="<?php echo set_value('fieldName[]', $fieldName[0], $fieldName[0]); ?>">

				<input type="text" class="span3" placeholder="Field Description" name="fieldDescription[]" value="<?php echo set_value('fieldDescription[]', $fieldDescription[0], $fieldDescription[0]); ?>">

				<input type="text" class="span2" name="fieldRequired[]" placeholder="Required?" value="<?php echo set_value('fieldRequired[]'); ?>">

				<span class="icon-remove deleter"></span>
						
				<span class="help-inline"><?php echo form_error('fieldType[]'); ?></span>
				<span class="help-inline"><?php echo form_error('fieldName[]'); ?></span>
				<span class="help-inline"><?php echo form_error('fieldDescription[]'); ?></span>
			</div>
		</script>
		<script type="template" id="dropdown-select">
			<select class="span3" name="fieldDescription[]">
				<option value="">- Select content type -</option>
				<?php
				foreach($contentTypes->result() as $type){ 
					$thisContentType = set_value('fieldDescription[]');
					?>
					<option value="<?php echo $type->id; ?>" <?php 
						if ($type->id == $thisContentType){
							echo 'selected ="selected"';
						} ?>
						><?php echo $type->name; ?></option>
				<?php
				} ?>
			</select>
		</script>
		<script type="template" id="description-field">
			<input type="text" class="span3" placeholder="Field Description" name="fieldDescription[]" value="<?php echo set_value('fieldDescription[]', $fieldDescription[0], $fieldDescription[0]); ?>">
		</script>
	</form>
</div>