<?php









echo "The Key Word<br/>";
if(isset($_POST['key_word'])){
    echo $_POST['key_word']."<br/>";
}else{
    echo "not set!!<br/>";
}

echo "The Date<br/>";
if(isset($_POST['starttime'])){
    echo $_POST['starttime']."<br/>";
}else{
    echo "not set!!<br/>";
}





?>