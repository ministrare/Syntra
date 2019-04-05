<?php

class Homepage_Controller extends TinyMVC_Controller
{
    function index()
    {
        // Long notation
        // $this->view->assign('title', 'Hello World 3');
        // $this->view->assign('body', 'Hello World body');

        // Short notation
        // $data['title'] = "Hello world 3";
        // $data['body'] = "Hello World body";
        // $this->view->assign($data);

        // Shortest notation
        // $this->view->display('hello_view', $data);


        // Using a model in our controller
        // Loading the model Page_Model
        $this->load->model('Page_Model', 'page');
        // Alternately, specify the connection pool (default is 'default')
        // $this->load->model('Page_Model', 'page', null, 'mypool');

        // Use the model to gather data
        $data['title'] = $this->page->get_title();
        $data['body'] = $this->page->get_userName()[0]["name"];

        $this->view->display('hello_view', $data);



    }
}