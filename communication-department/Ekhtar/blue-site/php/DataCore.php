<?php
        define('DATABASE','ekhtar');

	function connect($user, $password)
	{
		$connect = mysqli_connect('localhost', $user, $password);

                if(mysqli_connect_errno())
                        return false;
                else
                        return true;
	}

        function getConnection($user, $password)
        {
                $connect = mysqli_connect('localhost', $user, $password);

                if(mysqli_connect_errno())
                        die('Database connection failed: ' . mysqli_connect_errno());
		else
			return $connect;
        }

        function query($user, $password, $sql, $getId=false)
        {
                $connect = getConnection($user, $password);
                
		mysqli_select_db($connect, constant('DATABASE'));
                $result = mysqli_query($connect, $sql);
                
		if(!$result)
			die('Database query failed: ' . mysqli_error($connect));
                else
			if($getId)
				return mysqli_insert_id($connect);
			else
				return $result;
		
		close($connect);
        }

	function select($user, $password, $sql)
	{
		$connect = getConnection($user, $password);
		mysqli_select_db($connect, constant('DATABASE'));
		$result = mysqli_query($connect, $sql);

		if(!$result)
			die('Database query failed: ' . mysqli_error($connect));
		else
		{	
			$value=null;
		
			if(mysqli_num_rows($result) > 0)
			{
				$value=array();
				while($row = mysqli_fetch_assoc($result))
				{
					$value[] = $row;
				}
			}
		
			close($connect);
			return $value;
		}
	}

        function close($connect)
        {
                if($connect)
                        mysqli_close($connect);
        }

?>
