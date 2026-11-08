<?php

$zip = new ZipArchive();

//This is the main document in a .docx file.
$fileToModify = 'word/document.xml';

$template = '../content/report.docx';
$output = '../content/result.docx';

unlink($output);
copy($template,$output);

if ($zip->open($output) === TRUE) 
{
    //Read contents into memory
    $oldContents = $zip->getFromName($fileToModify);

    //echo $oldContents . "<br>";

    //Modify contents:
    $newContents = str_replace('infoadmin', $_GET['admin'], $oldContents);
    $newContents = str_replace('infouser',  $_GET['user'], $newContents);
    $newContents = str_replace('infotext',  $_GET['text'], $newContents);
    $newContents = str_replace('infomac',  $_GET['mac'], $newContents);
    $newContents = str_replace('infodate', $_GET['date'], $newContents);
    $newContents = str_replace('infoaddress',  $_GET['address'], $newContents);
    $newContents = str_replace('infoip',  $_GET['ip'], $newContents);
    $newContents = str_replace('infoimei',  $_GET['imei'], $newContents);
    $newContents = str_replace('infoimsi',  $_GET['imsi'], $newContents);
    $newContents = str_replace('infocell',  $_GET['cell'], $newContents);
    $newContents = str_replace('infotype',  $_GET['type'], $newContents);
    $newContents = str_replace('infossn',  $_GET['ssn'], $newContents);
    $newContents = str_replace('infoos',  $_GET['os'], $newContents);
    $newContents = str_replace('infolongitude',  $_GET['longitude'], $newContents);
    $newContents = str_replace('infolatitude',  $_GET['latitude'], $newContents);
    $newContents = str_replace('infoday', date('d') , $newContents);
    $newContents = str_replace('infomonth', date('m') , $newContents);
    $newContents = str_replace('infoyear', date('Y') , $newContents);
    //Delete the old...
    $zip->deleteName($fileToModify);
    //Write the new...
    $zip->addFromString($fileToModify, $newContents);
    //And write back to the filesystem.
    $return =$zip->close();
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
