<?php

class IndexController extends \Phalcon\Mvc\Controller {
    
    public function indexAction()    {
        echo "<h1>Welcome to GeoPhalcon!</h1>";
        echo '<p>GeoPhalcon is a basic Phalcon PHP API wrapper around the <a href="http://www.geonames.org/">GeoNames</a> locations database.</p>';
        echo '<p>Add API routes to the ApiController</p>';
        echo '<p><a href="http://geophalcon.local/api/primary/4526992/">Primary lookup request</a></p>';
        echo '<p><a href="http://geophalcon.local/api/geoname/US/OH/upper+arlington">Search request</a></p>';
        echo '<p>For benchmarking information visit <a href="http://reidmayo.com">Reidmayo.com</a>.</p>';
    }
    
}