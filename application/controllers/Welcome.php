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
        /*
          $doc = new DOMDocument();
          $doc->load('./data/ScheduleCompleteV2.xml');
          $element = $doc->documentElement;
          $schema = $element->getAttribute('noNamespaceSchemaLocation');
          $doc->schemaValidate($schema);

          $this->render();
         * 
         */
        $doc = new DOMDocument();
        $doc->load('./data/ScheduleCompleteV2.xml');
        $doc->schemaValidate('./data/ScheduleV2.xsd');
// just like DTD...
        libxml_use_internal_errors(true);
        if ($doc->schemaValidate('./data/ScheduleV2.xsd'))
            echo 'Validated against schema successfully';
        else {
            $result = "<b>Oh nooooo...</b><br/>";
            foreach (libxml_get_errors() as $error) {
                $result .= $error->message . '<br/>';
                echo $result;
            }
// do something (display?) With $result
        }
    }

    function shucks($param) {
        $this->data['pagebody'] = 'justone'; // this is the view we want shown
        $record = $this->quotes->get(2);
        $this->data = array_merge($this->data, $record);
        $this->render();
    }

}

/* End of file Welcome.php */
/* Location: application/controllers/Welcome.php */