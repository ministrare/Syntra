<?php

class Page_Model extends TinyMVC_Model
{
    public function get_title()
    {
        return "Hello World 4";
    }

    public function get_body_text()
    {
        return "Hello World baby";
    }
    
    public function get_userName()
    {
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('id',"1");
        $this->db->query();

        while($row = $this->db->next())
        {
            $rows[] = $row;
        }
        return $rows;
    }
}
