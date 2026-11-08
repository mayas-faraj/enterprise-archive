<?php
$template=$_POST['template'];
$zip = new ZipArchive();

//This is the main document in a .docx file.
$fileCore = 'word/document.xml';
$output = str_replace('.docx','_result.docx',$template);
unlink($output);
copy($template,$output);

if ($zip->open($output) === TRUE) 
{
    //Read contents into memory
    $oldContents = $zip->getFromName($fileCore);
    //echo $oldContents . "<br>";

    //Modify contents:
    $fileCoreReplacement = str_replace('infoadmin', $_POST['admin'], $oldContents);
    $fileCoreReplacement = str_replace('infouser',  $_POST['user'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infophone',  $_POST['phone'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infotext',  $_POST['text'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infomac',  $_POST['mac'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infodate', $_POST['date'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoaddress',  $_POST['address'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoip',  $_POST['ip'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoimei',  $_POST['imei'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoimsi',  $_POST['imsi'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infocell',  $_POST['cell'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infotype',  $_POST['type'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infossn',  $_POST['ssn'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoos',  $_POST['os'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infolongitude',  $_POST['longitude'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infolatitude',  $_POST['latitude'], $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoday', date('d') , $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infomonth', date('m') , $fileCoreReplacement);
    $fileCoreReplacement = str_replace('infoyear', date('Y') , $fileCoreReplacement);
    //Delete the old...
    $zip->deleteName($fileCore);
    //Write the new...
    $zip->addFromString($fileCore, $fileCoreReplacement);
    //And write back to the filesystem.
    $return =$zip->close();

echo "5";
    If ($return==TRUE)
    {
        echo "Success!";
    }
	else
	{
		echo "not success";
	}
} else
{
    echo 'failed';
}


?>
