<?php
require __DIR__ . '/vendor/autoload.php';
set_time_limit(6000);

#parsing input
$scrapy_site=$_POST["scrapysite"];
$sites_group=$_POST["sitesgroup"];

if(substr($scrapy_site, -1)!="/")
	$scrapy_site .= "/";
if(substr($scrapy_site, 0, 8)!="https://" && substr($scrapy_site, 0, 7)!="http://")
	$scrapy_site = "https://" . $scrapy_site;

#get domain from input sites group
for($i=0; $i<count($sites_group); $i++)
	$sites_group[$i]=parse_url(str_replace("www.", "", $sites_group[$i]))["host"];

#remove current site from sites group
$scrapy_domain=parse_url($scrapy_site)["host"];
if(($key=array_search($scrapy_domain, $sites_group))!=FALSE)
	unset($sites_group[$key]);
#get sitemap
$sitemap_urls=get_sitemap_urls($scrapy_site . "sitemap.xml");
$not_in_sitemap_urls=array();
$missed_urls=array();
$links=array();
$no_data=array();

#process each page on site map
process_result($sitemap_urls, $links, $not_in_sitemap_urls, $missed_urls);
#process_result($not_in_sitemap_urls, $links, $no_data, $missed_urls);

$result=array("site_url"=> $scrapy_site, "crowing_date"=> date("Y-m-d H:i:s"), "links"=> $links, "not_in_sitemap_urls"=>$not_in_sitemap_urls, "missed_urls"=>$missed_urls);
echo json_encode($result);

function process_result($sitemap_urls, &$links, &$not_in_sitemap_urls, &$missed_urls)
{
	global $scrapy_site;
	global $sites_group;
	foreach($sitemap_urls as $sitemap_url)
		if(($page_content=@file_get_contents($sitemap_url))!=FALSE)
		{
			$document = FluentDOM::load(
				$page_content,
				"text/html",
				[FluentDOM\Loader\Options::ALLOW_FILE => TRUE]
			);

			foreach ($document("//a[@href]") as $a) 
			{
				$url = parse_url(str_replace("www.", "", $a["href"]));

				if(isset($url["host"]))
				{
					if(in_array($url["host"], $sites_group)) 
						$links[] = [ "source" => $sitemap_url, "destination" => $a["href"], "title" => trim((string)$a)];

					if(isset($not_in_sitemap_urls) && strpos($scrapy_site, $url["host"]))
					{
						$form_sitemap_url="";
						if(isset($url["scheme"]))
							$form_sitemap_url=$url["scheme"]."://";
						else
							$form_sitemap_url="https://";

						$form_sitemap_url.=$url["host"];
						if(isset($url["path"]))
							$form_sitemap_url.=$url["path"];

						if(!in_array($form_sitemap_url, $sitemap_urls))
							$not_in_sitemap_urls[] = [ "source" => $sitemap_url, "destination" => $form_sitemap_url, "title"=> trim((string)$a)];
					}
				}
			}	
		}
		else
			$missed_urls[] = $sitemap_url;
}

function get_sitemap_urls($sitemap_url)
{
	$site_urls=array();

	$sitemap=file_get_contents($sitemap_url);

	$matches=array();
	preg_match_all('/<loc>(.*)<\/loc>/', $sitemap, $matches);
	$sitemap_urls=$matches[1];
	foreach($sitemap_urls as $sitemap_url)
		if(substr($sitemap_url, -4)==".xml")
			$site_urls = array_merge($site_urls, get_sitemap_urls($sitemap_url));
		else
			$site_urls[] = $sitemap_url;

	return $site_urls;
}
?>
