<?php

/**
 * Our homepage. Show a table of all the author pictures. Clicking on one should show their quote.
 * Our quotes model has been autoloaded, because we use it everywhere.
 * 
 * controllers/Welcome.php
 *
 * ------------------------------------------------------------------------
 */
class Welcome extends Application {

    function __construct() {
        parent::__construct();
    }

    //-------------------------------------------------------------
    //  The normal pages
    //-------------------------------------------------------------

    function index() {
        $this->data['pagebody'] = 'homepage';
        $panel = array();

        $doc = new DOMDocument();
        $doc->load('./data/ScheduleCompleteV2.xml');
        $doc->schemaValidate('./data/ScheduleV2.xsd');

        libxml_use_internal_errors(true);
        if ($doc->schemaValidate('./data/ScheduleV2.xsd')) {
            $panel[] = array('message' => 'Validated against schema successfully');
        } else {
            $result = "<b>Oh nooooo...</b><br/>";
            foreach (libxml_get_errors() as $error) {
                $result .= $error->message . '<br/>';
                
            }
        }
        if($result) $panel[] = array('message' => $result);
        $this->data['panel'] = $panel;
        $this->render();
    }

}

/* End of file Welcome.php */
/* Location: application/controllers/Welcome.php */