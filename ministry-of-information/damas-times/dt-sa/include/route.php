<?php
class Route {
	static public function add($uri, $function) {
		$uri = trim($uri, self::$trim);
		self::$listUri[] = $uri;
		self::$listCall[] = $function;
	}

    	static public function submit() {   
        	$uri = isset($_REQUEST['uri']) ? $_REQUEST['uri'] : '/';
		$uri = trim($uri, self::$trim);

		$replacementValues = array();

		foreach (self::$listUri as $listKey => $listUri)
			if(preg_match("/^$listUri/", $uri)){
				$realUri = explode('/', $uri);
				$fakeUri = explode('/', $listUri);

				foreach ($fakeUri as $key => $value) 
					if ($value == '.+') 
						$replacementValues[] = $realUri[$key];

				call_user_func_array(self::$listCall[$listKey], $replacementValues);
				break;
			}
    	}

	private static $listUri = array();
	private static $listCall = array();
	private static $trim = '/\^$';
}
?>
