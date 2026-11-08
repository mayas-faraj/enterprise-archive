<?php
	if(isset($_POST['op']) AND isset($_POST['data']) AND isset($_POST['path']))
	{
		switch($_POST['op'])
		{
			case 'saveImage':
				$data = $_POST['data'];
				$path = $_POST['path'];
				echo file_put_contents("../$path", base64_decode(explode(',',$data)[1]));
				break;
			case 'deleteImage':
				$path = $_POST['path'];
				echo unlink("../$path");
				break;
			default:
				echo "unsupported image operation!";
				break;
		}
	}
	else
		echo "no data to save";

?>
