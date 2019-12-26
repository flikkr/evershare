/**
 * Validates the creation of a new module
 * 
 * @returns true if validation is successful, false otherwise
 */
function validateMod()
{
    var modCourse = document.getElementById("courseSelectionModal");
	var selected = modCourse.options[modCourse.selectedIndex].value;
	
	var modCode = document.getElementById("moduleCodeModal").value;
	
    if (selected == "default")
    {
        alert("Please select a course.");
        return false;
    }

    var patt = new RegExp("[A-Za-z]{3}[1-9]{1}[0-9]{3}");
    var isValid = patt.test(modCode);

    if (isValid)
    {
        return true;
    }
    else
    {
        alert("Please enter a valid module code.");
        return false;
    }
}

/**
 * Validates before uploading notes
 * 
 * @returns true if validation is successful, false otherwise
 */
function validateUpl()
{
    var mod = document.getElementById("module-selection");
	var selected = mod.options[mod.selectedIndex].value;
	
    if (selected == "default")
    {
        alert("Please select a module.");
        return false;
    }
    
    return true;
}

/**
 * Validate selection
 * 
 * @returns true if validation is successful, false otherwise
 */
function validateCourse()
{
    var mod = document.getElementById("course-selection");
	var selected = mod.options[mod.selectedIndex].value;
	
    if (selected == "default")
    {
        alert("Please select a course.");
        return false;
    }
    
    return true;
}

/**
 * Submit form
 * 
 * @returns true if validation is successful, false otherwise
 */
function submitf(formid)
{
    document.getElementById(formid).submit();
}
